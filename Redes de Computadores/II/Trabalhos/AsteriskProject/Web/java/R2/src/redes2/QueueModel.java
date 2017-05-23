package redes2;

import java.util.ArrayList;

public class QueueModel extends BasicModel {
	private ArrayList<String> members;

	public QueueModel(String id, ArrayList<String> members) {
		super();
		this.id = id;
		this.members = members;
	}

	public ArrayList<String> getMembers() {
		return members;
	}

}