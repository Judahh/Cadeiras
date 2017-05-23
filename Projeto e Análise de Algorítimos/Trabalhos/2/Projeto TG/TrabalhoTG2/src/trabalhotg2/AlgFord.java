/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;

import trabalhotg2.Grafo.Aresta;

/**
 *
 * @author JH
 */
//Para aparecer no console utilize a Variavel Buffer (+=) main.BufferConsole e Interface.VConsole.setText(BufferConsole) para imprimir.
/*Algoritmo BellmanFord(G, s)
Entrada: digrafo simples, conexo e ponderado G = (V, E) e vértice-origem s
Saída: árvore de caminhos mínimos de G ou indicação de ciclo negativo
para cada v Î V faça
peso[v] ¬ ¥ //guarda o valor do peso do caminho mínimo de s a v
p[v] ¬ NIL //guarda o vértice mais próximo a v (“pai”)
peso[s] ¬ 0 //para a raiz, o valor do peso é nulo
para i ¬ 1 até |V| - 1 faça //ciclos de relaxamento
Teoria dos Grafos 26
para cada (u, v) Î E //aplica o relaxamento a cada arco de G
se (peso[u] + peso(u,v) < peso[v])
peso[v] ¬ peso[u] + peso(u,v) //atualiza o valor do peso (*)
p[v] ¬ u //atualiza o pai
para cada (u, v) Î E //verifica se ainda é possível relaxar
se (peso[u] + peso(u,v) < peso[v]) //neste caso, há ciclo negativo
retorna (“G contém ciclo negativo!”)
retorna [p[v], peso[v]], "v Î V
*/
public class AlgFord {
        public static int [] [] MMatrix;
        public static int [] [] newW;
        public static boolean NegativeCycleF;
        public static String infinityString="inf";
        public static int infinity=999999999;
        public Grafo Graph=main.G;
        private int provp[];
        private boolean mod[];
        public static int peso[];
        public static int pai[];//falta ajeitar algumas coisas
        public static int s[];
        
        public AlgFord() {
            NegativeCycleF=false;        
            int nV=Graph.getNumberOfVertex();
            pai=new int[nV];
            peso=new int[nV];
            mod=new boolean[nV];
            provp=new int[nV];
            s=new int[nV];
            MMatrix=new int[nV][nV];
            NegativeCycleF=false;
            for(int i=0;i<nV;i++){
                peso[i]=infinity; //coloca todos os pesos com valor maximo
                provp[i]=infinity;//coloca o peso temporario com valor maximo
                mod[i]=false;     //coloca auxiliar para ver se peso foi modificado em falso
                pai[i]=-1;       //nao tem pai
                for(int j=0;j<nV;j++){
                    if(i==0){
                        s[j]=Graph.getElement(i,j);   //retorna elementos do grafo para fila
                    }
                    MMatrix[i][j]=Graph.getElement(i,j);  //retorna um elemento do grafo pra matriz
                }
            }
            peso[0]=0;//peso da raiz igual a 0
            
        }
        //
        public void doFord(int oldW[][],int iterator){
            Graph=main.G;//dá um refresh no graph
            int nV=Graph.getNumberOfVertex();
            int i=iterator;
            if(i<nV){   //se o iterado for menor que o tamanho de vertices
                for(Aresta aresta : Graph.getArestas()){  //percorre as aresta do Grafo
                    if(this.peso[aresta.getV1()]!=infinity){   //verifica se o peso do primeiro vertice nao é maximo
                        if(this.peso[aresta.getV2()]!=infinity){ //verifica se o peso do segundo vertice nao é maximo
                            relax(aresta);   //se os pesos dos 2 vertices nao for maximo, faz o relaxamento
                        }else{
                            //se o vertice 1 apresenta peso e o vertice 2 o peso e maximo, modifica o peso do vertice 2 para valor atribuido
                            relax2(aresta);  //se so o primeiro vertice nao tiver peso maximo faz este ralaxamento
                        }
                    }
                }	
            }else{   //se o iterado passar do tamanho de vertices
                for(Aresta aresta : Graph.getArestas()){  //percorre as aresta do grafo
			//se continuar a existir aresta que pode ser relaxada significa
			//a existencia de um ciclo negativo
			if(this.peso[aresta.getV1()]!=infinity && this.peso[aresta.getV2()]!=infinity){
				if((this.peso[aresta.getV1()]+aresta.getPeso())<this.peso[aresta.getV2()]){
					NegativeCycleF=true;
				}
			}
		}	
            }
            for(int j=0;j<nV;j++){
                if(this.mod[j]){
                    this.peso[j]=this.provp[j];	//passa valor dos pesos do vetor auxiliar para o vetor de pesos dando um reflesh
                }	
            }
        }

        public void relaxamento(int i , int j){  //faz o relaxamento no grafo
    if(this.peso[i]+MMatrix[i][j]<this.peso[j] && MMatrix[i][j]<infinity){//verifica se o peso do 1 vertice com a soma da aresta é menor que o peso do 2 vertice
                    this.peso[j]=this.peso[i]+MMatrix[i][j]; //atribui o peso do 1 vertice com o valor da aresta ao peso do 2 vertice
                    this.pai[j]=i;                           //o pai do 2 vertice é o 1 vertice
                    this.mod[j]=true;                        //diz que peso foi modificado
            }
        }
        
        public void relax(Aresta aresta){  //faz um relaxamento
            if((this.peso[aresta.getV1()]+aresta.getPeso())<this.peso[aresta.getV2()]){//verifica se o peso do 1 vertice com a soma da aresta é menor que o peso do 2 vertice
                    relax2(aresta);//faz um relaxamento
            }
        }
        public void relax2(Aresta aresta){
            this.provp[aresta.getV2()]=this.peso[aresta.getV1()]+MMatrix[aresta.getV1()][aresta.getV2()];//atribui o peso do 2 vertice com o valor da aresta ao peso do 1 vertice
            this.pai[aresta.getV2()]=aresta.getV1(); //o pai do 2 vertice é o 1 vertice
            this.mod[aresta.getV2()]=true;           //diz que peso foi modificado

        }
        
}
