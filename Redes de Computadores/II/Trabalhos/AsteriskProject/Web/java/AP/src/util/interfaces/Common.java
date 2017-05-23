/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.interfaces;


/**
 *
 * @author judah
 */
public abstract interface Common extends AsteriskFile{
    public String getVariableValue(String sessionName, String name);
    
    public void setVariable(String sessionName,String oldName,String value);
    
    public void setVariable(String sessionName,String oldName,String name,String value);
    
    public void removeVariable(String sessionName,String name,String value);
}
