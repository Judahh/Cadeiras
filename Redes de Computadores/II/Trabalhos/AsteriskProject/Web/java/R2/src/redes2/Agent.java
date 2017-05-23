package redes2;

public class Agent extends BasicModel {
	private String secret;
	private String username;

	public Agent(String id, String secret, String username) {
		super();
		this.id = id;
		this.secret = secret;
		this.username = username;
	}

	public String getSecret() {
		return get(secret);
	}

	public String getUsername() {
		return get(username);
	}

}