package util.interfaces;

import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * Interface responsavel pela manipulacao do arquivo sip.conf
 *
 * @author judah
 */
public abstract interface AsteriskFile {

    /**
     * @param name Identificacao do ramal
     */
    public void addSession(String name);

    /**
     * @param sessionName Ramal
     * @param name Nome da variavel
     * @param value Valor da variavel
     */
    public void addVariable(String sessionName, String name, String value);

    /**
     * Alterar identificacao do ramal
     *
     * @param name Identificacao antiga do ramal
     * @param newName Identificacao nova do ramal
     */
    public void setSession(String name, String newName);
    
    public String getVariableName(String sessionName, int id);
    
    public String getVariableValue(String sessionName, int id);
    
    public String getVariableName(int sessionId, int id);
    
    public String getVariableValue(int sessionId, int id);
    
    public void setVariable(String sessionName, int id, String value);

    public void setVariable(String sessionName, int id, String name, String value);
    
    public void setVariable(int sessionId, int id, String value);

    public void setVariable(int sessionId, int id, String name, String value);

    /**
     * Remover ramal
     *
     * @param name Identificacao do ramal a ser removido
     */
    public void removeSession(String name);
    
    public void removeSession(int id);

    /**
     * Remover ramal
     *
     * @param name Identificacao do ramal
     * @param id Variavel a ser removida
     */
    public void removeVariable(String sessionName, int id);
    
    public void removeVariable(int sessionId, int id);

    public int getVariableListSize(String sessionName);
    
    public int getVariableListSize(int id);

    public String getSessionName(int i);
    
    public String getSessionNameInfo(int i);

    public int getNumberOfSessions();

    public void updateFile();
}
