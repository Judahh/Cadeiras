package sd;

import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Scanner;

public class Aplicacao {
	
	public static Integer[] Cadastro(int n){
		Random random = new Random();
		Integer x[] = new Integer[n];
		
		// Carregando os números no vetor.
		for (int i = 0; i < x.length; i++) {
			x[i] = random.nextInt(25000);
			//x[i] = x.length -1 -i;
		}
		
		return x;
	}
	
	public static Integer[] valor;
	
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.println("Quantos numeros deseja ordenar? (O vetor será criado com variação de 250.000 elementos)");
		int n = s.nextInt();
		
		System.out.println("Inicializando vetor...");
		
		valor = Cadastro(n);	
		GregorianCalendar inicioInsertion = new GregorianCalendar();
		Insertionsort.sort(valor);
		GregorianCalendar fimInsertion = new GregorianCalendar();
		double ResultadoInsertion =  ((fimInsertion.getTimeInMillis() - inicioInsertion.getTimeInMillis()) / 1000.0);
		
		valor = Cadastro(n);
		GregorianCalendar inicioHeap = new GregorianCalendar();
		Heapsort.sort(valor);
		GregorianCalendar fimHeap = new GregorianCalendar();
		double ResultadoHeap = ((fimHeap.getTimeInMillis() - inicioHeap.getTimeInMillis()) / 1000.0);
		
		
		valor = Cadastro(n);
		GregorianCalendar inicioQuick = new GregorianCalendar();
		Quicksort.sort(valor, 0, valor.length - 1); 
		GregorianCalendar fimQuick = new GregorianCalendar();
		double ResultadoQuick =  ((fimQuick.getTimeInMillis() - inicioQuick.getTimeInMillis()) / 1000.0);
		
		valor = Cadastro(n);
		GregorianCalendar inicioMerge = new GregorianCalendar();
		Mergesort.sort(valor); 
		GregorianCalendar fimMerge = new GregorianCalendar();
		double ResultadoMerge =  ((fimMerge.getTimeInMillis() - inicioMerge.getTimeInMillis()) / 1000.0);
		
		valor = Cadastro(n);
		GregorianCalendar inicioRadix = new GregorianCalendar();
		Radixsort.sort(valor);	
		GregorianCalendar fimRadix = new GregorianCalendar();
		double ResultadoRadix =  ((fimRadix.getTimeInMillis() - inicioRadix.getTimeInMillis()) / 1000.0);
		
		valor = Cadastro(n);
		GregorianCalendar inicioTim = new GregorianCalendar();
		Timsort.sort(valor ,new OrdenaInt()); 
		GregorianCalendar fimTim = new GregorianCalendar();
		double ResultadoTim =  ((fimTim.getTimeInMillis() - inicioTim.getTimeInMillis()) / 1000.0);
		
		
		System.out.println("");
		System.out.println("Tempo do InsertionSort em segundos: " + ResultadoInsertion);
		System.out.println("Tempo do QuickSort em segundos: " + ResultadoQuick);
		System.out.println("Tempo do MergeSort em segundos: " + ResultadoMerge);
		System.out.println("Tempo do RadixSort em segundos: " + ResultadoRadix);
		System.out.println("Tempo do TimSort em segundos: " + ResultadoTim);
		System.out.println("Tempo do HeapSort em segundos: " + ResultadoHeap);

		
		/*
		double max = Math.max(ResultadoInsertion, 
			Math.max(ResultadoQuick, 
			Math.max(ResultadoMerge, 
			Math.max(ResultadoRadix, 
			Math.max(ResultadoTim, ResultadoHeap)
		))));
		
		System.out.println("");
		System.out.println("Grafico: ");
		for (int i = 15; i >= 1; i--) {
			System.out.println(
				(15 * (ResultadoInsertion/max) >= i ? "######   " : "         ") +
				(15 * (ResultadoQuick/max)  >= i ? "######   " : "         ") +
				(15 * (ResultadoMerge/max)  >= i ? "######   " : "         ") +
				(15 * (ResultadoRadix/max)  >= i ? "######   " : "         ") +
				(15 * (ResultadoTim/max)  >= i ? "######   " : "         ") +
				(15 * (ResultadoHeap/max)  >= i ? "######   " : "         ")
			);
		}
		System.out.println("   I        Q        M        R        T        H");*/
	}	 
}