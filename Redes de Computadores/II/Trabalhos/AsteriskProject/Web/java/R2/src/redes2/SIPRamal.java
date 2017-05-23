package redes2;

import redes2.util.StringUtil;

public class SIPRamal extends BasicModel {
	private String callerid;
	private String type;
	private String username;
	private String secret;
	private String canreinvite;
	private String host;
	private String context;
	private String dtmfmode;
	private String call_limit;
	private String nat;

	public SIPRamal(String id, String callerid, String type, String username,
			String secret, String canreinvite, String host, String context,
			String dtmfmode, String call_limit, String nat) {
		this.id = id;
		if(!StringUtil.isEmpty(callerid)){
			this.callerid = callerid.replace("\"", "'");
		}
		this.type = type;
		this.username = username;
		this.secret = secret;
		this.canreinvite = canreinvite;
		this.host = host;
		this.context = context;
		this.dtmfmode = dtmfmode;
		this.call_limit = call_limit;
		this.nat = nat;
	}

	public String getCallerid() {
		return get(callerid);
	}

	public String getType() {
		return get(type);
	}

	public String getUsername() {
		return get(username);
	}

	public String getSecret() {
		return get(secret);
	}

	public String getCanreinvite() {
		return get(canreinvite);
	}

	public String getHost() {
		return get(host);
	}

	public String getContext() {
		return get(context);
	}

	public String getDtmfmode() {
		return get(dtmfmode);
	}

	public String getCall_limit() {
		return get(call_limit);
	}

	public String getNat() {
		return get(nat);
	}
}