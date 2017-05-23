/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.AsteriskFileModel;
import model.AsteriskSessionModel;
import util.AsteriskManager;
import util.SystemDate;
import util.interfaces.AsteriskFile;
import view.MainWindow;

/**
 *
 * @author judah
 */
public abstract class AsteriskFileImp implements AsteriskFile {

    private String previousFileContent;
    public AsteriskFileModel fileModel;
    

    protected void readFile(File file) throws FileNotFoundException, IOException {
        try (BufferedReader in = new BufferedReader(new FileReader(file))) {
            String str = "";
            previousFileContent = "";
            while (in.ready()) {
                String a = in.readLine();
                previousFileContent += a + "\n";

                if (a.contains(";")) {
                    if (a.startsWith(";")) {
                        a = "";
                    } else {
                        a = a.split(";")[0].trim() + "";
                    }
                } else {
                    a = a.trim();
                }

                if ((!a.isEmpty()) && (!"".equals(a))) {
                    str += "" + a + "\n";
                }
            }
            fileModel = new AsteriskFileModel(file.getName(), file.getAbsolutePath(), str);
        } catch (IOException ex) {
            Logger.getLogger(MainWindow.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    @Override
    public void addSession(String session) {
        fileModel.addSession(session, "");
    }

    @Override
    public void addVariable(String sessionName, String name, String value) {
        fileModel.getSession(sessionName).addVariable(name, value);
    }

    @Override
    public void setSession(String name, String newName) {
        fileModel.getSession(name).setName(newName);
    }

    @Override
    public String getVariableName(String sessionName, int id){
        return fileModel.getSession(sessionName).getVariable(id).getName();
        
    }
    
    @Override
    public String getVariableValue(String sessionName, int id){
        return fileModel.getSession(sessionName).getVariable(id).getValue();
        
    }
    
    @Override
    public void setVariable(String sessionName, int id, String value){
        fileModel.getSession(sessionName).setVariable(id, fileModel.getSession(sessionName).getVariable(id).getName(), value);
    }
    
    @Override
    public void setVariable(String sessionName, int id, String name, String value) {
        fileModel.getSession(sessionName).setVariable(id, name, value);
    }

    @Override
    public void removeSession(String name) {
        fileModel.removeSession(name);
    }
    
    @Override
    public String getSessionName(int i){
        return fileModel.getSession(i).getName();
        
    }
    
    @Override
    public int getNumberOfSessions(){
        AsteriskFileModel va = fileModel;
        if(fileModel != null){
            List<AsteriskSessionModel> list = fileModel.getSessionList();
            if(list != null){
                return list.size();
            }
        }
        return 0;
    }

    @Override
    public void removeVariable(String sessionName, int id) {
        fileModel.getSession(sessionName).removeVariable(id);
    }

    @Override
    public int getVariableListSize(String sessionName) {
        return fileModel.getSession(sessionName).getVariableList().size();
    }

    @Override
    public void updateFile() {
        if (fileModel != null) {
            File file = new File(fileModel.getPath());
            try {
                saveFile(file);
            } catch (IOException ex) {
                try {
                    getPermission(file.getAbsolutePath());
                    saveFile(file);


                } catch (IOException ex1) {
                    Logger.getLogger(MainWindow.class
                            .getName()).log(Level.SEVERE, null, ex1);
                }
            }
        }
    }

    private void saveFile(File file) throws IOException {
        try (BufferedWriter out = new BufferedWriter(new FileWriter(file))) {
            String[] split = previousFileContent.split("\n");
            String fileContent = "";
            for (int i = 0; i < split.length; i++) {
                if (!split[i].isEmpty()) {
                    if (split[i].charAt(0) == ';') {
                        fileContent += split[i] + "\n";
                    } else {
                        fileContent += ";" + split[i] + "\n";
                    }
                }
            }
            SystemDate date = new SystemDate();
            fileContent += ";Generated by AsteriskTools  at " + date.getDateTime() + "\n\n";
            fileContent += fileModel;
            out.write(fileContent);
            refreshAsterisk();
        } catch (IOException ex) {
            try {
                getPermission(file.getAbsolutePath());
                saveFile(file);


            } catch (IOException ex1) {
                Logger.getLogger(MainWindow.class
                        .getName()).log(Level.SEVERE, null, ex1);
            }
            ex.printStackTrace();
        }

    }

    private void getPermission(String absolutePath) throws IOException {
        Runtime run = Runtime.getRuntime();
        String string = new String("pass");
        run.exec("echo " + string + " | sudo -S chmod 777 " + absolutePath + "\r\n\r\n\r\n\r\n");
    }
    
    private void refreshAsterisk() throws IOException {
        AsteriskManager asteriskManager = new AsteriskManager();
        asteriskManager.login();
        asteriskManager.refresh();
    }
}
