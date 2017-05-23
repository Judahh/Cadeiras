/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import util.interfaces.Agents;

/**
 *
 * @author judah
 */
public class AgentsImp extends AsteriskFileImp implements Agents{
    public AgentsImp(){
        try {
            init();
        } catch (Exception ex) {
        }
    }
    
    public void init() throws FileNotFoundException, IOException {
        super.readFile(new File("/etc/asterisk/agents.conf"));
    }
}
