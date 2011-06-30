package org.project.ww;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;
import org.project.dao.VipManagerDao;

import org.project.dao.WoknowDao;
import org.project.model.QuestionSort;

import com.catic.tool.PageInfo;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;


public class WoknowQryAction extends ActionSupport {

	private WoknowDao woknowDao;
	private TuserDao tuserDao;
	
	
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
	
	
	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		
		if(session.get("userid") != null)
		{
			userid=session.get("userid").toString();
			if(userid!=null &&!userid.equals(""))
			{
				nickname=tuserDao.getNicknameByUserid(userid);
			}
		}
		pageRows = 15;
		pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setPageRows(pageRows);
		if(woknow_qry.equals(""))
		{
			return "empty";
		}
		else {
			String woknowString = woknow_qry.replaceAll("　", " ");
			String []woknowArr = woknowString.split(" ");
			//此处只考虑三个关键词
			String con="";
			for(int i=0 ;i<woknowArr.length;i++)
			{
				if(!woknowArr[i].equals(""))
				{
					con = con+woknowArr[i]+"&";	
				}
			}
			String temp_keywords="";
			int count=0;
			String []temp =con.split("&");
			int templength = temp.length;
			List qryList=woknowDao.newqry(con);
			QuestionSort[] qSort = new QuestionSort[qryList.size()];
			for(int i=0;i<qryList.size();i++)
			{
				temp_keywords="";
				Map map =(Map) qryList.get(i);
				count=0;
				for(int j =0;j<templength;j++)
				{
					if(map.get("question").toString().indexOf(temp[j])>-1)
					{
						temp_keywords=temp_keywords+"1";
						count++;
					}
					else 
					{
						temp_keywords=temp_keywords+"0";
					}
				}
				//System.out.println("temp-keyeowrld="+temp_keywords);
				//System.out.println("temp-count="+count);
				qSort[i] = new QuestionSort(map.get("questionid").toString(),map.get("question").toString(),map.get("fromtable").toString(),temp_keywords,count);
			}
			Arrays.sort(qSort);
			List tempqrySortList = new ArrayList();
			qrySortList = new ArrayList();
			for (QuestionSort e : qSort)
			{
				Map new_map =new HashMap();
				new_map.put("questionid", e.getQuestionid());
				new_map.put("question", e.getQuestion());
				new_map.put("fromtable", e.getFromtable());
				new_map.put("keywords", e.getKeywords());
				tempqrySortList.add(new_map);
				//System.out.println("e.getKeywords()="+e.getKeywords());
			}
			pageInfo.setRecordCount(tempqrySortList.size());
			//System.out.println(page);
			int begin = (page-1)*pageRows;
			int end =0;
			if(tempqrySortList.size()<pageInfo.getRecordCount())
			{
				end =tempqrySortList.size();
			}
			else
			{
				end = page*pageRows-1;
			}
			if(end >pageInfo.getRecordCount())
				end = pageInfo.getRecordCount();
			System.out.println(begin);
			System.out.println(end);
			for(int i=begin;i<end;i++)
			{
				Map new_map =new HashMap();
				Map map = (Map) tempqrySortList.get(i);
				new_map.put("questionid", map.get("questionid").toString());
				new_map.put("question", map.get("question").toString());
				new_map.put("fromtable",map.get("fromtable").toString());
				new_map.put("keywords", map.get("keywords").toString());
				qrySortList.add(new_map);
			}
			return SUCCESS;
		}
		
	}
	private List qrySortList;
	private String woknow_qry;
	
	public List getQrySortList() {
		return qrySortList;
	}
	public void setQrySortList(List qrySortList) {
		this.qrySortList = qrySortList;
	}
	public String getWoknow_qry() {
		return woknow_qry;
	}
	public void setWoknow_qry(String woknow_qry) {
		this.woknow_qry = woknow_qry;
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
	private String chanel;
	
	public String getChanel() {
		return chanel;
	}
	public void setChanel(String chanel) {
		this.chanel = chanel;
	}
	public void setVip(String vip) {
		this.vip = vip;
	}
	private String nickname;
	private String usermobile;
	private String user_mobile;
	
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

	private int page = 1;
	private int pageRows;
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
