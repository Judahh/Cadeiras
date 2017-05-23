package exercicio2;

import java.io.IOException;

public class Exercicio2 {

	@SuppressWarnings("static-access")
	public static void main(final String[] args) {

		Exercicio2 ex = new Exercicio2();
		
		try {
			ex.testInvertInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static void testInvertInputStream() throws IOException {

		// Criando o InputStream invertido
		final InvertInputStream invertInputStream = new InvertInputStream(
				System.in);

		final byte[] bytes = new byte[4];

		System.out.println("Digite um texto para ser invertido via InputStream: ");
		
		// Lendo o texto de forma invertida
		invertInputStream.read(bytes);

		// Escrevendo o texto
		System.out.println("Texto invertido: " + new String(bytes));

	}

}
