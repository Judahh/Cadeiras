package sd;

public class Heapsort {


	public static void sort(Integer[] v) {
		buildMaxHeap(v);  ;
		int n = v.length; ;

		for (int i = v.length - 1; i > 0; i--) {
			swap(v, i, 0); ;
			maxHeapify(v, 0, --n); ;
		}
	
	}

	private static void buildMaxHeap(Integer[] v) {
		for (int i = v.length / 2 - 1; i >= 0; i--){
			maxHeapify(v, i, v.length); ;
		}
	}

	private static void maxHeapify(Integer[] v, int pos, int n) {
		int max = 2 * pos + 1, right = max + 1; ; ;
		if (max < n) {
			if (right < n && v[max] < v[right]){
				max = right; ;
			}if (v[max] > v[pos]) {
				swap(v, max, pos); ;
				maxHeapify(v, max, n); ;
			}
		}
	}

	public static void swap(Integer[] v, int j, int aposJ) {
		int aux = v[j]; ;
		v[j] = v[aposJ]; ;
		v[aposJ] = aux; ;
	}
}