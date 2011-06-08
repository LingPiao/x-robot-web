package org.project.dao;

import java.util.List;

public interface SqlDao {
	public List qryBySQLText(String sqlText);
	public List qryBySQLText(String sqlText, Object[] args);
	public List qryBySQLText(String sqlText, Object[] args, final Class className);
	public int updateBySQLText(String sqlText, Object[] args);
	public int queryForInt(String sqlText);
	public void insertBySQLText (String sqlText);
}
