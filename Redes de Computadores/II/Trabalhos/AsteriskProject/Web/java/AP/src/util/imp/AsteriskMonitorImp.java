/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util.imp;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import util.AsteriskManager;
import util.interfaces.AsteriskMonitor;

/**
 *
 * @author judah
 */
public class AsteriskMonitorImp implements AsteriskMonitor {

    private AsteriskManager manager;

    @Override
    public List<String>[] getQueues() {
        List<String>[] temp;
        temp = new ArrayList[2];
        try {
            manager=new AsteriskManager();
        } catch (UnknownHostException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            manager.login();
            try {
                manager.Queues();
                temp[0] = manager.nameList;
                temp[1] = manager.infoList;
                manager.disconnect();
                return temp;
            } catch (InterruptedException ex) {
                Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<String>[] getAgents() {
        List<String>[] temp;
        temp = new ArrayList[2];
        try {
            manager=new AsteriskManager();
        } catch (UnknownHostException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            manager.login();
            manager.Agents();
            temp[0] = manager.nameList;
            temp[1] = manager.infoList;
            manager.disconnect();
            return temp;
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<String>[] getSip() {
        List<String>[] temp;
        temp = new ArrayList[2];
        try {
            manager=new AsteriskManager();
        } catch (UnknownHostException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            manager.login();
            manager.SIPpeers();
            temp[0] = manager.nameList;
            temp[1] = manager.infoList;
            manager.disconnect();
            return temp;
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<String>[] getIax() {
        List<String>[] temp;
        temp = new ArrayList[2];
        try {
            manager=new AsteriskManager();
        } catch (UnknownHostException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            manager.login();
            manager.IAXpeers();
            temp[0] = manager.nameList;
            temp[1] = manager.infoList;
            manager.disconnect();
            return temp;
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<String>[] getCoreShowChannels() {
        List<String>[] temp;
        temp = new ArrayList[2];
        try {
            manager=new AsteriskManager();
        } catch (UnknownHostException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            manager.login();
            manager.CoreShowChannels();
            temp[0] = manager.nameList;
            temp[1] = manager.infoList;
            manager.disconnect();
            return temp;
        } catch (InterruptedException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AsteriskMonitorImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
