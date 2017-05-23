/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;

/**
 * Exception class for access in empty containers
 * such as stacks, queues, and priority queues.
 * @author JH
 */
public class UnderflowException extends RuntimeException {
    /**
     * Construct this exception object.
     * @param message the error message.
     */
    public UnderflowException( String message ) {
        super( message );
    }
}
