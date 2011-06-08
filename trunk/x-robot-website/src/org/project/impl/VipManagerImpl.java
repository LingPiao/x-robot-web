package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.VipManagerDao;


public class VipManagerImpl implements VipManagerDao {

	private SqlDao sqlDao;

	public boolean isExistMobile(String mobile)
	{
		String sql = "SELECT * FROM T_VIP_MANAGER "
			+ " WHERE M_MOBILE =?";
		List listtempList= sqlDao.qryBySQLText(sql,new Object[] { mobile });
		//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		if(listtempList.size()>0)
		{
			return true;
		}
		else {
			return false;
		}

	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
