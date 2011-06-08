package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.VipCustomerDao;


public class VipCustomerImpl implements VipCustomerDao {

	private SqlDao sqlDao;

	public List getCustomerMobileByManagerMobile(String mobile)
	{
		String sql = "SELECT * FROM T_VIP_CUSTOMER "
			+ " WHERE M_MOBILE =?";
		return sqlDao.qryBySQLText(sql,new Object[] { mobile });
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
