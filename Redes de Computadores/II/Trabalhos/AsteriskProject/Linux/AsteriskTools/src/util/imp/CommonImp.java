/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import model.AsteriskFileModel;
import util.interfaces.Common;

/**
 *
 * @author judah
 */
public abstract class CommonImp extends AsteriskFileImp implements Common {
    @Override
    public String getVariableValue(String sessionName, String name){
        if(sessionName.equals(null)||sessionName.isEmpty()){
            return null;
        }
        if(name.equals(null)||name.isEmpty()){
            return null;
        }
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (name.equals(fileModel.getSession(sessionName).getVariable(i).getName())) {
                return fileModel.getSession(sessionName).getVariable(i).getValue();
            }

        }
        return null;
        
    }
    
    @Override
    public void setVariable(String sessionName, String oldName, String name, String value) {
        if(sessionName.equals(null)||sessionName.isEmpty()){
            return;
        }
        if(oldName.equals(null)|oldName.isEmpty()){
            return;
        }
        if(name.equals(null)||name.isEmpty()){
            return;
        }
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (oldName.equals(fileModel.getSession(sessionName).getVariable(i).getName())) {
                fileModel.getSession(sessionName).setVariable(i, name, value);
                return;
            }

        }
    }
    
    @Override
    public void setVariable(String sessionName, String oldName, String value) {
        if(sessionName.equals(null)||sessionName.isEmpty()){
            return;
        }
        if(oldName.equals(null)||oldName.isEmpty()){
            return;
        }
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (fileModel.getSession(sessionName).getVariable(i).getName().equals(oldName)) {
                fileModel.getSession(sessionName).setVariable(i, oldName, value);
                return;
            }

        }
    }

    @Override
    public void removeVariable(String sessionName, String name, String value) {
        if(sessionName.equals(null)||sessionName.isEmpty()){
            return;
        }
        if(name.equals(null)||name.isEmpty()){
            return;
        }
        for (int i = 0; i < fileModel.getSession(sessionName).getVariableList().size(); i++) {
            if (fileModel.getSession(sessionName).getVariable(i).getName().equals(name)) {
                fileModel.getSession(sessionName).removeVariable(i);
                return;
            }

        }
    }
}
