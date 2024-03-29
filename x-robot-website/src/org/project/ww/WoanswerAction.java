package org.project.ww;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;
import org.project.dao.VipManagerDao;
import org.project.dao.WoanswerDao;
import org.project.dao.WoknowDao;
import org.project.dao.WovisitDao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;



import com.catic.tool.ConvertDate;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

public class WoanswerAction extends ActionSupport {
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
		if(ServletActionContext.getRequest().getHeader("User-Agent").indexOf("IE")>0 || ServletActionContext.getRequest().getHeader("User-Agent").indexOf("Firefox")>0)
		{
			if(from == null || from.equals(""))
				from = "web";
		}
		else
		{
			from = "mobile";
		}
		System.out.println(from);
		System.out.println("**************************************");
		System.out.println("**************************************");
		if(userid==null || userid.equals(""))
			userid=userId;
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
		if(usermobile.length()==11)
		{
			user_mobile=usermobile.substring(0,3)+"****"+usermobile.substring(7, 11);
		}
		else {
			user_mobile=usermobile;
		}
		if(op.equals("view") || op.equals("brows"))
		{
			List qList=woknowDao.getQuestionByid(q_id);
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
				if(map.get("USER_TEL")==null)
					user_tel="";
				else
					user_tel=map.get("USER_TEL").toString();
			}
			
			ansList = woanswerDao.getAnswerByQid(q_id);
			System.out.println(ansList);
			//查看是否有最佳答案
			if(woanswerDao.isBestAnswer(q_id))
				bestflag="1";
			else
				bestflag="0";
			if(op.equals("brows"))
			{
				List tempList=wovisitDao.getByqid(q_id);
				if(tempList.size()>0)
				{
					wovisitDao.addBrows(q_id);
				}
				else 
				{
					wovisitDao.inserVisit(q_id);
				}
			}
			if(from.equals("mobile"))
				return "mobile";
			else if (from.equals("msn")) 
				return "msn";
			else
				return "view";
		}
		if(op.equals("answer"))
		{
			List qList=woknowDao.getQuestionByid(q_id);
			if(qList.size()>0)
			{
				Map map = (Map)qList.get(0);
				q_user=map.get("Q_USER").toString();
			}
			woanswerDao.saveAnswer(q_id, A_CONTENT, userid);
			wovisitDao.addAnswer(q_id);
			//System.out.println("111111111111");
			sendMessage(q_user,A_CONTENT);
			//System.out.println("2222222222222");
			return "answer";
		}
		if(op.equals("best"))
		{
			woanswerDao.setBestAnswer(a_id);
			woknowDao.setQuestionState("1", q_id);
			return "best";
		}
		if(op.equals("over"))
		{
			woknowDao.setQuestionState("1", q_id);
			return "best";
		}
		return SUCCESS;
	}
	private void sendMessage(String Q_user,String A_content)
	{  
		try 
		{
			  // 客户端生成
			  Socket socket = new Socket("localhost", 45678);
			  // 输入准备
			  //BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

			  // 输出准备
			  //PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
			  PrintWriter out = new PrintWriter(socket.getOutputStream());
			  // 发送
			  out.print("<msnacc>"+Q_user+"</msnacc><msg>"+A_content+"</msg>");
			  // 从服务端取得的一行信息
			  //System.out.println(in.readLine());
			  out.flush();
			  // 关闭
			  out.close();
			  //in.close();
			  socket.close();
		} 
		catch (IOException e) 
		{
			 e.printStackTrace();
		}
	 }
	public boolean checkEmail(String email){  
		Pattern emailer = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"); 
	    Matcher matcher = emailer.matcher(email);
	    if (matcher.matches()){
	        return true;
	    }
	    return false;
	 }
	//用户来源
	private String from;
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

	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
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
	private String user_tel;
	
	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
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
	//标识从那个栏目访问过来的
	private String chanel;
	
	public String getChanel() {
		return chanel;
	}

	public void setChanel(String chanel) {
		this.chanel = chanel;
	}

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
	private String q_id;
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

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		this.q_id = q_id;
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
