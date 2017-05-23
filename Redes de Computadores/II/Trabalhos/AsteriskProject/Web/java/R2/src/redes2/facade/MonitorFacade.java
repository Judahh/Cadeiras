package redes2.facade;

import java.util.ArrayList;
import java.util.List;

import util.imp.AsteriskMonitorImp;
import util.interfaces.AsteriskMonitor;

public class MonitorFacade {
	private static AsteriskMonitor monitor = new AsteriskMonitorImp();
	private static boolean fake = true;

	public static List<List<String>> getSip() {
		List<List<String>> toReturn = new ArrayList<List<String>>();
		if (fake) {
			List<String> local;

			local = new ArrayList<String>();
			local.add("SIP/4001");
			local.add("192.168.1.100");
			local.add("On");
			toReturn.add(local);

			local = new ArrayList<String>();
			local.add("SIP/4002");
			local.add("192.168.1.100");
			local.add("Unmonitored");
			toReturn.add(local);
			return toReturn;
		} else {
			// monitor.getAgents()
			// monitor.getCoreShowChannels()
			// monitor.getIax()
			// monitor.getQueues()
			// monitor.getSip()
			
		}
		return toReturn;
	}

	public static List<List<String>> getIax() {
		List<List<String>> toReturn = new ArrayList<List<String>>();
		if (fake) {
			List<String> local;

			local = new ArrayList<String>();
			local.add("IAX/4001");
			local.add("192.168.1.100");
			local.add("On");
			toReturn.add(local);

			local = new ArrayList<String>();
			local.add("IAX/4002");
			local.add("192.168.1.100");
			local.add("Unmonitored");
			toReturn.add(local);
			return toReturn;
		} else {
		}
		return toReturn;
	}

	public static List<List<String>> getAgents() {
		List<List<String>> toReturn = new ArrayList<List<String>>();
		if (fake) {
			List<String> local;

			local = new ArrayList<String>();
			local.add("007");
			local.add("Judah Holanda");
			local.add("AGENT_LOGGEDOFF");
			toReturn.add(local);

			local = new ArrayList<String>();
			local.add("009");
			local.add("Allan");
			local.add("AGENT_LOGGEDOFF");
			toReturn.add(local);
			return toReturn;
		} else {
		}
		return toReturn;
	}

	public static List<List<String>> getCoreShow() {
		List<List<String>> toReturn = new ArrayList<List<String>>();
		if (fake) {
			List<String> local;

			local = new ArrayList<String>();
			local.add("Core/4001");
			local.add("192.168.1.100");
			local.add("192.168.1.100");
			local.add("On");
			toReturn.add(local);

			local = new ArrayList<String>();
			local.add("Core/4002");
			local.add("192.168.1.100");
			local.add("192.168.1.100");
			local.add("Unmonitored");
			toReturn.add(local);
			return toReturn;
		} else {
		}
		return toReturn;
	}

	public static List<List<String>> getQueues() {
		List<List<String>> toReturn = new ArrayList<List<String>>();
		if (fake) {
			List<String> local;

			local = new ArrayList<String>();
			local.add("IAX2/2000");
			local.add("Unavailable");
			toReturn.add(local);

			local = new ArrayList<String>();
			local.add("Agent/007");
			local.add("Unavailable");
			toReturn.add(local);
			return toReturn;
		} else {
		}
		return toReturn;
	}

}