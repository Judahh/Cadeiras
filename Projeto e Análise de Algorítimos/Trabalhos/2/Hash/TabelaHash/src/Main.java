import br.unifor.hash.EstruturaHash;


public class Main {
	public static void main(String[] args) {
		EstruturaHash e = new EstruturaHash();
		e.addElemento("Helder");
		e.addElemento("Holanda");
		e.addElemento("Ana");
		e.addElemento("Andrea");
		e.addElemento("Ricardo");
		//System.out.println(e.toString());
		System.out.println();
		System.out.println(e.alunosDoIndice('a', 'r', 'h'));
	}
}
