/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author judah
 */
public class AsteriskFileModel {
    //Estou relendo o arquivo varias vezes pois assim a mais facil de tratar/nao tratar a sujeira...

    private String path;
    private String name;
    private List<AsteriskSessionModel> session;

    public AsteriskFileModel(String name, String path) {
        this.name = name;
        System.out.println(name);
        this.path = path;
        System.out.println(path);
        this.session = new ArrayList<>();
    }
    
    public AsteriskFileModel(String name, String path, String text) {
        this.name = name;
        System.out.println(name);
        this.path = path;
        System.out.println(path);
        this.session = new ArrayList<>();
        for (int i = 0; i < text.length(); i++) {
            String aux = "";
            while (isSession(i, text)) {//Existe um problema no extensions quanto a isso....
                aux += text.charAt(i);
                i++;
                if (i >= text.length()) {
                    if (!aux.isEmpty()) {
                        this.session.add(new AsteriskSessionModel(aux));
                    }
                    return;
                }
            }
            if (!aux.isEmpty()) {
                this.session.add(new AsteriskSessionModel(aux));
            }
        }
    }

    private boolean isSession(int i, String text) {
        String aux=text.substring(0, i+1);
        String strArray[]=aux.split("\n");
        String aux1=strArray[strArray.length-1];  
        if(text.charAt(i) == '['){
            if(aux1.contains("=>")){
                return true;
            }else{
                return false;
            }
        }
        return true;
//        return (text.charAt(i) != '[') || ((text.charAt(i) == '[') && (aux1.contains("=>")));
    }

    public void addSession(String name, String info) {
        for (int i = 0; i < getSessionList().size(); i++) {
            if(getSession(i).getName().equals(name)){
                return;
            }
        }
        this.session.add(new AsteriskSessionModel(name, info));
    }

    public void removeSession(String name) {
        for (int i = 0; i < getSessionList().size(); i++) {
            if(getSession(i).getName().equals(name)){
                this.session.remove(i);
                return;
            }
        }
    }
    
    public void removeSession(int i) {
        this.session.remove(i);
    }

    public String getName() {
        return name;
    }

    public List<AsteriskSessionModel> getSessionList() {
        return session;
    }

    public AsteriskSessionModel getSession(String name) {
        for (int i = 0; i < getSessionList().size(); i++) {
            if(getSession(i).getName().equals(name)){
                return session.get(i);
            }
        }
        return null;
    }
    
    public AsteriskSessionModel getSession(int i) {
        return session.get(i);
    }

    public String getPath() {
        return path;
    }

    @Override
    public String toString() {
        String str = "";
        for (int i = 0; i < session.size(); i++) {
            str += "[" + session.get(i).getName() + "]" + session.get(i).getInfo() + "\n";

            for (int j = 0; j < session.get(i).getVariableList().size(); j++) {
                str += session.get(i).getVariable(j).getName() + "=" + session.get(i).getVariable(j).getValue() + "\n";
            }
            str += "\n";
        }

        return str;
    }
}
