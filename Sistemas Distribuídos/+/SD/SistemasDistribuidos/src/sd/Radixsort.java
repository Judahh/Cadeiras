package sd;

public class Radixsort {
	
	public static Integer[] sort(Integer[] arr) {
		Fila[] filas;
		filas = new Fila[10];
		
		// Instancia as filas
		for (int i = 0; i < filas.length; i++) {
			filas[i] = new Fila(arr.length);
		}
		int maior = arr[0];
		int tamMaior = 0;
		int numDividir = 1;
		int cont = 0; 
		// Guarda o maior número
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] > maior) {
				maior = arr[i];
			}
		}
		// Guarda o número de algarismos do maior número
		int aux = maior;
		while (aux / 10 > 0) {
			tamMaior++;
			aux = aux / 10;
		}
		tamMaior++;
		for (int j = 0; j < tamMaior; j++) {
	
			// Insere na fila correta
			for (int i = 0; i < arr.length; i++) {
				filas[(arr[i] / numDividir) % 10].inserir(arr[i]);
			}
			
			// Joga os valores para o vetor
			cont = 0;
			for (int k = 0; k < filas.length; k++) {
				for (int i = 0; i < filas[k].vet.length; i++) {
					if (filas[k].vet[filas[k].comeco] == null) {
						filas[k].comeco = 0;
						break; 
					} else {
						arr[cont++] = filas[k].removerProximo();
					}
				}
			}
			numDividir = numDividir * 10;
		}
		return arr;
	}

	private static class Fila {
		Integer vet[];
		int tamPreenchido;
		int comeco = 0;

		public Fila(int tam) {
			vet = new Integer[tam];
			tamPreenchido = 0;
		}

		public void inserir(int num) {
			vet[tamPreenchido] = num;
			tamPreenchido++;
		}

		public Integer removerProximo() {
			Integer removido = vet[comeco];
			vet[comeco] = null;
			comeco++;
			tamPreenchido--;
			return removido;
		}
	}
}