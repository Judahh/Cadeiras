/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;
// BinaryHeap class
//
// CONSTRUCTION: empty or with initial array.
//
// ******************PUBLIC OPERATIONS*********************
// void insert( x )       --> insere o elemento x na fila Q
// Comparable deleteMin( )--> remove e retorna o elemento de Q com a menor chave
// Comparable findMin( )  --> retorna o elemento de Q com a menor chave
// boolean isEmpty( )     --> retorna se tá vazia
// void makeEmpty( )      --> torna vazia
// ******************ERRORS********************************
// Throws UnderflowException for findMin and deleteMin when empty

/**
 * Implements a binary heap.
 * Note that all "matching" is based on the compareTo method.
 * @author Mark Allen Weiss
 */
public class BinaryHeap implements PriorityQueue {
    /**
     * Constructor default
     */
    private int vertex1[];
    private int vertex2[];
        
    public BinaryHeap(){
        currentSize = 0;
        array = new Comparable[ DEFAULT_CAPACITY + 1 ];
        vertex1 = new int[ DEFAULT_CAPACITY + 1 ];
        vertex2 = new int[ DEFAULT_CAPACITY + 1 ];
    }
    
    /**
     * Constructor
     * @param items the inital items in the binary heap.
     */
    public BinaryHeap(Comparable [ ] items){
        currentSize = items.length;
        array = new Comparable[ items.length + 1 ];
        System.arraycopy(items, 0, array, 1, items.length);
        buildHeap( );
    }
    
    /**
     * Insere da fila de prioridade.
     * Repetidos são permitidos =)
     * @param x the item to insert.
     * @return null, signifying that decreaseKey cannot be used.
     */
    
    
   public void addElement(int position,Comparable weight,int v1,int v2){
        array[ position ] = weight;
        vertex1[ position ] = v1;
        vertex2[ position ] = v2;  
    }
    
    //adiciona elemento na fila e respectivos vertices
   public void Comparar(int position,Comparable weight){
        for( ; weight.compareTo( getArray()[ position / 2 ] ) < 0; position/= 2 ){
            array[ position ] = getArray()[ position / 2 ];
            vertex1[ position ] = getVertex1()[ position / 2 ];
            vertex2[ position ] = getVertex2()[ position / 2 ];
        }
   }
   
   
   //adiciona elemento a fila de prioridade
    @Override
    public PriorityQueue.Position insert( Comparable x ,int v1,int v2) {
        if( currentSize + 1 == getArray().length ) //compara tamanho da fila com o tamanho atual
            doubleArray( );
        // Percolate up
        int hole = ++currentSize;  //aumenta tamanho atual
        addElement(0,x,v1,v2);     //adiciona elemento na fila
        for( ; x.compareTo( getArray()[ hole / 2 ] ) < 0; hole/= 2 ){ //faz uma iteracao e adiciona na fila e respectivos vertices
            array[ hole ] = getArray()[ hole / 2 ];
            vertex1[ hole ] = getVertex1()[ hole / 2 ];
            vertex2[ hole ] = getVertex2()[ hole / 2 ];
        }
        addElement(hole,x,v1,v2); //adiciona elemento na fila
        //array[ hole ] = x;
        //vertex1[ hole ] = v1;
        //vertex2[ hole ] = v2;
        
        return null;
    }
    
    
    
    /**
     * @throws UnsupportedOperationException pq nenhuma posição é retornada
     * pelo metodo de insersão.
     */
    @Override
    public void decreaseKey( PriorityQueue.Position p, Comparable newVal ) {
        throw new UnsupportedOperationException( "Cannot use decreaseKey for binary heap" );
    }
    /**
     * Método para testes.
     * @return i item.
     * @throws UnderflowException if empty.
     */
    @Override
    public Comparable getElement(int i) {
        if( isEmpty( ) )
            throw new UnderflowException( "Empty binary heap" );
        return getArray()[ i ];
    }
    
    /**
     * retorna o elemento de Q com a menor chave
     * @return the smallest item.
     * @throws UnderflowException if empty.
     */
    @Override
    public String findMinE(){
        String e="(";
        e+=Integer.toString(getVertex1()[1]);
        e+=",";
        e+=Integer.toString(getVertex2()[1]);
        e+=")";
        if( isEmpty( ) )
            throw new UnderflowException( "Empty binary heap" );
        return e;
    }
    
