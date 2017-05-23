package sd;

import java.util.Comparator;

public class OrdenaInt implements Comparator<Integer> {

	public int compare(Integer one, Integer two) {
		return one.compareTo(two);
	}
	
}
