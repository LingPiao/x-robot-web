package net.sf.service.agent.lock;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import net.sf.service.common.Constants;

public class QuestionLock {

	private Map<String, LockItem> lockList = new ConcurrentHashMap<String, LockItem>();
	private ScheduledExecutorService ses = Executors.newSingleThreadScheduledExecutor();

	// Prevent initiation
	private QuestionLock() {
		this.ses.scheduleWithFixedDelay(new LockNumen(this), 0, Constants.LOCK_CHECK_PERIOD, TimeUnit.MINUTES);
	}

	private static class QuestionLockHolder {
		private static final QuestionLock instance = new QuestionLock();
	}

	public static void stop() {
		if (QuestionLock.getInstance().ses != null) {
			QuestionLock.getInstance().ses.shutdown();
		}
	}

	public static QuestionLock getInstance() {
		return QuestionLockHolder.instance;
	}

	public boolean isLocked(String qid) {
		return lockList.containsKey(qid);
	}

	public boolean isLocked(String qid, String agentName) {
		if (!lockList.containsKey(qid)) {
			return false;
		}
		LockItem l = lockList.get(qid);
		if (l == null) {
			return false;
		}
		// 允许同一用户重复锁定同一问题
		return !l.getLockUser().equals(agentName);
	}

	public LockItem getLockedItem(String qid, String agentName) {
		if (!lockList.containsKey(qid)) {
			return null;
		}
		LockItem l = lockList.get(qid);
		if (l != null && l.getLockUser().equals(agentName)) {
			return l;
		}
		return null;
	}

	public boolean tryUnlockQuestion(String qid, String agentName) {
		if (getLockedItem(qid, agentName) != null) {
			removeLock(qid);
			return true;
		}
		return false;
	}

	public boolean tryLockQuestion(String qid, String agentName) {
		if (isLocked(qid, agentName)) {
			return false;
		}
		addLock(qid, agentName);
		return true;
	}

	public void addLock(String qid, String agentName) {
		this.lockList.put(qid, new LockItem(qid, agentName));
	}

	public void removeLock(String qid) {
		this.lockList.remove(qid);
	}

	public Map<String, LockItem> getLockList() {
		return this.lockList;
	}

}
