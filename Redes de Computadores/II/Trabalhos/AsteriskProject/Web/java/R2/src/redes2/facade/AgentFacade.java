package redes2.facade;

import java.util.ArrayList;
import java.util.List;

import redes2.Agent;
import redes2.util.StringUtil;
import util.imp.AgentsImp;
import util.interfaces.Agents;

public class AgentFacade {
	private static List<Agent> agents = new ArrayList<Agent>();
	private static Agents agt = new AgentsImp();
	private static boolean fake = false;

	public static List<Agent> getAgents() {
		if (fake) {
			if (agents.isEmpty()) {
				agents.add(new Agent("000008", "123456", "Borne"));
				agents.add(new Agent("000007", "1234", "James Bond"));
			}
			return agents;
		} else {
			List<Agent> toReturn = new ArrayList<Agent>();
			for (int i = 0; i < agt.getVariableListSize("agents"); i++) {
				String linha = agt.getVariableValue("agents", i);
				if (!StringUtil.isEmpty(linha)) {
					linha = linha.substring(2);

					if (!StringUtil.isEmpty(linha)) {
						String[] valores = linha.split(",");
						if (valores.length == 3) {
							int k = 0;
							toReturn.add(new Agent(valores[k++], valores[k++],
									valores[k++]));
						}
					}
				}
			}
			return toReturn;
		}
	}

	public static void addAgent(Agent agent) {
		if (!isValid(agent)) {
			return;
		}
		if (fake) {
			getAgents().add(agent);
		} else {
			String id = agent.getId();
			agt.addSession(id);
			agt.addVariable(
					id,
					"agent",
					">" + agent.getId() + "," + agent.getSecret() + ","
							+ agent.getUsername());
		}
	}

	public static void deleteAgent(String agentId) {
		if (StringUtil.isEmpty(agentId)) {
			return;
		}
		if (fake) {
			Agent toRemove = null;
			for (Agent agent : getAgents()) {
				if (agent.isSame(agentId)) {
					toRemove = agent;
				}
			}
			if (toRemove != null) {
				getAgents().remove(toRemove);
			}
		} else {
			int index = -1;
			int i = 0;
			for (Agent agent : getAgents()) {
				i++;
				if (agent.isSame(agentId)) {
					index = i;
				}
			}
			if (index == -1) {
				return;
			}
			agt.removeVariable("agents", index);
		}
	}

	public static void updateAgent(Agent agent) {
		if (!isValid(agent)) {
			return;
		}
		updateAgent(agent.getId(), agent);
	}

	public static void updateAgent(String agentId, Agent agent) {
		if (!isValid(agent)) {
			return;
		}
		deleteAgent(agentId);
		addAgent(agent);
	}

	public static Agent getAgent(String agentId) {
		if (StringUtil.isEmpty(agentId)) {
			return null;
		}
		if (fake) {
			for (Agent agent : getAgents()) {
				if (agent.isSame(agentId)) {
					return agent;
				}
			}
		} else {
			for (int i = 0; i < agt.getVariableListSize("agents"); i++) {
				String linha = agt.getVariableValue("agents", i);
				if (!StringUtil.isEmpty(linha)) {
					linha = linha.substring(2);

					if (!StringUtil.isEmpty(linha)) {
						String[] valores = linha.split(",");
						if (valores.length == 3) {
							int k = 0;
							if (agentId.equals(valores[0])) {
								return new Agent(valores[k++], valores[k++],
										valores[k++]);
							}
						}
					}
				}
			}
		}
		return null;
	}

	private static boolean isValid(Agent agent) {
		if (agent == null) {
			return false;
		}
		if (StringUtil.isEmpty(agent.getId())) {
			return false;
		}
		return true;
	}
}