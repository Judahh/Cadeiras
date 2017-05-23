package sd;

public class Mergesort {
	
	public static Integer[] sort(Integer[] arr) {
		if (arr.length > 1) {
			int elementsInA1 = arr.length / 2; 
			int elementsInA2 = elementsInA1; 
			if ((arr.length % 2) == 1){
				elementsInA2 += 1; 
			}
			Integer arr1[] = new Integer[elementsInA1]; 
			Integer arr2[] = new Integer[elementsInA2]; 
			for (int i = 0; i < elementsInA1; i++){
				arr1[i] = arr[i]; 
			}
			for (int i = elementsInA1; i < elementsInA1 + elementsInA2; i++){
				arr2[i - elementsInA1] = arr[i]; 
			}
			arr1 = sort(arr1); 
			arr2 = sort(arr2); 
			int i = 0, j = 0, k = 0;   
			while (arr1.length != j && arr2.length != k) {
				if (arr1[j] < arr2[k]) {
					arr[i] = arr1[j]; 
					i++; 
					j++; 
				} else {
					arr[i] = arr2[k]; 
					i++; 
					k++; 
				}
			}
			while (arr1.length != j) {
				arr[i] = arr1[j]; 
				i++; 
				j++; 
			}
			while (arr2.length != k) {
				arr[i] = arr2[k]; 
				i++; 
				k++; 
			}
		}
		return arr;
	}
}
