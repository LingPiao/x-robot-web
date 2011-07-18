package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.VipCustomerDao;


public class VipCustomerImpl implements VipCustomerDao {

	private SqlDao sqlDao;

	public List getCustomerMobileByManagerMobile(String mobile)
	{
		String sql = "SELECT * FROM T_VIP_CUSTOMER tc,t_vip_manager tm WHERE tm.M_MOBILE='"+mobile+"' and tm.seqid=tc.m_mobile";
		System.out.println(sql);
		return sqlDao.qryBySQLText(sql);
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
