package redes2;

public class IAXRamal extends BasicModel {
	private String callerid;
	private String type;
	private String defaultuser;
	private String secret;
	private String context;
	private String host;
	private String auth;
	private String transfer;
	private String requiredcalltoken;

	public IAXRamal(String id, String callerid, String type, String defaultuser,
			String secret, String context, String host, String auth,
			String transfer, String requiredcalltoken) {
		this.id = id;
		this.callerid = callerid;
		this.type = type;
		this.defaultuser = defaultuser;
		this.secret = secret;
		this.context = context;
		this.host = host;
		this.auth = auth;
		this.transfer = transfer;
		this.requiredcalltoken = requiredcalltoken;
	}

	public String getCallerid() {
		return get(callerid);
	}

	public String getType() {
		return get(type);
	}

	public String getDefaultuser() {
		return get(defaultuser);
	}

	public String getSecret() {
		return get(secret);
	}

	public String getAuth() {
		return get(auth);
	}

	public String getHost() {
		return get(host);
	}

	public String getContext() {
		return get(context);
	}

	public String getTransfer() {
		return get(transfer);
	}

	public String getRequiredcalltoken() {
		return get(requiredcalltoken);
	}

}