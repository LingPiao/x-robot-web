package org.project.impl;

import java.beans.PropertyDescriptor;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConstructorUtils;
import org.project.dao.SqlDao;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;

public class SqlImpl implements SqlDao {
	
	private JdbcTemplate jdbcTemplate;
	
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * 直接根据SQL进行查询
	 * @param sqlText		欲查询的SQL语句
	 * @param args			SQL语句的参数�?
	 * @return				返回满足条件的记�?
	 */
	public List qryBySQLText(String sqlText, Object[] args)
	{
		
		return jdbcTemplate.queryForList(sqlText, args);
	}
	public List qryBySQLText(String sqlText)
	{
		
		return jdbcTemplate.queryForList(sqlText);
	}
	/**
	 * 直接根据SQL进行查询
	 * @param sqlText		欲查询的SQL语句
	 * @param args			SQL语句的参数�?
	 * @param className		记录�?��被映射成的对�?
	 * @return				返回满足条件的对�?
	 */
	public List qryBySQLText(String sqlText, Object[] args, final Class className)
	{
		if (className == null)
			return qryBySQLText(sqlText, args);
		
		final List list = new ArrayList();
		
		Orm orm = new Orm(className);
		jdbcTemplate.query(sqlText, args, orm);
		return orm.getList();
	}
	public void insertBySQLText (String sqlText){
		jdbcTemplate.execute(sqlText);		
	}
	/**
	 * 直接根据SQL语句，执行更新语句的操作
	 * @param sqlText		欲执行的SQL语句
	 * @param args			SQL语句的参数�?
	 */
	public int updateBySQLText(String sqlText, Object[] args)
	{
		
		return jdbcTemplate.update(sqlText, args);
	}
	public int queryForInt(String sqlText) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForInt(sqlText);
	}
	class Orm implements RowCallbackHandler
	{
		private Class className;
		private final List list = new ArrayList();
		
		
		public Orm(Class className)
		{
			this.className = className;
		}
		
		public List getList()
		{
			return list;
		}
		public void processRow(ResultSet rs) throws SQLException 
		{
			try 
			{
				BeanWrapperImpl bw = new BeanWrapperImpl(className);
				String columnName = "";
				String propertyName = "";
				ResultSetMetaData md = rs.getMetaData();
				PropertyDescriptor[] properties = bw.getPropertyDescriptors();
				for (int i = 1 ; i <= md.getColumnCount(); i++)
				{
					columnName = md.getColumnName(i);
					
					for (int j = 0; j < properties.length; j++)
					{
						try
						{
							Class[] parameterType = new Class[1];
							parameterType[0] = properties[j].getPropertyType();
							propertyName = properties[j].getName();
							
							if (propertyName.equalsIgnoreCase(columnName) && bw.isWritableProperty(propertyName))
							{
								if (parameterType[0].getPackage().getName().startsWith("org.project"))
								{
									Object[] rstVal = null;
									if (rs.getObject(i) != null)
									{
										rstVal = new Object[1];
										rstVal[0] = new Integer(rs.getInt(i));
									}
									
									Object value = ConstructorUtils.invokeConstructor(parameterType[0],  rstVal);
									BeanUtils.setProperty(bw.getWrappedInstance(), propertyName, value);
								}
								else
								{
									if (parameterType[0].toString().endsWith("Integer"))
										BeanUtils.setProperty(bw.getWrappedInstance(), propertyName, new Integer(rs.getInt(i)));
									else if (parameterType[0].toString().endsWith("String"))
										BeanUtils.setProperty(bw.getWrappedInstance(), propertyName, rs.getObject(i).toString());
									else if (parameterType[0].toString().endsWith("Float"))
										BeanUtils.setProperty(bw.getWrappedInstance(), propertyName, new Float(rs.getObject(i).toString()));
									else if (parameterType[0].toString().endsWith("Date"))
										BeanUtils.setProperty(bw.getWrappedInstance(), propertyName, rs.getDate(i));
									else
										BeanUtils.setProperty(bw.getWrappedInstance(), propertyName, rs.getObject(i));
								}
								
								break;
							}
						}
						catch(Exception ex)
						{
							
						}
					}
				}
				list.add(bw.getWrappedInstance());
			}
			catch (Exception e) 
			{
				
			}
		}
	}

	

}
