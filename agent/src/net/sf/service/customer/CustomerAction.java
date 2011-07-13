package net.sf.service.customer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.server.AgentUser;
import net.sf.service.common.Constants;
import net.sf.service.common.HttpUtil;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionSupport;

public class CustomerAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");

	@SuppressWarnings("unchecked")
	public String viewCustomer() throws Exception {
		// QRY_VIP_CUSTOMER
		// SELECT * FROM T_VIP_CUSTOMER WHERE M_MOBILE=?
		AgentUser agentUser = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		List customerList = sqlDao.qryBySQLName("QRY_VIP_CUSTOMER", new Object[] { agentUser.getManagerId() });
		List<String> customers = new ArrayList<String>();
		for (int i = 0; i < customerList.size(); i++) {
			Map c = (Map) customerList.get(i);
			customers.add(c.get("C_MOBILE").toString());
		}
		JSONObject json = new JSONObject();
		JSONArray questions = JSONArray.fromObject(customers);
		json.put("customers", questions);

		HttpUtil.writeHtml(json.toString());

		return NONE;

	}

	private String customerMobile;

	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}

	public String addCustomer() throws Exception {
		// --ADD_VIP_CUSTOMER
		// INSERT INTO T_VIP_CUSTOMER
		// (SEQID,C_MOBILE,M_MOBILE)VALUES(SEQ_VIP_CUST.NEXTVAL,?,?)
		AgentUser agentUser = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		int r = sqlDao.updateBySQLName("ADD_VIP_CUSTOMER", new Object[] { customerMobile, agentUser.getManagerId() });
		HttpUtil.writeHtml(String.valueOf(r));
		return NONE;

	}

	public String removeCustomer() throws Exception {
		String mobiles = "'" + customerMobile.replace(",", "','") + "'";
		String sql = "DELETE FROM T_VIP_CUSTOMER WHERE M_MOBILE=? AND C_MOBILE IN(" + mobiles + ")";
		AgentUser agentUser = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		int r = sqlDao.updateBySQLText(sql, new Object[] { agentUser.getManagerId() });
		HttpUtil.writeHtml(String.valueOf(r));
		return NONE;
	}
}
