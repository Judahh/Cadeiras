/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;
import java.lang.SecurityException;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.File;
import java.lang.IllegalStateException;
import java.util.NoSuchElementException;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
/**
 *
 * @author JH
 */
public class Grafo {//verificar o V3
  public static class Aresta {
        private int v1, v2, peso;
        public Aresta(int v1, int v2, int peso) {
		super();
		this.v1 = v1;
		this.v2 = v2;
		this.peso = peso;
	}

	public int getV1() {
		return v1;
	}

	public void setV1(int v1) {
		this.v1 = v1;
	}

	public int getV2() {
		return v2;
	}

	public void setV2(int v2) {
		this.v2 = v2;
	}

	public int getPeso() {
		return peso;
	}

	public void setPeso(int peso) {
		this.peso = peso;
	}
  }
  static final int INF = 999999999;
  private int mat[][];
  private int numVertices;
  private int numArestas;
  private int pos[];
  public Grafo () {
  }
  public Grafo (int numVertices) {
    this.mat = new int[numVertices][numVertices];
    this.pos = new int[numVertices];
    this.numVertices = numVertices;
    for (int i = 0; i < this.numVertices; i++) {
      for (int j = 0; j < this.numVertices; j++) this.mat[i][j] = 0;
      this.pos[i] = -1;
    }
  }
  public Grafo (int numVertices, int numArestas) {
    this.mat = new int[numVertices][numVertices];
    this.numArestas=numArestas;
    this.pos = new int[numVertices];
    this.numVertices = numVertices;
    for (int i = 0; i < this.numVertices; i++) {
      for (int j = 0; j < this.numVertices; j++) this.mat[i][j] = 0;
      this.pos[i] = -1;
    }
  }
  public void MakeGraph (int numVertices) {
    this.mat = new int[numVertices][numVertices];
    this.pos = new int[numVertices];
    this.numVertices = numVertices;
    for (int i = 0; i < this.numVertices; i++) {
      for (int j = 0; j < this.numVertices; j++) this.mat[i][j] = 0;
      this.pos[i] = -1;
    }
  }
  
  public ArrayList<Aresta> getArestas() {
    ArrayList<Aresta> arestas = new ArrayList<Aresta>();

    //percorre a matriz
    for(int i=0;i<numVertices;i++){
        for(int j=0;j<numVertices;j++){
            if(i!=j && this.mat[i][j]!=INF){
                arestas.add(new Aresta(i,j,this.mat[i][j]));
            }    
        }
    }

    return arestas;
  }
	
  public int numArestas(){		
    this.numArestas= 0;
    //percorre o grafo, adcionando 1 ao contador quando
    //o valor não for 0 (diagonal) ou inf (não existe aresta)
    for(int i=0;i<numVertices;i++){
        for(int j=0;j<numVertices;j++){
            if(i!=j && this.mat[i][j]!=INF){
                this.numArestas++;
            }   
        }
    }

    return numArestas;
  }
  
  public void setElement (int i,int j,int e) {
    this.mat[i][j]=e;
    refresh();
  }
  public void refresh() {
    //recalcula a quantidade de arestas e pesos
  }
  public int getNumberOfEdges(){
    return this.numArestas;
  }
  public int getNumberOfVertex(){
    return this.numVertices;
  }
  public int getElement (int i,int j) {
    return this.mat[i][j];
  }
  public void SaveFile(String g) throws IOException{
       BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
       //System.out.println("Digite o nome do arquivo:");
       //String entrada = in.readLine();
       //String a;// = "Arquivos//Grafo.txt";
       //a="Arquivos//"+"Grafo"+".txt";
       //String a = "Arquivos//Grafo.txt";
       int tam = this.numVertices;
       int matriz[][];
       matriz = new int[tam][tam];
       try{
         //coloca o diretorio na parte do nome dos Grafo.txt
         FileWriter writer = new FileWriter(new File(g));
         PrintWriter saida = new PrintWriter(writer);
         for(int z=0;z<tam;z++){
           for(int x=0;x<tam;x++){
             matriz[z][x] = this.mat[z][x];
           }
         }
         //escreve o tamanho 1 linha
         saida.println(tam);
         //escreve a matriz nas outras linhas
         for(int i=0;i<tam;i++){
           if(i>0)
               saida.println("");
           for(int j=0;j<tam;j++){
               if(matriz[i][j]==INF)
                   saida.print("inf"+" ");
               else
                   saida.print(matriz[i][j]+" ");

           }
         }
         saida.close();
         writer.close();
       }
       catch(IllegalStateException stateException){
           System.err.println("Erro ao ler o arquivo");
           System.exit(1);
       }

       catch(FileNotFoundException fileNotFoundException){
           System.err.println("Arquivo nao encontrado");
           System.exit(1);
       }

  }
  public void LoadFile(String c) throws IOException{
       Scanner sc = new Scanner(System.in);
       BufferedReader ler;
       int NumeroDeVertices=0;
       int m=0;
       int aux=0;
       String matriz;
       BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
       //System.out.println("Digite o nome do arquivo:");
       //String entrada = in.readLine();
       //String c;// = "Arquivos//Grafo.txt";
       //c="Arquivos//"+entrada+".txt";
       //int matriz[][];
       try{
           //antes do grafo foloqye o diretorio para a leitura
           ler = new BufferedReader(new FileReader(c));
           //ler o tamanho 1 linha
           NumeroDeVertices = Integer.parseInt(ler.readLine());
           this.numVertices=NumeroDeVertices;
           this.mat = new int[NumeroDeVertices][NumeroDeVertices];
           String w="";
           char w2;
           //le a matriz
           for(int i =0;i<NumeroDeVertices;i++){
              matriz =ler.readLine();
              m=0;
              w="";
              boolean n=false; 
              for(int j =0;j<matriz.length();j++){
                  aux=m;
                  if(matriz.charAt(j)==' '){
                      m=m+1;
                      n=false;
                  }
                  if(m!=aux){
                      w="";
                  }
                  if(matriz.charAt(j)!=' '){
                     if(matriz.charAt(j)=='-'){
                         n=true;
                     }else{
                         w2=matriz.charAt(j);
                         w +=w2;
                     } 
                  }
                  if(w==""){

                  }else{
                      if("inf".equals(w)||"in".equals(w)||"i".equals(w)){
                          this.mat[i][m]=INF;
                      }else{                         
                          if(n){
                              this.mat[i][m]=-Integer.parseInt(w);
                          }else{
                              this.mat[i][m]=Integer.parseInt(w);
                          }
                      }    
                  }

              }
           }
           //imprime matriz
           ler.close();

       }
       catch(IllegalStateException stateException){
            System.err.println("Erro ao ler o arquivo");
            System.exit(1);
       }
       catch(FileNotFoundException fileNotFoundException){
            System.err.println("Arquivo nao encontrado");
            System.exit(1);
       }
  }
}
