package huffman;

public class Node {
	public String value;
	public int freq;
	private Node left;
	private Node right;
	private Node next;
	private Node prev;
	public String codeword;
	
	public Node(String value, int freq) {
		this.value = value;
		this.freq = freq;
		this.left = null;
		this.right = null;
		this.next = null;
		this.prev = null;
		this.codeword = "";
	}
	
	public void setLeft(Node node) {
		this.left = node;
	}
	
	public void setRight(Node node) {
		this.right = node;
	}
	
	public void setNext(Node node) {
		this.next = node;
	}
	
	public void setPrev(Node node) {
		this.prev = node;
	}
	
	public Node getLeft() {
		return this.left;
	}
	
	public Node getRight() {
		return this.right;
	}
	
	public Node getNext() {
		return this.next;
	}
	
	public Node getPrev() {
		return this.prev;
	}
	
}
