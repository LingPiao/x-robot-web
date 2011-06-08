package com.catic.tool.page.copy;

import java.util.List;

public interface PageCtrl {

	public void setSql(String sql);

	public void setJdbcSql(String jdbcSql);

	public List getJdbcRecords();

	public void setHql(String hql);

	public List getSqlRecords();

	public List getHqlRecords();

	public void setPageInfo(PageInfo pageInfo);

	public void setSqlwhere(String sqlwhere);

}