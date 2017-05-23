package exercicio4e5;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.List;

import exercicio4e5.AlfabetoCircular;


public class CipherReader extends Reader {

   
    private InputStreamReader inputStreamReader;

    private final AlfabetoCircular alfabeto;

    
    public CipherReader(final InputStreamReader inputStreamReader) {
        this.inputStreamReader = inputStreamReader;
        this.alfabeto = new AlfabetoCircular();
    }

  
    @Override
    public void close() throws IOException {
        inputStreamReader.close();
    }

   
    @Override
    public int read(final char[] cbuf) throws IOException {
        return read(cbuf, 0, cbuf.length);
    }

    @Override
    public int read(final char[] cbuf, final int inicio, final int fim) throws IOException {
        int pos, count = 0;
        char caractere;
        final char tempArray[] = new char[fim];
        inputStreamReader.read(tempArray);

        //Percorrendo o Array de caracteres
        for (final char c : tempArray) {
            caractere = c;
            //Percorrendo as listasCirculares
            for (final List<Character> lista : alfabeto.listasCirculares) {
                //Verificando se o caractere está na listaCircular
                if ((pos = lista.indexOf(c)) > -1) {
                    //Tratamento pra evitar IndexOutOfBoundsException
                    if (pos == 0) {
                        pos = lista.size();
                    }
                    //Se tiver na lista, pega o anterior
                    caractere = lista.get(pos - 1);
                    break;
                }
            }
            //Trocando o caractere
            cbuf[count] = caractere;
            count++;
        }
        return 0;
    }
}
