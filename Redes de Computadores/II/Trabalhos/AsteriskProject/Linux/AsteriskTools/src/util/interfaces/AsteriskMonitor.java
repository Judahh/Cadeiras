/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.interfaces;

import java.util.List;

/**
 *
 * @author judah
 */
public interface AsteriskMonitor {
    public List<String>[] getAgents();
    
    public List<String>[] getCoreShowChannels();
    
    public List<String>[] getIax();
    
    public List<String>[] getSip();
    
    public List<String>[] getQueues();
}
