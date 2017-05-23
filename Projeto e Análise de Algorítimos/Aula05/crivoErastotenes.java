import java.util.ArrayList;


public class crivoErastotenes {
	public static void main(String[] args) {
		int val = 100;
		ArrayList<Integer> lista = new ArrayList<Integer>();
		for(int i=2; i<=val; i++){
			lista.add(i);
		}
		System.out.println(lista);
		for(int i=2; i<=val; i++){
			for(int j=i+1; j<=val; j++){
				if(lista.contains(j) && j%i==0)
					lista.remove((Object)j);
			}
		}
		System.out.println(lista);
	}
}
