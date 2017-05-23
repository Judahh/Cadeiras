/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhotg2;
import java.io.*;
/**
 *
 * @author JH
 */
//Para aparecer no console utilize a Variavel Buffer (+=) main.BufferConsole e Interface.VConsole.setText(BufferConsole) para imprimir.
public class AlgFloyd {//Funcionou em todos os testes realizados até agora =)
    //public AlgFloyd(){}
    //private static int matrixSize=0;
    //private static int Rows=0;
    //private static int Columns=0;
    private static int [] [] MMatrix;
    private static int [] [] newW;
    private static String infinityString="inf";
    private static int infinity=999999999;
    private Grafo Graph=main.G;
  
    public AlgFloyd() {
        int nV=Graph.getNumberOfVertex();
        MMatrix=new int[nV][nV];
        for(int i=0;i<nV;i++){
            for(int j=0;j<nV;j++){
                MMatrix[i][j]=Graph.getElement(i,j);
            }
        }
        //doFloydWarshall(DMatrix,iterator);
    }

    public void doFloydWarshall(int oldW[][],int iterator) {//aparentemente tá correto
        Graph=main.G;//dá um refresh no graph
        int k=iterator;
        int nV=Graph.getNumberOfVertex();
        printMatrix(MMatrix,nV, 0);
        newW = new int[nV][nV];
        for (int i = 0; i <nV; i ++) {
            System.arraycopy(oldW[i], 0, newW[i], 0, nV);
        }
        //for (int k = 0; k <nV; k++) {
            for (int i = 0; i <nV; i ++) {//percorrer
                if(iterator!=i){
                    for (int j = 0; j <nV; j ++) {//percorrer
                        if(j!=i && j!=k && newW[i][j]<1){
                            newW[i][j]=oldW[i][iterator]*oldW[iterator][j];
                        }
                    }
                }else{
                    
                }
                
            }
            for (int i = 0; i <nV; i ++) {//percorrer
                for (int j = 0; j <nV; j ++) {//percorrer
                    Graph.setElement(i,j, newW[i][j]);//dá um refresh na matriz
                }
            }
            printMatrix(newW,nV, k + 1);
        //}
    }
    public int getElement (int i,int j) {  //retorna o peso dos vertices passados
        return this.newW[i][j];
    }
    //não utilizado nesse algorítimo
    private int min(int i, int j, int k, int[][] W){
        int d_ij = W[i][j];  //recebe um certo peso da matriz
        int d_ik = W[i][k];  //recebe um certo peso da matriz
        int d_kj = W[k][j];  //recebe um certo peso da matriz
        if (d_ik == infinity || d_kj == infinity) return d_ij; //verifica se esta com peso maximo e retorna o valor de d_ij
        else{
            return (d_ij <= d_ik + d_kj) ? d_ij : d_ik + d_kj; //retorna d_ij se o valor de d_ij for menor ou igual a soma de d_ik + d_kj
        }                                                      //se nao retorna a soma de d_ik + d_kj
    }

    private String pad(int distance) {  
        String value = String.valueOf(distance);  
        int pad = 3 - value.length();  //atribui a pad 3 menos o tamanho de value
        for (int i = 0; i < pad; i ++) {  //laco enguanto for menor a pad
            value = " " + value;          //atribui a cada iteracao o valor de espaco mais value a value
        }
        return value;
    }

    private void printMatrix(int[][] matrix, int matrixSize, int matrixNumber) {
        main.BufferConsole+="\n";
        main.BufferConsole+="Matrix(" + matrixNumber + ") = ";
        main.BufferConsole+="\n";
        main.BufferConsole+=" ";
        System.out.println("Matrix(" + matrixNumber + ") = ");
        for (int i = 0; i < matrixSize; i++) {
            if (i != 0){
                main.BufferConsole+=" ";
                System.out.print(" ");
            }
            main.BufferConsole+="[ ";
            System.out.print("[ ");
            if (matrix[i][0] == infinity){
                main.BufferConsole+=infinityString;
                System.out.print(infinityString);
            }else{
                main.BufferConsole+=pad(matrix[i][0]);
                System.out.print(pad(matrix[i][0]));
            }
            for (int j = 1; j < matrixSize; j++) {
                main.BufferConsole+=", ";
                System.out.print(", ");
                if (matrix[i][j] == infinity){
                    main.BufferConsole+=infinityString;
                    System.out.print(infinityString);
                }
                else{
                    main.BufferConsole+=pad(matrix[i][j]);
                    System.out.print(pad(matrix[i][j]));
                }
            }
            main.BufferConsole+=" ]";
            main.BufferConsole+="\n";
            System.out.println(" ]");
        }
        main.BufferConsole+=" ";
        main.BufferConsole+="\n";
        System.out.println(" ");
        Interface.VConsole.setText(main.BufferConsole);
    }
}