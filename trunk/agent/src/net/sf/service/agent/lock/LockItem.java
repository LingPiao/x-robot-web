package net.sf.service.agent.lock;

import java.util.Date;

public class LockItem {

	private String qid;
	private String lockUser;
	private Date lockDate;

	public LockItem(String qid, String lockUser) {
		this.qid = qid;
		this.lockUser = lockUser;
		this.lockDate = new Date();
	}

	public String getQid() {
		return qid;
	}

	public void setQid(String qid) {
		this.qid = qid;
	}

	public String getLockUser() {
		return lockUser;
	}

	public void setLockUser(String lockUser) {
		this.lockUser = lockUser;
	}

	public Date getLockDate() {
		return lockDate;
	}

	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}

}
