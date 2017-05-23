package sd;

import java.io.Serializable;
import java.util.GregorianCalendar;
import java.util.Random;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class DesempenhoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7669826706033712878L;
	
	private Integer tipo;
	private int numero;
	private Integer numeroInteger;
	double resultadoInsertion, resultadoMerge, resultadoHeap, resultadoQuick, resultadoTim, resultadoRadix;
	private DesempenhoMB desMB;
	static Integer[] quantidadeMerge;
	static Integer[] quantidadeInsert;
	static Integer[] quantidadeHeap;
	static Integer[] quantidadeTim;
	static Integer[] quantidadeQuick;
	
	
	@PostConstruct
	public void init(){
		setDesMB(new DesempenhoMB());
	}
	
	public static Integer[] Cadastro(int numero){
		Random random = new Random();
		Integer x[] = new Integer[numero];
		
		// Carregando os números no vetor.
		for (int i = 0; i < x.length; i++) {
			x[i] = random.nextInt(100000000);
			//x[i] = x.length -1 -i;
		}
		
		return x;
	}

	public void teste(Long valor) {
		tipo = valor.intValue();
	}
	
	public void merge(){
		System.out.println("Iniciando processo de ordenação do vetor (MERGE)...");
		System.out.println("Numero de elementos a serem ordenados: " +getNumero());
		quantidadeMerge = Cadastro(getNumero());
		GregorianCalendar inicioMerge = new GregorianCalendar();
		Mergesort.sort(quantidadeMerge); 
		GregorianCalendar fimMerge = new GregorianCalendar();
		System.out.println("Antes Merge: " + resultadoMerge);
//		resultadoMerge =  ((fimMerge.getTimeInMillis() - inicioMerge.getTimeInMillis()) / 1000.0);
		setResultadoMerge((fimMerge.getTimeInMillis() - inicioMerge.getTimeInMillis()) / 1000.0);
		System.out.println("Depois Merge: " + resultadoMerge);
	}
	
	public double showMerge(){
		return resultadoMerge;
	}
	
	public void insert(){
		System.out.println("Iniciando processo de ordenação do vetor (INSERTION)...");
		System.out.println("Numero de elementos a serem ordenados: " +getNumero());
		quantidadeInsert = Cadastro(getNumero());	
		GregorianCalendar inicioInsertion = new GregorianCalendar();
		Insertionsort.sort(quantidadeInsert);
		GregorianCalendar fimInsertion = new GregorianCalendar();
		System.out.println("Antes Insertion: " + resultadoInsertion);
//		resultadoInsertion =  ((fimInsertion.getTimeInMillis() - inicioInsertion.getTimeInMillis()) / 1000.0);
		setResultadoInsertion((fimInsertion.getTimeInMillis() - inicioInsertion.getTimeInMillis()) / 1000.0);
		System.out.println("Depois Insertion: " + resultadoInsertion);
	}
	
	public double showInsert(){
		return getResultadoInsertion();
		
	}
	
	public void heap(){
		System.out.println("Iniciando processo de ordenação do vetor (HEAP)...");
		System.out.println("Numero de elementos a serem ordenados: " +getNumero());
		quantidadeHeap = Cadastro(getNumero());
		GregorianCalendar inicioHeap = new GregorianCalendar();
		Heapsort.sort(quantidadeHeap);
		GregorianCalendar fimHeap = new GregorianCalendar();
		System.out.println("Antes Heap: " + resultadoHeap);
//		resultadoHeap = ((fimHeap.getTimeInMillis() - inicioHeap.getTimeInMillis()) / 1000.0);
		setResultadoHeap((fimHeap.getTimeInMillis() - inicioHeap.getTimeInMillis()) / 1000.0);
		System.out.println("Depois Heap: " + resultadoHeap);
	}
	
	public double showHeap(){
		return getResultadoHeap();
	}
	
	public void tim(){
		System.out.println("Iniciando processo de ordenação do vetor (TIM)...");
		System.out.println("Numero de elementos a serem ordenados: " +getNumero());
		quantidadeTim = Cadastro(getNumero());
		GregorianCalendar inicioTim = new GregorianCalendar();
		Timsort.sort(quantidadeTim ,new OrdenaInt()); 
		GregorianCalendar fimTim = new GregorianCalendar();
		System.out.println("Antes Tim: " + resultadoTim);
//		resultadoTim =  ((fimTim.getTimeInMillis() - inicioTim.getTimeInMillis()) / 1000.0);
		setResultadoTim((fimTim.getTimeInMillis() - inicioTim.getTimeInMillis()) / 1000.0);
		System.out.println("Depois Tim: " + resultadoTim);
	}
	
	public double showTim(){
		return getResultadoTim();
	}
	
	public void quick(){
		System.out.println("Iniciando processo de ordenação do vetor (QUICK)...");
		System.out.println("Numero de elementos a serem ordenados: " +getNumero());
		quantidadeQuick = Cadastro(getNumero());
		GregorianCalendar inicioQuick = new GregorianCalendar();
		Quicksort.sort(quantidadeQuick, 0, quantidadeQuick.length - 1); 
		GregorianCalendar fimQuick = new GregorianCalendar();
		System.out.println("Antes Quick: " + resultadoQuick);
//		resultadoQuick =  ((fimQuick.getTimeInMillis() - inicioQuick.getTimeInMillis()) / 1000.0);
		setResultadoQuick((fimQuick.getTimeInMillis() - inicioQuick.getTimeInMillis()) / 1000.0);
		System.out.println("Depois Quick: " + resultadoQuick);
		
	}
	
	public double showQuick(){
		return getResultadoQuick();
	}
	
	public void todos(){
		System.out.println("Iniciando processo de ordenação do vetor...");
		desMB.insert();
		desMB.heap();
		desMB.merge();
		desMB.quick();
		desMB.tim();
		System.out.println("Fim execução de todas ordenações");
	}
	
	public void radix(){
		Integer[] quantidadeRadix;
		quantidadeRadix = Cadastro(numero);
		GregorianCalendar inicioRadix = new GregorianCalendar();
		Radixsort.sort(quantidadeRadix);	
		GregorianCalendar fimRadix = new GregorianCalendar();
		resultadoRadix =  ((fimRadix.getTimeInMillis() - inicioRadix.getTimeInMillis()) / 1000.0);
	}
	
	public double showRadix(){
		return resultadoRadix;
	}
	
	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public int getNumero() {
		return numero = 12000;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public double getResultadoInsertion() {
		return resultadoInsertion;
	}

	public void setResultadoInsertion(double resultadoInsertion) {
		this.resultadoInsertion = resultadoInsertion;
	}

	public double getResultadoMerge() {
		return resultadoMerge;
	}

	public void setResultadoMerge(double resultadoMerge) {
		this.resultadoMerge = resultadoMerge;
	}

	public double getResultadoHeap() {
		return resultadoHeap;
	}

	public void setResultadoHeap(double resultadoHeap) {
		this.resultadoHeap = resultadoHeap;
	}

	public double getResultadoQuick() {
		return resultadoQuick;
	}

	public void setResultadoQuick(double resultadoQuick) {
		this.resultadoQuick = resultadoQuick;
	}

	public double getResultadoTim() {
		return resultadoTim;
	}

	public void setResultadoTim(double resultadoTim) {
		this.resultadoTim = resultadoTim;
	}

	public double getResultadoRadix() {
		return resultadoRadix;
	}

	public void setResultadoRadix(double resultadoRadix) {
		this.resultadoRadix = resultadoRadix;
	}

	public DesempenhoMB getDesMB() {
		return desMB;
	}

	public void setDesMB(DesempenhoMB desMB) {
		this.desMB = desMB;
	}

	public Integer getNumeroInteger() {
		return numeroInteger;
	}

	public void setNumeroInteger(Integer numeroInteger) {
		this.numeroInteger = numeroInteger;
	}
}