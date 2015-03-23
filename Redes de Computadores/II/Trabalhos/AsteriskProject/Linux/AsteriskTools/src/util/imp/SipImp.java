/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.interfaces.Sip;

/**
 *
 * @author judah
 */
public class SipImp extends CommonImp implements Sip{

    public SipImp(){
        try {
            init();
        } catch (Exception ex) {
        }
    }
    
    public void init() throws FileNotFoundException, IOException {
        super.readFile(new File("/etc/asterisk/sip.conf"));
    }
}
