import java.util.Scanner;


public class Banco {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ContaCorrente c1 = new ContaCorrente("123",1000.00);
		ContaCorrente c2 = new ContaCorrente("456",450.00);
		c1.debitar(500.00);
		c2.creditar(500);
		System.out.println("Saldo da conta de ORIGEM = r$"+c1.getSaudo());
		System.out.println("Saldo da conta de DESTINO = r$"+c2.getSaudo());
		
		Scanner s = new Scanner(System.in);
		System.out.println("Entre com os dados da Conta Corrente");
		System.out.println("Numero:");
		String numero = s.next();
		System.out.println("Saldo:");
		double saldo = s.nextDouble();
		ContaCorrente c3 = new ContaCorrente(numero,saldo);
		System.out.println("Entre com o Valor do Deposito: ");		//Entrada de valores
		double valor =s.nextDouble();
		c3.creditar(valor);
		System.out.println("Saldo da Conta C3 = R$ "+c3.getSaudo());
		// TODO Auto-generated method stub

	}

}
