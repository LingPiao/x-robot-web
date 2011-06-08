package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.WoknowDao;


import org.project.model.Woknow;


import com.catic.tool.ConvertDate;
import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;


public class WoknowImpl implements WoknowDao {

	private SqlDao sqlDao;
	public List getQuestionList(String qry_con,PageInfo pageInfo)
	{
		
		String sql="";
		if(!qry_con.equals(""))
			sql ="select * from w_question w,w_question_visit wv where ("+ qry_con +") and w.q_id=wv.qid(+) order by q_id desc";
		else
			sql ="select * from w_question w,w_question_visit wv where w.q_id=wv.qid(+) order by q_id desc";
		System.out.println(sql);
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
        pageCtrl.setStrSQL(sql);
		return pageCtrl.getRecords();
	}
	public List getQuestionList(int nums)
	{
		String sql ="select tt.*,RowNum from(select t.* from w_question t order by t.q_id desc ) tt where RowNum<="+nums;
		
		return sqlDao.qryBySQLText(sql);
	}
	public List getQuestionByid(String qid)
	{
		String sCond="";
		String sql="select * from w_question  where q_id='"+qid+"'";
		return sqlDao.qryBySQLText(sql);
		
	}
	public void setQuestionState(String state,String qid)
	{
		String sql="update w_question set Q_STATE='"+state+"' where Q_ID='"+qid+"'";
		sqlDao.insertBySQLText(sql);
	}
	
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
