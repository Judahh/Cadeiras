package redes2;

public class Monitor extends BasicModel {
	private String username;
	private String host;
	private String status;

	public Monitor(String username, String host, String status) {
		super();
		this.username = username;
		this.host = host;
		this.status = status;
	}

	public String getUsername() {
		return get(username);
	}

	public String getHost() {
		return get(host);
	}

	public String getStatus() {
		return get(status);
	}

}