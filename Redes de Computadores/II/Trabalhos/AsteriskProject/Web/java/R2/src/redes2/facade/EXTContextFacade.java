package redes2.facade;

import java.util.ArrayList;
import java.util.List;

import redes2.EXTContext;
import redes2.EXTContextNumber;
import redes2.util.StringUtil;
import util.imp.ExtensionsImp;
import util.interfaces.Extensions;

public class EXTContextFacade {
	private static List<EXTContext> contexts = new ArrayList<EXTContext>();

	private static Extensions ext = new ExtensionsImp();
	private static boolean fake = true;

	public static List<EXTContext> getExtContext() {
		if (contexts.isEmpty()) {
			ArrayList<String> commands;
			ArrayList<EXTContextNumber> procedures;
			EXTContext context;

			procedures = new ArrayList<EXTContextNumber>();
			commands = new ArrayList<String>();
			commands.add("1,Answer()");
			commands.add("2,MusicOnHold(default,90)");
			commands.add("n,Hangup()");
			procedures.add(new EXTContextNumber("*35_", commands));

			commands = new ArrayList<String>();
			commands.add("n,Answer()");
			commands.add("1,MusicOnHold(default,90)");
			commands.add("1,Hangup()");
			procedures.add(new EXTContextNumber("*1", commands));

			context = new EXTContext("LOCAL", procedures);

			contexts.add(context);

			procedures = new ArrayList<EXTContextNumber>();
			commands = new ArrayList<String>();
			commands.add("1,Answer()");
			commands.add("2,Playback(vm-num-i-have)");
			commands.add("n,Wait()");
			commands.add("1,SayDigits(${CALLERID(num)}");
			commands.add("1,Hangup()");
			procedures.add(new EXTContextNumber("s", commands));

			context = new EXTContext("macro-dizramal", procedures);

			contexts.add(context);
		}
		return contexts;
	}

	public static void addExtContext(EXTContext extContext) {
		if(!isValid(extContext)){
			return;
		}
		if (fake) {
			getExtContext().add(extContext);
		} else {
			String id = extContext.getId();
			ext.addSession(id);
			for (EXTContextNumber number : extContext.getNumber()) {
				for (String command : number.getCommands()) {
					ext.addVariable(id, "exten", ">" + number.getNumber() + ","
							+ command);
				}
			}
		}
	}

	public static void deleteExtContext(String extContextId) {
		if(StringUtil.isEmpty(extContextId)){
			return;
		}
		if (fake) {
			EXTContext toRemove = null;

			for (EXTContext extContext : getExtContext()) {
				if (extContext.isSame(extContextId)) {
					toRemove = extContext;
				}
			}
			if (toRemove != null) {
				getExtContext().remove(toRemove);
			}
		} else {
			ext.removeSession(extContextId);
		}
	}

	public static void updateExtContext(EXTContext extContext) {
		if(!isValid(extContext)){
			return;
		}
		updateExtContext(extContext.getId(), extContext);
	}

	public static void updateExtContext(String extContextId, EXTContext extContext) {
		if(!isValid(extContext)){
			return;
		}
		deleteExtContext(extContextId);
		addExtContext(extContext);
	}

	public static EXTContext getExtContextIaxRamal(String extContextId) {
		if(StringUtil.isEmpty(extContextId)){
			return null;
		}
		if (fake) {
			for (EXTContext extContext : getExtContext()) {
				if (extContext.isSame(extContextId)) {
					return extContext;
				}
			}
			return null;
		} else {
			int size = ext.getVariableListSize(extContextId);
			for (int i = 0; i < size; i++) {
				String var = ext.getVariableValue(extContextId, i);
				System.out.println("Variavel do: " + extContextId + " variavel: " + var);
			}
			return null;
		}
	}

	private static boolean isValid(EXTContext extContext) {
		if (extContext == null) {
			return false;
		}
		if (StringUtil.isEmpty(extContext.getId())) {
			return false;
		}
		return true;
	}
}