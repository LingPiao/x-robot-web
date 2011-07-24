package net.sf.service.agent.lock;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import net.sf.service.common.Constants;

import org.apache.log4j.Logger;

public class LockNumen implements Runnable {
	private final static Logger log = Logger.getLogger(LockNumen.class);
	private QuestionLock questionLock;

	public LockNumen(QuestionLock questionLock) {
		this.questionLock = questionLock;
	}

	@Override
	public void run() {
		try {
			log.debug("正在检查锁定问题...");
			Date now = new Date();
			Map<String, LockItem> lockList = questionLock.getLockList();
			Calendar cal = Calendar.getInstance();
			Iterator<String> keyIt = lockList.keySet().iterator();
			while (keyIt.hasNext()) {
				String k = keyIt.next();
				LockItem l = lockList.get(k);
				cal.setTime(now);
				cal.add(Calendar.MINUTE, 0 - Constants.LOCK_TIME_OUT);
				if (cal.getTime().after(l.getLockDate())) {// 已超时
					keyIt.remove();
					log.debug("删除已超时的锁定问题[" + k + "]");
				}
			}
			log.debug("锁定问题检查完成.");
		} catch (Throwable t) {
			t.printStackTrace();
			log.error("检查锁定问题出错:", t);
		}
	}
}
