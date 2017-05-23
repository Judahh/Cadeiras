/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import util.interfaces.Iax;

/**
 *
 * @author judah
 */
public class IaxImp extends CommonImp implements Iax{
    public IaxImp(){
        try {
            init();
        } catch (Exception ex) {
        }
    }
    
    public void init() throws FileNotFoundException, IOException {
        super.readFile(new File("/etc/asterisk/iax.conf"));
    }
}
