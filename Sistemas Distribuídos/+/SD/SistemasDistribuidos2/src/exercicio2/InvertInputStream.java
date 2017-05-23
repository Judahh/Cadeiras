package exercicio2;

import java.io.IOException;
import java.io.InputStream;

public class InvertInputStream extends InputStream {

    private InputStream inputStream;
    
    public InvertInputStream(final InputStream inputStream) {
        this.inputStream = inputStream;
    }

    @Override
    public int read() throws IOException {
        return inputStream.read();
    }

    @Override
    public int read(final byte[] bytes) throws IOException {
        return read(bytes, 0, bytes.length - 1);
    }

    @Override
    public int read(final byte[] bytes, final int inicio, final int fim) throws IOException {

        //Quantidade total de bytes
        int bytesCount = 0;

        //Variáveis de controle para evitar ArrayIndexOutOfBoundsException
        int realFim = fim;
        int realInicio = inicio;

        //Verificando se o usuário passou um fim maior que o tamanho máximo permitido
        if (realFim + inicio > bytes.length - 1) {
            realFim = bytes.length - 1 - inicio;
        }

        //Verificando se o usuário passou um início menor que 0
        if (realInicio < 0) {
            realInicio = 0;
        }

        //Percorrendo o Array de Bytes de forma invertida
        for (int i = realFim; i >= realInicio; i--) {
            //Lendo o byte
            bytes[i] = (byte) read();
            bytesCount++;
        }

        return bytesCount;
    }
}
