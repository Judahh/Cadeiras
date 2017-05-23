package exercicio1;

import java.io.IOException;
import java.util.Scanner;

public class Exercicio1 {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		Exercicio1 ex = new Exercicio1();

		try {
			ex.testInvertOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void testInvertOutputStream() throws IOException {
		
		Scanner s = new Scanner(System.in);

		String output;

		System.out
				.println("Digite um texto para ser invertido via OutputStream (4 digitos): ");
		output = s.nextLine();

		byte[] b = new byte[output.length()];
		output.getBytes(0, output.length(), b, 0);

		new InvertOutputStream().write(b);
		new InvertOutputStream().write(b, 0, 4);

	}

}
