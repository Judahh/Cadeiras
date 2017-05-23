/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import util.interfaces.Common;

/**
 *
 * @author judah
 */
public abstract class CommonImp extends AsteriskFileImp implements Common {
    @Override
    public String getVariableValue(String sessionName, String name){
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (fileModel.getSession(sessionName).getVariable(i).getName().equals(name)) {
                return fileModel.getSession(sessionName).getVariable(i).getValue();
            }

        }
        return null;
        
    }
    
    @Override
    public void setVariable(String sessionName, String oldName, String name, String value) {
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (fileModel.getSession(sessionName).getVariable(i).getName().equals(oldName)) {
                fileModel.getSession(sessionName).setVariable(i, name, value);
                return;
            }

        }
    }
    
    @Override
    public void setVariable(String sessionName, String oldName, String value) {
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (fileModel.getSession(sessionName).getVariable(i).getName().equals(oldName)) {
                fileModel.getSession(sessionName).setVariable(i, oldName, value);
                return;
            }

        }
    }

    @Override
    public void removeVariable(String sessionName, String name, String value) {
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (fileModel.getSession(sessionName).getVariable(i).getName().equals(name)) {
                fileModel.getSession(sessionName).removeVariable(i);
                return;
            }

        }
    }
}