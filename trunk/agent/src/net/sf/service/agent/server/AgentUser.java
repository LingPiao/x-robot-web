package net.sf.service.agent.server;

import java.math.BigDecimal;
import java.util.Map;

import net.sf.service.common.Constants;

public class AgentUser implements Cloneable {

	private String userId;
	private String agentName;
	private String agentType;
	private String agentMsn;
	private String mobileNo;
	private Long managerId;

	@SuppressWarnings("unchecked")
	public static AgentUser parse(Map map) {
		AgentUser au = new AgentUser();
		au.setUserId(String.valueOf(map.get("USERID")));
		au.setAgentName(String.valueOf(map.get("USERNAME")));
		au.setAgentMsn(String.valueOf(map.get("MSN")));
		au.setMobileNo(String.valueOf(map.get("M_MOBILE")));
		Object manager = map.get("MANAGER");
		if (manager != null) {
			au.setAgentType(Constants.VIP_MANAGER);
		} else {
			au.setAgentType(Constants.NORMAL_AGENT);
		}

		Object mid = map.get("MANAGER_ID");
		if (mid != null) {
			au.setManagerId(((BigDecimal) mid).longValue());
		} else {
			au.setManagerId(null);
		}

		return au;
	}

	public static AgentUser parseLogin(String loginStr) {
		// agentName=xx,agentType=1,mobileNo=13x...
		AgentUser au = new AgentUser();
		String[] paras = loginStr.split(",");
		for (String p : paras) {
			// agentName=xx
			String[] pv = p.split("=");
			if (pv[0].equals("agentName")) {
				au.setAgentName(pv[1]);
			} else if (pv[0].equals("agentType")) {
				au.setAgentType(pv[1]);
			} else if (pv[0].equals("mobileNo")) {
				au.setMobileNo(pv[1]);
			}
		}
		return au;
	}

	public Object clone() {
		Object o = null;
		try {
			o = super.clone();
		} catch (CloneNotSupportedException e) {
		}
		return o;
	}

	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public String getAgentType() {
		return agentType;
	}

	public void setAgentType(String agentType) {
		this.agentType = agentType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAgentMsn() {
		return agentMsn;
	}

	public void setAgentMsn(String agentMsn) {
		this.agentMsn = agentMsn;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String toString() {
		return "AgentName=" + this.agentName + ",AgentType=" + this.agentType + ",agentMsn=" + this.agentMsn + ",mobileNo=" + this.mobileNo + ",managerId="
				+ this.managerId;
	}

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public static void main(String[] args) {
		String loginStr = "agentName=xx,agentType=1";
		AgentUser au = AgentUser.parseLogin(loginStr);
		System.out.println(au);
	}
}