    @Override
    public String QueueString(){
        String e="(";
        for(int i=0;i<size();i++){
            e+=getArray()[i];
            if(i!=size()-1){
                e+=",";
            } 
        }
        e+=")";
        if( isEmpty( ) )
            e="";
        return e;
    }
    
    /**
     * retorna o elemento de Q com a menor chave
     * @return the smallest item.
     * @throws UnderflowException if empty.
     */
    public Comparable findMin( ) {
        if( isEmpty( ) )
            throw new UnderflowException( "Empty binary heap" );
        return getArray()[ 1 ];
    }
    
    /**
     * remove e retorna o elemento com a menor chave
     * @return the smallest item.
     * @throws UnderflowException if empty.
     */
    public Comparable deleteMin( ) {
        Comparable minItem = findMin( );
        array[ 1 ] = getArray()[ currentSize ];
        vertex1[ 1 ] = getVertex1()[ currentSize ];
        vertex2[ 1 ] = getVertex2()[ currentSize-- ];
        percolateDown( 1 );
        return minItem;
    }
   
    /**
     * Estabelecer verificar e fazer com que fique heap a partir de uma ordem arbitrária.
     */
    private void buildHeap( ) {
        for(int i=currentSize/2;i>0;i--)
            percolateDown( i );
    }
   
    /**
     * Verificar se a fila tá vazia(mesma parada da do make empty,não tá de fato lima..e talz)
     * @return true if empty, false otherwise.
     */
    public boolean isEmpty( ) {
        return currentSize == 0;
    }
    
    /**
     * Retorna tamanho.
     * @return current size.
     */
    public int size( ) {
        return currentSize;
    }
    
    /**
     * Fazer com que a fila de prioridade fique vazia(obs.:não limpa de fato)
     */
    public void makeEmpty( ) {
        currentSize = 0;
    }
    
    
    
    
   
    private static final int DEFAULT_CAPACITY = 100;
    
    private int currentSize;      // tamanho
    private Comparable [ ] array; // vetor
    
    /**
     * Metodo interno para percorrer para baixo no Heap
     * @param Inicio
     */
    private void percolateDown(int hole) {
        int child;
        Comparable tmp = getArray()[ hole ];
        int tmp1 = getVertex1()[ hole ];
        int tmp2 = getVertex2()[ hole ];
        
        for( ; hole * 2 <= currentSize; hole = child ) {
            child = hole * 2;
            if( child != currentSize && getArray()[ child + 1 ].compareTo( getArray()[ child ] ) < 0 )
                child++;
            if( getArray()[ child ].compareTo( tmp ) < 0 ){
                array[ hole ] = getArray()[ child ];
                vertex1[ hole ] = getVertex1()[ child ];
                vertex2[ hole ] = getVertex2()[ child ];
            }else{
                 break;
            }   
        }
        array[ hole ] = tmp;
        vertex1[ hole ] = tmp1;
        vertex2[ hole ] = tmp2;
    }
    
    /**
     * Método interno para aumentar Vetor.
     */
    private void doubleArray( ) {
        Comparable [ ] newArray;
        int [ ] vec1;
        int [ ] vec2;
        
        newArray = new Comparable[ getArray().length * 2 ];
        vec1= new int[ getArray().length * 2 ];
        vec2 = new int[ getArray().length * 2 ];
        for( int i = 0; i < getArray().length; i++ ){
            newArray[ i ] = getArray()[ i ];
            vec1[ i ] = getVertex1()[ i ];
            vec2[ i ] = getVertex2()[ i ];
        }
        array = newArray;
        vertex1=vec1;
        vertex2=vec2;
    }

    /**
     * @return the vertex1
     */
    public int[] getVertex1() {
        return vertex1;
    }

    /**
     * @return the vertex2
     */
    public int[] getVertex2() {
        return vertex2;
    }

    /**
     * @return the array
     */
    public Comparable[] getArray() {
        return array;
    }

    
}