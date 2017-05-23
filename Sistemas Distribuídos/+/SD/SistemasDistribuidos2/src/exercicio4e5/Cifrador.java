package exercicio4e5;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Scanner;


public class Cifrador {

    public static void main(final String[] args) {
    	Scanner s = new Scanner(System.in);
    	int opcao;
      
    do{	
    	System.out.println("Escolha uma operação a ser realizada\n");
    	System.out.println("1 - CipherWriter");
    	System.out.println("2 - CipherReader");
    	System.out.println();
    	System.out.print("Opção: ");
    	opcao  = s.nextInt();
    	
	    	switch(opcao){
	    	
	    	case 1: try {
					cipherWriter();
				} catch (IOException e) {
					e.printStackTrace();
				} break;
	    	case 2: try {
					cipherReader();
				} catch (IOException e) {
					e.printStackTrace();
				} break;	
	    	default:
	    		System.out.println("Opçaõ invalida");
	    	}
    }while(opcao != 0); 	
    	
    }
    private static void cipherWriter() throws IOException {


        System.out.print("Digite o texto para a ser cifrado pelo CipherWriter [5 caracteres]: ");

        final char temp[] = new char[5];

        final InputStreamReader inputStreamReader = new InputStreamReader(System.in);

        inputStreamReader.read(temp);

        System.out.print("Texto cifrado: ");

        // Escrevendo o texto de forma cifrada
        final OutputStreamWriter osw = new OutputStreamWriter(System.out);
        final CipherWriter cipherWriter = new CipherWriter(osw);
        cipherWriter.write(temp);
        cipherWriter.flush();
        System.out.println();
        
    }

    private static void cipherReader() throws IOException {

        System.out.print("Digite o texto a ser decifrado pelo CipherReader [5 caracteres]: ");

        final char temp[] = new char[5];

        // Lendo o texto de forma cifrada
        final InputStreamReader inputStreamReader = new InputStreamReader(System.in);
        final CipherReader cipherReader = new CipherReader(inputStreamReader);
        cipherReader.read(temp);

        System.out.print("Texto cifrado: ");

        System.out.println(temp);
    }


}
