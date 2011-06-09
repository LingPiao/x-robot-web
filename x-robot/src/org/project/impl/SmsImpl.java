package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.SmsDao;
import org.project.model.Msms;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;
public class SmsImpl implements SmsDao {

	private SqlDao sqlDao;


	public List  getSmsByClassId(String classid,PageInfo pageInfo) {
		String sql ="";
		if(classid.equals("") || classid == null)
		{
			sql ="SELECT * FROM SMS_SMS order by MES_ID desc";
			//return sqlDao.qryBySQLText(sql,new Object[] { });
		}
		else 
		{
			sql ="SELECT * FROM SMS_SMS "
				+ " WHERE MES_CLASS ='"+classid+"'  order by MES_ID desc";
			//return sqlDao.qryBySQLText(sql,new Object[] { classid });			
		}
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
        pageCtrl.setStrSQL(sql);
        return pageCtrl.getRecords();
	}
	public String  getSmsByMesId(String mesid) {
		String sql ="";

			sql ="SELECT * FROM SMS_SMS "
				+ " WHERE MES_ID =?";
		List returnList=sqlDao.qryBySQLText(sql,new Object[] { mesid });
		Map map = (Map) returnList.get(0);
		String returnconten=map.get("MES_CONTENT").toString();
		return returnconten;
	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
