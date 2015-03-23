/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;


/**
 *
 * @author JH
 */
//Para aparecer no console utilize a Variavel Buffer (+=) main.BufferConsole e Interface.VConsole.setText(BufferConsole) para imprimir.
public class AlgKruskal {
    private int lista [];
    private String Cj [];//vetor de arvores
    static int cost;
    static int [] [] MMatrix;
    static String S;
    private static int [] [] newW;
    static PriorityQueue Q;
    private Grafo Graph=main.G;
    private int size;
    
    public AlgKruskal(){
        S="";// S contém as arestas da MST
        int nV = Graph.getNumberOfVertex();
        Q=new BinaryHeap();
        MMatrix=new int[nV][nV];
        Cj=new String[nV];
        size=nV;
        cost=0;
        for(int i=0;i<nV;i++){
            for(int j=0;j<nV;j++){
                MMatrix[i][j]=Graph.getElement(i,j);//recebe Grafo
            }
        }

        for(int i=1;i<nV;i++){
            for(int j=0;j<i;j++){
                if(MMatrix[i][j]!=Interface.inf){
                    Q.insert(MMatrix[i][j], i, j);//Coloca todas as arestas na fila de prioridade 
                }
            }
        }
        for(int i=0;i<nV;i++){
            Cj[i]=Integer.toString(i); //define uma árvore (componente) trivial
        }
    }
    public void doKruskal(){//aparentemente tá correto...mas dá erro no krt2
        int nV=Graph.getNumberOfVertex();
        String NovaAresta="";

        newW = new int[nV][nV];
        int u=0;
        int v=0;
        String U="";
        String V="";
        //TODO:                               (obs:|S|=numero de Arestas na arvore,|V| numero de vertices
        //while(NumberOfEOfS() < nV - 1) {      //enquanto (|S| < |V| – 1) faça{ //Papel do k...ou seja iterator...ele é modificado no GoToEndActionPerformed e NextActionPerformed na Interface
            NovaAresta = Q.findMinE();        //obtém a aresta de menor peso da fila
            Q.deleteMin();                    //deleta menor valor da fila de prioridade
            boolean first=true;               //atribui valor boleano true
            for(int j = 1; j < NovaAresta.length() - 1; j++){  //percorre de 1 ate o tamanho de NovaAresta -1
                if(NovaAresta.charAt(j) ==','){                //verifica se caractere é uma virgula 
                    first=false;                               //atribui valor booleano
                }else{                                         //se o caractere nao for uma virgula
                    if(first){                                 //se for verdadeiro continua
                        v=v*10+Integer.parseInt(""+NovaAresta.charAt(j));   //converte o caractere para inteiro e atribui a v
                        V+=NovaAresta.charAt(j);                            //coloca o caractere numa string
                    }else{                                                  //se a boleano first for falsa
                        u=u*10+Integer.parseInt(""+NovaAresta.charAt(j));   //converte o caractere para inteiro e atribui a u
                        U+=NovaAresta.charAt(j);                            //coloca o caractere numa string
                    }  
                }  
            }          
            int m=belongs(U);
            int z=belongs(V);
            if(!Cj[m].equals(Cj[z])){
                if("".equals(S)){
                    S=NovaAresta;
                }else{
                    S +=","+NovaAresta;
                }
                
                Cj[m]=Cj[m]+","+Cj[z];   
                Cj[z]="";                    //diminui o número de árvores
                cost+=MMatrix[v][u];         //aumenta o custo
                
            }                                                              
        //}
//        }retorna S
        
    } 
    
    //procura o conjunto ao qual o vertice pertence
    private int belongs(String vec){
        for(int i=0;i<size;i++){
            if(search(Cj[i],vec)!=-1){
                return i;
            }
        }
        return -1;
    }
    //procura em um conjunto um determinado vertice
    private int search(String conj,String vec){
        int m=0;
        boolean k=true;
        for(int i=0;i<conj.length();i++){
            if(conj.charAt(i) ==','){
               m++;  
               k=true;
            }else{
               if(Vertex(conj,i).equals(vec)&&k){
                  return m;
               }else{
                  k=false;
               }
               
            }  
        }
        return -1;
    }
    
    
    // vertex é um determinado vertice de um conjunto
    private String Vertex(String conj,int k){
        String Vertex="";
        for(int i=k;i<conj.length();i++){  //faz um laco enguanto o tamanho de conj for menor que um certo valor k passado
            if(conj.charAt(i) ==','){     // se achar um caractere virgula retorn vertex
               return Vertex;  
            }else{                       //se o caractere nao for uma virgula
               Vertex+=conj.charAt(i);  // atrbui os vertices na string Vertex
            }  
        }
        return Vertex;
    }
    
    //verifica o numero de vertices
    public int NumberOfEOfS(){
        int i=0;
        for(int j=0; j < S.length() - 1; j++){
            
            if( S.charAt(j)=='(' ) //onde tiver comeco de parentese é um vertice
                i++;
            
            
        }
        //TODO percorrer a String S e contar quantos "(" tem (que equivale ao numero de arestas)

        return i;
    }
    
    public int findset(int v){
    
        while ( lista[v] != v)
            v = lista[v];

        return v;
    }

    public void union(int v1, int v2 ){

        if(v1>v2)
            lista[v1]  = v2;
        else
            lista [v2] = v1;
    }

    public void cread_set( int v){

        for( int i = 0; i< v; i++)
            lista[i] = i;
    }

 
    
    
}

