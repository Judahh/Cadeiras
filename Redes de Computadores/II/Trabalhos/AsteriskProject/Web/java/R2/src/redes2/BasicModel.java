package redes2;

public class BasicModel {
	protected String id;

	public String getId() {
		return get(id);
	}

	protected String get(String var) {
		if (var == null) {
			return "";
		}
		return var;
	}

	public boolean isSame(String id) {
		return this.id.equals(id);
	}

}