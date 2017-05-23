package exercicio4e5;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.List;

import exercicio4e5.AlfabetoCircular;


public class CipherWriter extends Writer {

   
    private OutputStreamWriter outputStreamWriter;

    private final AlfabetoCircular alfabeto;

   
    public CipherWriter(final OutputStreamWriter outputStreamWriter) {
        this.outputStreamWriter = outputStreamWriter;
        this.alfabeto = new AlfabetoCircular();
    }

   
    @Override
    public void close() throws IOException {
        outputStreamWriter.close();
    }

    @Override
    public void flush() throws IOException {
        outputStreamWriter.flush();
    }
   
    @Override
    public void write(final char[] cbuf) throws IOException {
        write(cbuf, 0, cbuf.length - 1);
    }
   
    @Override
    public void write(final String str) throws IOException {
        write(str, 0, str.length() - 1);
    }
   
    @Override
    public void write(final String str, final int inicio, final int fim) throws IOException {
        write(str.toCharArray(), inicio, fim);
    }

    @Override
    public void write(final char[] cbuf, final int inicio, final int fim) throws IOException {
        int pos;
        char caractere;

        //Percorrendo o Array de caracteres
        for (final char c : cbuf) {
            caractere = c;
            //Percorrendo as listasCirculares
            for (final List<Character> lista : alfabeto.listasCirculares) {
                //Verificando se o caractere está na listaCircular
                if ((pos = lista.indexOf(c)) > -1) {
                    //Tratamento pra evitar IndexOutOfBoundsException
                    if (pos >= lista.size() - 1) {
                        pos = -1;
                    }
                    //Se tiver na lista, pega o próximo
                    caractere = lista.get(pos + 1);
                    break;
                }
            }
            //Escrevendo o caractere
            outputStreamWriter.write(caractere);
        }
    }
}
