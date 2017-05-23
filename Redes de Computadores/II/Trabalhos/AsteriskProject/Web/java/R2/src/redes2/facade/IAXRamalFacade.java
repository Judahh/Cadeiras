package redes2.facade;

import java.util.ArrayList;
import java.util.List;

import redes2.IAXRamal;
import redes2.util.StringUtil;
import util.imp.IaxImp;
import util.interfaces.Iax;

public class IAXRamalFacade {
	private static List<IAXRamal> ramais = new ArrayList<IAXRamal>();

	private static Iax iax = new IaxImp();
	private static boolean fake = false;

	public static List<IAXRamal> getIaxRamais() {
		if (fake) {
			if (ramais.isEmpty()) {
				for (int i = 0; i < 3; i++) {
					ramais.add(new IAXRamal("IAX-460" + i, "'Ramal' <3000>",
							"friend", "3000", "lab$3000", "LOCAL", "dynamic",
							"md5", "yes", "no"));
				}
			}
			return ramais;
		} else {
			List<IAXRamal> toReturn = new ArrayList<IAXRamal>();
			for (int i = 0; i < iax.getNumberOfSessions(); i++) {
				String sessionName = iax.getSessionName(i);
				if("general".equals(sessionName)){
					continue;
				}
				String callerid = iax.getVariableValue(sessionName, "callerid");
				String type = iax.getVariableValue(sessionName, "type");
				String defaultuser = iax.getVariableValue(sessionName,
						"defaultuser");
				String secret = iax.getVariableValue(sessionName, "secret");
				String context = iax.getVariableValue(sessionName, "context");
				String host = iax.getVariableValue(sessionName, "host");
				String auth = iax.getVariableValue(sessionName, "auth");
				String transfer = iax.getVariableValue(sessionName, "transfer");
				String requiredcalltoken = iax.getVariableValue(sessionName,
						"requiredcalltoken");
				toReturn.add(new IAXRamal(sessionName, callerid, type,
						defaultuser, secret, context, host, auth, transfer,
						requiredcalltoken));
			}
			return toReturn;
		}
	}

	public static void addIaxRamal(IAXRamal iaxRamal) {
		if(!isValid(iaxRamal)){
			return;
		}
		if (fake) {
			getIaxRamais().add(iaxRamal);
		} else {
			String id = iaxRamal.getId();
			String callerid = iaxRamal.getCallerid();
			String type = iaxRamal.getType();
			String defaultuser = iaxRamal.getDefaultuser();
			String secret = iaxRamal.getSecret();
			String context = iaxRamal.getContext();
			String host = iaxRamal.getHost();
			String auth = iaxRamal.getAuth();
			String transfer = iaxRamal.getTransfer();
			String requiredcalltoken = iaxRamal.getRequiredcalltoken();

			iax.addSession(id);
			iax.addVariable(id, "callerid", callerid);
			iax.addVariable(id, "type", type);
			iax.addVariable(id, "defaultuser", defaultuser);
			iax.addVariable(id, "secret", secret);
			iax.addVariable(id, "context", context);
			iax.addVariable(id, "host", host);
			iax.addVariable(id, "auth", auth);
			iax.addVariable(id, "transfer", transfer);
			iax.addVariable(id, "requiredcalltoken", requiredcalltoken);
		}
	}

	public static void deleteIaxRamal(String iaxRamalId) {
		if(StringUtil.isEmpty(iaxRamalId)){
			return;
		}
		if (fake) {
			IAXRamal toRemove = null;
			for (IAXRamal iaxRamal : getIaxRamais()) {
				if (iaxRamal.isSame(iaxRamalId)) {
					toRemove = iaxRamal;
				}
			}
			if (toRemove != null) {
				getIaxRamais().remove(toRemove);
			}
		} else {
			iax.removeSession(iaxRamalId);
		}
	}

	public static void updateIaxRamal(IAXRamal iaxRamal) {
		if(!isValid(iaxRamal)){
			return;
		}
		updateIaxRamal(iaxRamal.getId(), iaxRamal);
	}

	public static void updateIaxRamal(String iaxRamalId, IAXRamal iaxRamal) {
		if(!isValid(iaxRamal)){
			return;
		}
		deleteIaxRamal(iaxRamalId);
		addIaxRamal(iaxRamal);
	}

	public static IAXRamal getIaxRamal(String iaxRamalId) {
		if(StringUtil.isEmpty(iaxRamalId)){
			return null;
		}
		if (fake) {
			for (IAXRamal iaxRamal : getIaxRamais()) {
				if (iaxRamal.isSame(iaxRamalId)) {
					return iaxRamal;
				}
			}
			return null;
		} else {
			try{
				String callerid = iax.getVariableValue(iaxRamalId, "callerid");
				String type = iax.getVariableValue(iaxRamalId, "type");
				String defaultuser = iax.getVariableValue(iaxRamalId, "defaultuser");
				String secret = iax.getVariableValue(iaxRamalId, "secret");
				String context = iax.getVariableValue(iaxRamalId, "context");
				String host = iax.getVariableValue(iaxRamalId, "host");
				String auth = iax.getVariableValue(iaxRamalId, "auth");
				String transfer = iax.getVariableValue(iaxRamalId, "transfer");
				String requiredcalltoken = iax.getVariableValue(iaxRamalId, "requiredcalltoken");
	
				return new IAXRamal(iaxRamalId, callerid, type, defaultuser, secret, context, host, auth, transfer, requiredcalltoken);
			}catch(Exception e){
				return null;
			}
		}
	}
	
	private static boolean isValid(IAXRamal iaxRamal) {
		if (iaxRamal == null) {
			return false;
		}
		if (StringUtil.isEmpty(iaxRamal.getId())) {
			return false;
		}
		return true;
	}
}