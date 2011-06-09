package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.MmsDao;
import org.project.model.Mmms;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class MmsImpl implements MmsDao {

	private SqlDao sqlDao;
	public List  getMmsByClassId(String classid,PageInfo pageInfo) {
		String sql ="";
		if(classid.equals("") || classid == null)
		{
			sql ="SELECT * FROM sms_mms order by MMS_ID desc";
		}
		else 
		{
			sql ="SELECT * FROM sms_mms "
				+ " WHERE MMS_CLASS ='"+classid+"'  order by MMS_ID desc";
		}
		//System.out.println(sql);
		//PageCtrl pageCtrl = new PageCtrl();
        //pageCtrl.setSqlDao(sqlDao);
        //pageCtrl.setPageInfo(pageInfo);
        //pageCtrl.setStrSQL(sql);
		List returnList=sqlDao.qryBySQLText(sql,new Object[] { });
        return returnList;
	}
	public String  getMmsByMesId(String mesid) {
		String sql ="";

			sql ="SELECT * FROM sms_mms "
				+ " WHERE MMS_ID =?";
		List returnList=sqlDao.qryBySQLText(sql,new Object[] { mesid });
		Map map = (Map) returnList.get(0);
		String returnconten=map.get("MMS_TITLE").toString();
		String mmspicurl=map.get("MMS_PICURL").toString();
		return returnconten+"#"+mmspicurl;
	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
