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
			sql ="select * from w_question w,w_question_visit wv,MSN_CERTIFICATION m where ("+ qry_con +") and w.q_id=wv.qid(+)  and w.q_user = m.user_msn(+) order by q_id desc";
		else
			sql ="select * from w_question w,w_question_visit wv,MSN_CERTIFICATION m where w.q_id=wv.qid(+)  and w.q_user = m.user_msn(+)  order by q_id desc";
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
		String sql="select * from w_question w,MSN_CERTIFICATION m where w.q_id='"+qid+"' and  w.q_user = m.user_msn(+) ";
		return sqlDao.qryBySQLText(sql);
		
	}
	public List getUnicomQuestionByid(String qid)
	{
		String sCond="";
		String sql="select * from t_unicom_question  where questionid='"+qid+"'";
		System.out.println(sql);
		return sqlDao.qryBySQLText(sql);
		
	}
	public void setQuestionState(String state,String qid)
	{
		String sql="update w_question set Q_STATE='"+state+"' where Q_ID='"+qid+"'";
		sqlDao.insertBySQLText(sql);
	}
	public List qry(String qry_con,PageInfo pageInfo)
	{
		StringBuffer sb= new StringBuffer();
		sb.append(" select questionid,question,fromtable from( ");
		sb.append(" select t.questionid,t.question,t.state || 't_unicom_question' as fromtable from t_unicom_question t ");
		sb.append(" union all ");
		sb.append(" select w.q_id,w.q_content,w.q_state || 'w_question' from w_question w ");
		sb.append(" ) where question like '%"+qry_con+"%' ");
		System.out.println(sb.toString());
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
        pageCtrl.setStrSQL(sb.toString());
		return pageCtrl.getRecords();
	}
	public List newqry(String qry_con)
	{
		String []qry_conArr = qry_con.split("&");
		System.out.println(qry_conArr.length);
		StringBuffer sb= new StringBuffer();
		sb.append(" select questionid,question,fromtable from( ");
		sb.append(" select t.questionid,t.question,'t_unicom_question' as fromtable from t_unicom_question t ");
		sb.append(" union all ");
		sb.append(" select w.q_id,w.q_content,'w_question' as fromtable from w_question w ");
		sb.append(" ) where ");
		for(int i = 0;i<qry_conArr.length;i++)
		{
			sb.append("  question like '%"+qry_conArr[i]+"%' ");
			if(i+1!=qry_conArr.length)
			{
				sb.append(" or ");
			}
		}
		return sqlDao.qryBySQLText(sb.toString());
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
