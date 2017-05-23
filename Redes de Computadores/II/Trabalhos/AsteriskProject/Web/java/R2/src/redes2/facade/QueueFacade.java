package redes2.facade;

import java.util.ArrayList;
import java.util.List;

import redes2.QueueModel;
import redes2.util.StringUtil;
import util.imp.QueuesImp;
import util.interfaces.Queues;

public class QueueFacade {
	private static List<QueueModel> queues = new ArrayList<QueueModel>();
	private static Queues que = new QueuesImp();

	private static boolean fake = true;

	public static List<QueueModel> getQueues() {
		if (fake) {
			if (queues.isEmpty()) {
				ArrayList<String> members;

				members = new ArrayList<>();
				for (int i = 0; i < 3; i++) {
					members.add("SIP/400" + i);
				}
				queues.add(new QueueModel("Desenvolvimento", members));
				
				members = new ArrayList<>();
				for (int i = 0; i < 3; i++) {
					members.add("IAX2/200" + i);
				}
				queues.add(new QueueModel("Diretoria", members));

				members = new ArrayList<>();
				for (int i = 0; i < 3; i++) {
					members.add("SIP/300" + i);
				}
				queues.add(new QueueModel("RH", members));
			}
			return queues;
		} else {
			// List<Agent> toReturn = new ArrayList<Agent>();
			// for (int i = 0; i < agt.getNumberOfSessions(); i++) {
			// String sessionName = agt.getSessionName(i);
			// toReturn.add(new Agent(sessionName, agt.get
			// agents.add(new Agent("000007", "1234", "James Bond"));
			// }
			// return toReturn;
		}
		return null;
	}

	public static void addQueue(QueueModel queue) {
		if (!isValid(queue)) {
			return;
		}
		if (fake) {
			getQueues().add(queue);
		} else {
		}
	}

	public static void deleteQueue(String queueId) {
		if (StringUtil.isEmpty(queueId)) {
			return;
		}
		if (fake) {
			QueueModel toRemove = null;
			for (QueueModel queue : getQueues()) {
				if (queue.isSame(queueId)) {
					toRemove = queue;
				}
			}
			if (toRemove != null) {
				getQueues().remove(toRemove);
			}
		} else {
			// agt.removeSession(arg0)
			// agt.removeVariable(arg0, arg1)
		}
	}

	public static void updateQueue(QueueModel queue) {
		if (!isValid(queue)) {
			return;
		}
		updateQueue(queue.getId(), queue);
	}

	public static void updateQueue(String queueId, QueueModel queue) {
		if (!isValid(queue)) {
			return;
		}
		deleteQueue(queueId);
		addQueue(queue);
	}

	public static QueueModel getQueue(String queueId) {
		if (StringUtil.isEmpty(queueId)) {
			return null;
		}
		if (fake) {
			for (QueueModel queue : getQueues()) {
				if (queue.isSame(queueId)) {
					return queue;
				}
			}
			return null;
		} else {
		}
		return null;
	}

	private static boolean isValid(QueueModel queue) {
		if (queue == null) {
			return false;
		}
		if (StringUtil.isEmpty(queue.getId())) {
			return false;
		}
		return true;
	}

}