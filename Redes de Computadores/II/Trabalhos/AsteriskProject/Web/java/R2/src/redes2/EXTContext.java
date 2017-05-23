package redes2;

import java.util.ArrayList;

public class EXTContext extends BasicModel {

	private ArrayList<EXTContextNumber> number = new ArrayList<EXTContextNumber>();
	
	public EXTContext(String id, ArrayList<EXTContextNumber> procedures ){
		this.id = id;
		this.number = procedures;
	}
	
	public ArrayList<EXTContextNumber> getNumber() {
		return number;
	}
}