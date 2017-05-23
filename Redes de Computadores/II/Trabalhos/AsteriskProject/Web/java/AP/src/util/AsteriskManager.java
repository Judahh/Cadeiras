/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 *
 * @author judah
 */
public class AsteriskManager {

    private Socket socket;
    public ArrayList<String> nameList;
    public ArrayList<String> infoList;
    private DataOutputStream out;
    private BufferedReader in;
    public int id;
    private String user;
    private String password;
    private String host;
    private int port;

    public AsteriskManager() throws UnknownHostException, IOException {
        this.host = "localhost";
        this.port = 5038;
        socket = new Socket(host, port);
        out = new DataOutputStream(socket.getOutputStream());
        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        id = -1;
    }

    public AsteriskManager(String host, int port) throws UnknownHostException, IOException {
        this.host = host;
        this.port = port;
        socket = new Socket(host, port);
        out = new DataOutputStream(socket.getOutputStream());
        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        id = -1;
    }

    public void disconnect() {
        try {
            this.socket.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public boolean connect() throws IOException {
        socket = new Socket(this.host, this.port);
        out = new DataOutputStream(socket.getOutputStream());
        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        id = -1;
        return connect(this.user, this.password);
    }

    private void refreshArrayList() {
        nameList = new ArrayList();
        infoList = new ArrayList();
        nameList.add("All");
        infoList.add("");
    }

    public void sendAction(String action) throws IOException {
        refreshArrayList();
        String msg = "Action: " + action + "\r\n\r\n";
        byte[] msgBytes = msg.getBytes();
        out.write(msgBytes);
    }

    public void login() throws IOException {
        connect("admin", "admin");
//        connect(host, port);
//        send("Action: Login\r\n");
//        send("username: " + user + "\r\n");
//        send("secret: " + password + "\r\n");
//        send("ActionID: 1\r\n");
//        send("\r\n");
    }

    public boolean connect(String user, String password) throws IOException {
        this.user = user;
        this.password = password;
        login(user, password);
        String msg = "";
        String totalMsg = "";
        while (!totalMsg.contains("Authentication accepted\n")) {
            msg = in.readLine();
            totalMsg += msg + "\n";
            if (totalMsg.contains("Authentication accepted\n")) {
                return true;
            } else if (totalMsg.contains("Authentication failed")) {
                return false;
            }
        }
        return true;
    }

    public void login(String login, String senha) throws IOException {
        boolean Event = true;
        String msg;
        msg = "Login\r\nUsername: " + login + "\r\nSecret: "
                + senha;
        if (!Event) {
            msg = msg + "\r\nEvent: off";
        }
        sendAction(msg);
    }

    public void sendFamily(String action, String family) throws IOException {
        String msg = action + "\r\nFamily: " + family;
        sendAction(msg);
    }

    public void sendFamily(String action, String family, String key) throws IOException {
        String msg = action + "\r\nFamily: " + family + "\r\nKey: " + key;
        sendAction(msg);
    }

    public void sendFamily(String action, String family, String key, String subKey) throws IOException {
        String msg = action + "\r\nFamily: " + family + "\r\nKey: " + key + "/" + subKey;
        sendAction(msg);
    }

    public void sendFamilyWithValue(String action, String family, String key, String val) throws IOException {
        String msg = action + "\r\nFamily: " + family + "\r\nKey: " + key + ":" + val;
        sendAction(msg);
    }

    public void DBGetInit() throws IOException, InterruptedException {
        Queues();
        nameList.set(0, "<select>");
        for (int i = 0; i < infoList.size(); i++) {
            infoList.set(i, "");
        }
    }

    public void DBGet(String family, String key, String queue) throws IOException, InterruptedException {
        sendFamily("DBGet", family);
        receiveDBGet();
    }

    public void DBGet(String queue) throws IOException, InterruptedException {
        sendFamily("DBGet", "Queue", "PersistentMembers", queue);
        receiveDBGet();
    }

    public void ListCommands() throws IOException, InterruptedException {
        String msg = "ListCommands";
        sendAction(msg);
        receiveListCommands();
    }

    public void CoreShowChannels() throws IOException, InterruptedException {
        String msg = "CoreShowChannels";
        sendAction(msg);
        receiveCoreShowChannels();
    }

    public void Queues() throws IOException, InterruptedException {
        String msg = "Queues";
        sendAction(msg);
        receiveQueues();
    }

    public void Agents() throws IOException {
        String msg = "Agents";
        sendAction(msg);
        receiveAgents();
    }

    public void SIPpeers() throws IOException {
        String msg = "SIPpeers";
        sendAction(msg);
        receiveSIPpeers();
    }

    public void IAXpeers() throws IOException {
        String msg = "IAXpeerlist";
        sendAction(msg);
        receiveIAXpeers();
    }

    private void receiveListCommands() throws IOException {
        String msg = "";
        String totalMsg = "";
        int c = 0;
        while (c < 2) {
            msg = in.readLine();
            if (msg.length() > 3) {
                totalMsg += "-" + msg + "\n";
            } else {
                c++;
            }
        }
        infoList.set(0, totalMsg);
    }

    private void receiveDBGet() throws IOException {
        String msg = "";
        String totalMsg = "";
        while ((!totalMsg.contains("\n\n")) || (!totalMsg.contains("Val:"))) {
            msg = in.readLine();
            System.out.println(msg);
            totalMsg += msg + "\n";
        }
        SplitDBGet(totalMsg);
    }

    private void receiveCoreShowChannels() throws IOException {
        String msg = "";
        String totalMsg = "";
        while (!totalMsg.contains("Event: CoreShowChannelsComplete")) {
            msg = in.readLine();
            totalMsg += msg + "\n";
        }
        SplitShowChannels(totalMsg);
    }

    private void receiveQueues() throws IOException {
        String msg = "";
        String totalMsg = "";
        while (!totalMsg.contains("\n\n\n")) {
            msg = in.readLine();
            System.out.println(msg);
            totalMsg += msg + "\n";
        }
        SplitQueues(totalMsg);
    }

    private void receiveAgents() throws IOException {
        String msg = "";
        String totalMsg = "";
        while (!msg.equals("Event: AgentsComplete")) {
            msg = in.readLine();
            System.out.println(msg);
            totalMsg += msg;
            totalMsg += "\n";
        }
        SplitAgents(totalMsg.split("Event: AgentsComplete")[0]);
    }

    private void receiveSIPpeers() throws IOException {
        String msg = "a";
        String totalMsg = "";
        while (!msg.equals("EventList: Complete")) {
            msg = in.readLine();
            totalMsg += msg;
            totalMsg += "\n";
        }
        SplitPeers(totalMsg.split("Event: PeerlistComplete")[0]);
    }

    private void receiveIAXpeers() throws IOException {
        String msg;
        String totalMsg = "";
        do {
            msg = in.readLine();
            totalMsg += msg;
            totalMsg += "\n";
        } while (!msg.equals("Event: PeerlistComplete"));
        SplitPeers(totalMsg.split("Event: PeerlistComplete")[0]);
    }

    private void SplitDBGet(String totalMsg) {
        String msg = totalMsg.substring(totalMsg.indexOf("Val:") + 5);
        String msgParts[] = msg.split(";");
        msg = "";
        for (int i = 0; i < msgParts.length; i++) {
            msg += msgParts[i] + "\n";
        }

        if (infoList.size() == 0) {
            infoList.add(msg);
        } else {
            infoList.set(0, msg);
        }
    }

    private void SplitShowChannels(String totalMsg) {
        String[] msgParts = totalMsg.split("Event: CoreShowChannel\n");
        String allNames = "";
        for (int iterator = 0; iterator < msgParts.length; iterator++) {
            if (iterator > 0) {
                String aux = msgParts[iterator].split("\n\n")[0];
                insertInfo(aux, "Channel: ", "BridgedChannel: ", "Application: ", "Duration: ");
            }
        }

        for (int i = 1; i < infoList.size(); i++) {
            String tempName = "SRC:" + infoList.get(i).split("Channel: ")[1].split("-")[0];
            //nameList.add(tempName);
            tempName += "\tDST:" + infoList.get(i).split("BridgedChannel: ")[1].split("-")[0];
            allNames += tempName + "\n";
        }
        infoList.set(0, allNames);
    }

    private void SplitQueues(String totalMsg) {
        String[] queues = totalMsg.split("\n\n");
        String allNames = "";
        for (int i = 0; i < queues.length; i++) {
            if (queues[i].length() > 5) {
                String info = "";
                if (queues[i].charAt(0) == '\n') {
                    queues[i] = queues[i].substring(1);
                }
                String tempName = queues[i].split(" has")[0];
                String aux = queues[i].split("max unlimited")[0];
                info = aux.substring(0, aux.length() - 1);
                info += "\nMembers:\n";
                if (queues[i].contains("Callers")) {
                    String[] auxA = queues[i].split("Members:")[1].substring(2)
                            .split("SIP/");
                    for (int j = 1; j < auxA.length; j++) {
                        info += "  SIP/" + auxA[j].split("has")[0] + "\n";
                    }

                    auxA = queues[i].split("Members:")[1].substring(2).split(
                            "IAX2/");
                    for (int j = 1; j < auxA.length; j++) {
                        info += "  IAX2/" + auxA[j].split("has")[0] + "\n";
                    }
                    auxA = queues[i].split("Members:")[1].substring(2).split(
                            "Agent/");
                    for (int j = 1; j < auxA.length; j++) {
                        info += "  Agent/" + auxA[j].split("has")[0] + "\n";
                    }
                    nameList.add(tempName);
                    allNames += tempName + "\n";
                    infoList.add(info);
                }
            }
        }
        infoList.set(0, allNames);
    }

    private void SplitAgents(String totalMsg) {
        String[] msgParts = totalMsg.split("Event: Agents\n");
        String allNames = "";
        for (int iterator = 0; iterator < msgParts.length; iterator++) {
            if (iterator > 0) {
                String aux = msgParts[iterator];
                insertAllInfo(aux);
//				insertInfo(aux, "Agent:", "Name:");
            }
        }
        for (int i = 1; i < infoList.size(); i++) {
            String tempName = infoList.get(i).split("Name: ")[1].split("\n")[0];
            nameList.add(tempName);
            allNames += tempName + "\n";
        }
        infoList.set(0, allNames);
    }

    private void SplitPeers(String totalMsg) {
        String[] msgParts = totalMsg.split("Event: PeerEntry\n");
        String allNames = "";
        for (int iterator = 0; iterator < msgParts.length; iterator++) {
            if (iterator > 0) {
                String aux = msgParts[iterator].split("\n\n")[0];
//                insertInfo(aux, "Channeltype:", "ObjectName:", "IPaddress:",
//                        "Status:");
                insertAllInfo(aux);
            }
        }

        for (int i = 1; i < infoList.size(); i++) {
            String tempName = infoList.get(i).split("ObjectName: ")[1].split("\n")[0];
            nameList.add(tempName);
            allNames += tempName + "\n";
        }
        infoList.set(0, allNames);
    }

    private void insertInfo(String msgPart, String... args) {
        String[] infoParts = msgPart.split("\n");
        String aux = "";
        for (int i = 0; i < infoParts.length; i++) {
            for (int j = 0; j < args.length; j++) {
                if ((infoParts[i].contains(args[j])) && (!aux.contains(args[j]))) {
                    aux = aux + infoParts[i] + "\n";
                }
            }
        }
        infoList.add(aux);
    }

    private void insertAllInfo(String msgPart) {
        infoList.add(msgPart);
    }

    public void main(String[] args) throws IOException {
        new AsteriskManager();
        this.login();
        this.refresh();
    }

    public void refresh() throws IOException {
        sendAction("Reload");// + "\r\n"
        //+ "Module: all" + "\r\n"
        //+ "ActionID: 123456");
        String msg = "";
        while (!(msg.contains("Message: Module Reloaded") || msg.contains("Message: Module does not support reload"))) {
            msg = in.readLine();
            System.out.println(msg);
        }
        System.out.println("END");
    }

    private void dial(String extension, String number)
            throws IOException {

        sendAction("Originate\r\n"
                + "Channel: SIP/" + extension
                + "Exten: " + number + "\r\n"
                + "Context: from-internal\r\n"
                + "Priority: 1\r\n"
                + "Async: yes");
    }
}
