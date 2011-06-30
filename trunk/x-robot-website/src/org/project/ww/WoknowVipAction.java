package org.project.ww;

import java.util.List;
import java.util.Map;

import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;
import org.project.dao.VipCustomerDao;
import org.project.dao.VipManagerDao;

import org.project.dao.WoknowDao;

import com.catic.tool.PageInfo;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;


public class WoknowVipAction extends ActionSupport {
	private TuserDao tuserDao;
	private Msn_certificationDao msnDao;
	private WoknowDao woknowDao;
	private VipCustomerDao vipcustomerDao;
	private VipManagerDao vipmanagerDao;
	
	public VipManagerDao getVipmanagerDao() {
		return vipmanagerDao;
	}
	public void setVipmanagerDao(VipManagerDao vipmanagerDao) {
		this.vipmanagerDao = vipmanagerDao;
	}
	public TuserDao getTuserDao() {
		return tuserDao;
	}
	public void setTuserDao(TuserDao tuserDao) {
		this.tuserDao = tuserDao;
	}
	public VipCustomerDao getVipcustomerDao() {
		return vipcustomerDao;
	}
	public void setVipcustomerDao(VipCustomerDao vipcustomerDao) {
		this.vipcustomerDao = vipcustomerDao;
	}
	public WoknowDao getWoknowDao() {
		return woknowDao;
	}
	public void setWoknowDao(WoknowDao woknowDao) {
		this.woknowDao = woknowDao;
	}
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}

	public String execute() throws Exception {
		if(userid==null || userid.equals(""))
			userid=userId;
		nickname=tuserDao.getNicknameByUserid(userid);
		usermobile=msnDao.getMobileByUserMsn(userid);
		if (!usermobile.equals("")) 
		{
			if(vipmanagerDao.isExistMobile(usermobile))
				vip="1";
			else
				vip="0";
		}
		else
		{
			vip="0";
		}
		if(usermobile.length()==11)
		{
			user_mobile=usermobile.substring(0,3)+"****"+usermobile.substring(7, 11);
		}
		else {
			user_mobile=usermobile;
		}
		
		String qry_conString="Q_USER = '"+usermobile+"' ";
		List customer_List = vipcustomerDao.getCustomerMobileByManagerMobile(usermobile);
		System.out.println(customer_List);
		List user_msn=null;
		if(customer_List.size()>0)
		{
			for(int i=0;i<customer_List.size();i++)
			{
				Map map = (Map)customer_List.get(i);
				if (!map.get("C_MOBILE").toString().equals("")) 
				{
					user_msn=msnDao.getUserMsnByMobile(map.get("C_MOBILE").toString());
					qry_conString = qry_conString + " or Q_USER = '"+map.get("C_MOBILE").toString()+"' ";
					if (user_msn.size()>0) 
					{
						for(int j=0;j<user_msn.size();j++)
						{
							Map tempmapMap =(Map)user_msn.get(j);
							qry_conString = qry_conString + " or Q_USER = '"+tempmapMap.get("USER_MSN")+"' ";
						}
					}
				}
			}
		}
		if(from.equals("mobile"))
			pageRows = 15;
		if(from.equals("web"))
			pageRows = 8;
		if(from.equals("msn"))
			pageRows = 8;
		pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setPageRows(pageRows);
		woknowDao.getQuestionList(qry_conString, pageInfo);
		if(from.equals("mobile"))
			return "mobile";
		else if (from.equals("msn")) 
			return "msn";
		else
			return "view";
	}
	//用户来源
	private String from;
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	private String vip;
	public String getVip() {
		return vip;
	}

	public void setVip(String vip) {
		this.vip = vip;
	}
	private String nickname;
	private String usermobile;
	private String user_mobile;
	private String chanel;
	
	public String getChanel() {
		return chanel;
	}
	public void setChanel(String chanel) {
		this.chanel = chanel;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUsermobile() {
		return usermobile;
	}
	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}
	private String op;
	private String userid;
private String userId;

	public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
	private int page = 1;
	private int pageRows = 15;
	private PageInfo pageInfo;

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * @return 返回 page。

	 */
	public int getPage() {

		return page;
	}

	/**
	 * @param page 要设置的 page。

	 */
	public void setPage(int page) {
		if (page >= 1)
			this.page = page;
	}

	/**
	 * @return 返回 pageRows。

	 */
	public int getPageRows() {

		return pageRows;
	}

	/**
	 * @param pageRows 要设置的 pageRows。

	 */
	public void setPageRows(int pageRows) {

		this.pageRows = pageRows;
	}

	

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
