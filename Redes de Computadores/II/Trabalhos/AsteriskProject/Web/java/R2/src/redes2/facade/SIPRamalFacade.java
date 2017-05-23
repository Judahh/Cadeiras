package redes2.facade;

import java.util.ArrayList;
import java.util.List;

import redes2.SIPRamal;
import redes2.util.StringUtil;
import util.imp.SipImp;
import util.interfaces.Sip;

public class SIPRamalFacade {
	private static List<SIPRamal> ramais = new ArrayList<SIPRamal>();
	private static boolean fake = false;


	private static Sip sip = new SipImp();

	
	public static List<SIPRamal> getSipRamais() {
		if (fake) {
			if (ramais.isEmpty()) {
				for (int i = 0; i < 3; i++) {
					ramais.add(new SIPRamal("SIP-460" + i,
							"'Ramal-SIP' <4600>", "friend", "4600", "1234",
							"no", "dynamic", "LOCAL", "rfc2833", "2", "no"));
				}
			}
			return ramais;
		} else {
			List<SIPRamal> toReturn = new ArrayList<SIPRamal>();
			for (int i = 0; i < sip.getNumberOfSessions(); i++) {
				String sessionName = sip.getSessionName(i);
				if("general".equals(sessionName)){
					continue;
				}
				toReturn.add(new SIPRamal(sessionName, sip.getVariableValue(
						sessionName, "callerid"), sip.getVariableValue(
						sessionName, "type"), sip.getVariableValue(sessionName,
						"username"), sip
						.getVariableValue(sessionName, "secret"), sip
						.getVariableValue(sessionName, "canreinvite"), sip
						.getVariableValue(sessionName, "host"), sip
						.getVariableValue(sessionName, "context"), sip
						.getVariableValue(sessionName, "dtmfmode"), sip
						.getVariableValue(sessionName, "call-limit"), sip
						.getVariableValue(sessionName, "nat")));
			}
			return toReturn;
		}
	}

	public static void addSipRamal(SIPRamal sipRamal) {
		if (!isValid(sipRamal)) {
			return;
		}

		if (fake) {
			getSipRamais().add(sipRamal);
		} else {
			String id = sipRamal.getId();
			String callerid = sipRamal.getCallerid();
			String type = sipRamal.getType();
			String username = sipRamal.getUsername();
			String secret = sipRamal.getSecret();
			String canreinvite = sipRamal.getCanreinvite();
			String host = sipRamal.getHost();
			String context = sipRamal.getContext();
			String dtmfmode = sipRamal.getDtmfmode();
			String call_limit = sipRamal.getCall_limit();
			String nat = sipRamal.getNat();

			sip.addSession(id);
			sip.addVariable(id, "callerid", callerid);
			sip.addVariable(id, "type", type);
			sip.addVariable(id, "username", username);
			sip.addVariable(id, "secret", secret);
			sip.addVariable(id, "canreinvite", canreinvite);
			sip.addVariable(id, "host", host);
			sip.addVariable(id, "context", context);
			sip.addVariable(id, "dtmfmode", dtmfmode);
			sip.addVariable(id, "call-limit", call_limit);
			sip.addVariable(id, "nat", nat);
		}
	}

	public static void deleteSipRamal(String sipRamalId) {
		if (StringUtil.isEmpty(sipRamalId)) {
			return;
		}
		
		if (fake) {
			SIPRamal toRemove = null;
			for (SIPRamal sipRamal : getSipRamais()) {
				if (sipRamal.isSame(sipRamalId)) {
					toRemove = sipRamal;
				}
			}
			if (toRemove != null) {
				getSipRamais().remove(toRemove);
			}
		} else {
			sip.removeSession(sipRamalId);
		}
	}

	public static void updateSipRamal(SIPRamal sipRamal) {
		if(!isValid(sipRamal)){
			return;
		}
		updateSipRamal(sipRamal.getId(), sipRamal);
	}

	public static void updateSipRamal(String sipRamalId, SIPRamal sipRamal) {
		if(!isValid(sipRamal)){
			return;
		}
		deleteSipRamal(sipRamalId);
		addSipRamal(sipRamal);
	}

	public static SIPRamal getSipRamal(String sipRamalId) {
		if (StringUtil.isEmpty(sipRamalId)) {
			return null;
		}
		if (fake) {
			for (SIPRamal sipRamal : getSipRamais()) {
				if (sipRamal.isSame(sipRamalId)) {
					return sipRamal;
				}
			}
			return null;
		} else {
			try{
				String callerid = sip.getVariableValue(sipRamalId, "callerid");
				String type = sip.getVariableValue(sipRamalId, "type");
				String username = sip.getVariableValue(sipRamalId, "username");
				String secret = sip.getVariableValue(sipRamalId, "secret");
				String canreinvite = sip.getVariableValue(sipRamalId, "canreinvite");
				String host = sip.getVariableValue(sipRamalId, "host");
				String context = sip.getVariableValue(sipRamalId, "context");
				String dtmfmode = sip.getVariableValue(sipRamalId, "dtmfmode");
				String call_limit = sip.getVariableValue(sipRamalId, "call-limit");
				String nat = sip.getVariableValue(sipRamalId, "nat");
	
				return new SIPRamal(sipRamalId, callerid, type, username, secret, canreinvite, host, context, dtmfmode, call_limit, nat);
			}catch(Exception e){
				return null;
			}
		}
	}

	private static boolean isValid(SIPRamal sipRamal) {
		if (sipRamal == null) {
			return false;
		}
		if (StringUtil.isEmpty(sipRamal.getId())) {
			return false;
		}
		return true;
	}
}