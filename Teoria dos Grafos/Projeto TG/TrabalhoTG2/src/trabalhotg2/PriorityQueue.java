/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;

/**
 * 
 * @author JH
 */
public interface PriorityQueue {

    public String findMinE();

    public interface Position {
        /**
         * retorna o valor guardado nessa posição.
         * @return the value stored at this position.
         */
        Comparable getValue( );
    }

    
    Position insert( Comparable x ,int v1,int v2);

    Comparable findMin( );

    Comparable deleteMin( );
    
    String QueueString();
    
    boolean isEmpty( );
    
    void makeEmpty( );
  
    int size( );

    Comparable getElement(int i);
    
    void decreaseKey( Position p, Comparable newVal );
}


