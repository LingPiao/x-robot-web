package org.project.ww;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;
import org.project.dao.VipManagerDao;
import org.project.dao.WoanswerDao;
import org.project.dao.WovisitDao;

import org.project.dao.WoknowDao;

import com.catic.tool.PageInfo;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;


public class WoknowQryBrowsAction extends ActionSupport {

	private WoanswerDao woanswerDao;
	private WoknowDao woknowDao;
	private WovisitDao wovisitDao;
	private Msn_certificationDao msnDao;
	private VipManagerDao vipmanagerDao;
	private TuserDao tuserDao;
	
	
	
	public WovisitDao getWovisitDao() {
		return wovisitDao;
	}

	public void setWovisitDao(WovisitDao wovisitDao) {
		this.wovisitDao = wovisitDao;
	}

	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}

	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}

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

	public WoknowDao getWoknowDao() {
		return woknowDao;
	}

	public void setWoknowDao(WoknowDao woknowDao) {
		this.woknowDao = woknowDao;
	}

	public WoanswerDao getWoanswerDao() {
		return woanswerDao;
	}

	public void setWoanswerDao(WoanswerDao woanswerDao) {
		this.woanswerDao = woanswerDao;
	}

	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		if(session.get("userid") != null)
		{
			userid=session.get("userid").toString();
			System.out.println(userid);
			if(userid!=null &&!userid.equals(""))
			{
				nickname=tuserDao.getNicknameByUserid(userid);
				usermobile=msnDao.getMobileByUserMsn(userid);
				type=tuserDao.getTypeByUserid(userid);
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
			}
			if(usermobile.length()==11)
			{
				user_mobile=usermobile.substring(0,3)+"****"+usermobile.substring(7, 11);
			}
			else {
				user_mobile=usermobile;
			}
		}
		
		if(op.equals("view") || op.equals("brows"))
		{
			List qList=null;
			if(ft.equals("w_question"))
			{
				qList=woknowDao.getQuestionByid(questionid);
				if(qList.size()>0)
				{
					Map map = (Map)qList.get(0);
					if(map.get("Q_CONTENT")==null)
						content = "";
					else
						content = map.get("Q_CONTENT").toString();
					state=  map.get("Q_STATE").toString();
					q_date= map.get("Q_DATE").toString();
					q_user=map.get("Q_USER").toString();
					
				}
				ansList = woanswerDao.getAnswerByQid(questionid);
				System.out.println(ansList);
				//查看是否有最佳答案
				if(woanswerDao.isBestAnswer(questionid))
					bestflag="1";
				else
					bestflag="0";
				if(op.equals("brows"))
				{
					List tempList=wovisitDao.getByqid(questionid);
					if(tempList.size()>0)
					{
						wovisitDao.addBrows(questionid);
					}
					else 
					{
						wovisitDao.inserVisit(questionid);
					}
				}
				return "view_woknow";
			}
			if(ft.equals("t_unicom_question"))
			{
				ansList=woknowDao.getUnicomQuestionByid(questionid);
				
				return "view_unicom";
			}
		}
		if(op.equals("answer_qry"))
		{
			woanswerDao.saveAnswer(questionid, A_CONTENT, userid);
			wovisitDao.addAnswer(questionid);
			System.out.println("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
			return "answer";
		}
		if(op.equals("best"))
		{
			woanswerDao.setBestAnswer(a_id);
			woknowDao.setQuestionState("1", questionid);
			return "answer";
		}
		if(op.equals("over"))
		{
			woknowDao.setQuestionState("1", questionid);
			return "answer";
		}
		return SUCCESS;
	}
	public boolean checkEmail(String email){  
		Pattern emailer = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"); 
	    Matcher matcher = emailer.matcher(email);
	    if (matcher.matches()){
	        return true;
	    }
	    return false;
	 }
	private String questionid;
	private String ft;
	
	public String getQuestionid() {
		return questionid;
	}

	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}

	public String getFt() {
		return ft;
	}

	public void setFt(String ft) {
		this.ft = ft;
	}
	private String nickname;

	private String user_mobile;
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_mobile() {
		return user_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}

	private String op;
	private String userid;
	private String bestflag;
	private String content;
	private String state;
	private String q_user;
	private String q_date;
	private String q_validity;
	private String usermobile;
	private String vip;
	private String service;
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsermobile() {
		return usermobile;
	}

	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}

	public String getVip() {
		return vip;
	}

	public void setVip(String vip) {
		this.vip = vip;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getQ_validity() {
		return q_validity;
	}

	public void setQ_validity(String q_validity) {
		this.q_validity = q_validity;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	private String a_id;
	
	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	private String A_CONTENT;
	
	public String getBestflag() {
		return bestflag;
	}

	public void setBestflag(String bestflag) {
		this.bestflag = bestflag;
	}
	private List ansList;
	
	
	
	public String getQ_user() {
		return q_user;
	}

	public void setQ_user(String q_user) {
		this.q_user = q_user;
	}

	public List getAnsList() {
		return ansList;
	}

	public void setAnsList(List ansList) {
		this.ansList = ansList;
	}
	public String getA_CONTENT() {
		return A_CONTENT;
	}

	public void setA_CONTENT(String a_content) {
		A_CONTENT = a_content;
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
