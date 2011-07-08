package com.catic.tool;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Properties;

public class DataBase {

	private Connection conn = null;

	private Statement stmt = null;

	private ResultSet rs = null;

	private FileInputStream fis; // 定义文件输入流

	private String ip = "localhost";

	private String port = "1521";

	private String uid = "orcl";

	private String username = "unicom";

	private String password = "unicom";

//	private static Properties prop = new Properties(); // 生成新的属性对象

//	public DataBase() {
//		getProp();
//	}
//
//	// 从指定的配置文件加载属性
//	public void getProp() {
//		try {
//			fis = new FileInputStream("config.ini");
//			try {
//				prop.load(fis);
//				ip = new String(prop.getProperty("ip"));
//				port = new String(prop.getProperty("port"));
//				uid = new String(prop.getProperty("uid"));
//				username = new String(prop.getProperty("username"));
//				password = new String(prop.getProperty("password"));
//			} catch (IOException e) {
//				e.printStackTrace();
//			} finally {
//				try {
//					fis.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		} catch (FileNotFoundException e) {
//			System.out.println("Cannot create the config.ini file");
//		}
//	}

	// jdbc驱动获得连接
	public Connection getConn() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		return DriverManager.getConnection("jdbc:oracle:thin:@" + ip + ":"
				+ port + ":" + uid, username, password);
	}

	public int update(String sql) {
		// int count;
		int result = 0;
		try {
			conn = getConn();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			System.out.println(result);
			// return count;
		} catch (Exception e) {
			e.printStackTrace();
			result = 1;
		} finally {
			closeConn();
		}
		return result;
	}

	// 关闭连接
	public void closeConn() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 关闭连接
	public void close() {
		closeConn();
	}

	public ArrayList get(String sql, int col) {
		if (col > 0) {
			ArrayList list = new ArrayList();
			try {
				try {
					conn = getConn();
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					e.printStackTrace();
				}
				while (rs.next()) {
					ArrayList data = new ArrayList(col);
					for (int i = 0; i < col; i++) {
						if (rs.getString(i + 1) != null) {
							data.add(rs.getString(i + 1));
						} else {
							data.add("");
						}
					}
					list.add(data);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException ex) {
				System.out.println(sql + ex.getMessage());
			}
			return list;
		} else {
			return null;
		}
	}

	public ArrayList get(String sql) {
		ArrayList list = new ArrayList();
		try {
			// System.out.println(sql);
			conn = getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmt = rs.getMetaData();
			int col = rsmt.getColumnCount();
			int[] colarray = new int[col];
			for (int i = 0; i < col; i++) {
				colarray[i] = rsmt.getColumnType(i + 1);
				// System.out.println(rsmt.getColumnName(i+1)+" "+colarray[i]);
			}
			while (rs.next()) {
				ArrayList data = new ArrayList(col);
				Timestamp ts_temp = new Timestamp(Long
						.parseLong(databaseTime()));
				String s_temp = new String("");
				for (int i = 0; i < col; i++) {
					switch (colarray[i]) {
					case 4:
					case 5:
					case -5:
					case 2: {
						data.add(new Long(rs.getLong(i + 1)));
						break;
					}
					case -3: {
						break;
					}
					case 1:
					case -1:
					case 12: {
						if ((s_temp = rs.getString(i + 1)) != null) {
							data.add(s_temp);
						} else {
							data.add("");
						}
						break;
					}
					case 93: { // timestamp type
						if ((ts_temp = rs.getTimestamp(i + 1)) != null) {
							data.add(ts_temp);
						} else {
							data.add(new Timestamp(Long
									.parseLong(databaseTime())));
						}
						break;
					}
					default: {
						if ((s_temp = rs.getString(i + 1)) != null) {

							data.add(s_temp);
						} else {
							data.add("");
						}
					}
					}
				}
				list.add(data);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println(sql + ex.getMessage());
		}
		return list;
	}

	public ArrayList getResultSet(ResultSet rs) {
		ArrayList list = new ArrayList();
		try {
			ResultSetMetaData rsmt = rs.getMetaData();
			int col = rsmt.getColumnCount();
			int[] colarray = new int[col];
			for (int i = 0; i < col; i++) {
				colarray[i] = rsmt.getColumnType(i + 1);
				// System.out.println(rsmt.getColumnName(i+1)+" "+colarray[i]);
			}
			while (rs.next()) {
				ArrayList data = new ArrayList(col);
				Timestamp ts_temp = new Timestamp(Long
						.parseLong(databaseTime()));
				String s_temp = new String("");
				for (int i = 0; i < col; i++) {
					switch (colarray[i]) {
					case 4:
					case 5:
					case -5:
					case 2: {
						data.add(new Long(rs.getLong(i + 1)));
						break;
					}
					case -3: {
						break;
					}
					case 1:
					case -1:
					case 12: {
						if ((s_temp = rs.getString(i + 1)) != null) {
							data.add(s_temp);
						} else {
							data.add("");
						}
						break;
					}
					case 93: { // timestamp type
						if ((ts_temp = rs.getTimestamp(i + 1)) != null) {
							data.add(ts_temp);
						} else {
							data.add(new Timestamp(Long
									.parseLong(databaseTime())));
						}
						break;
					}
					default: {
						if ((s_temp = rs.getString(i + 1)) != null) {

							data.add(s_temp);
						} else {
							data.add("");
						}
					}
					}
				}
				list.add(data);
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}

	// 查询结果为一个记录
	public String getBySql(String sql) {

		ArrayList list = get(sql, 1);
		if (list.size() > 0) {
			return (String) (((ArrayList) list.get(0)).get(0));
		} else {
			return "";
		}

	}

	// 判断是否有此记录存在返回1 否则0
	public int isExist(String sql) {

		ArrayList list = get(sql, 1);
		if (list.size() > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	// 根据日期时间得到13位id
	public String get13DateByStr(String date) {
		java.util.Calendar cf = java.util.Calendar.getInstance();
		int iYear = 2003;
		int iMonth = 0;
		int iDay = 1;
		int iHour = 1;
		int iMin = 1;
		int iSec = 1;
		switch (date.length()) {
		case 8:
		case 9:
			int b = date.indexOf("-");
			int e = date.indexOf("-", b + 1);
			iYear = Integer.parseInt(date.substring(0, 4));
			iMonth = Integer.parseInt(date.substring(b + 1, e));
			iDay = Integer.parseInt(date.substring(e + 1));
			cf.set(iYear, iMonth, iDay, 0, 0, 0);
			break;
		case 10:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			cf.set(iYear, iMonth, iDay, 0, 0, 0);
			break;
		case 13:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			iHour = new Integer(date.substring(11, 13)).intValue();
			cf.set(iYear, iMonth, iDay, iHour, 0, 0);
			break;
		case 16:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			iHour = new Integer(date.substring(11, 13)).intValue();
			iMin = new Integer(date.substring(14, 16)).intValue();
			cf.set(iYear, iMonth, iDay, iHour, iMin, 0);
			break;
		case 19:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			iHour = new Integer(date.substring(11, 13)).intValue();
			iMin = new Integer(date.substring(14, 16)).intValue();
			iSec = new Integer(date.substring(17, 19)).intValue();
			cf.set(iYear, iMonth, iDay, iHour, iMin, iSec);
			break;
		default:
			cf.setTime(new java.util.Date(Long.parseLong(databaseTime())));

		}
		return new Long(cf.getTime().getTime()).toString();

	}

	// 格式化数据库时间 13位id（毫秒）
	public String databaseTime() {

		String dataBaseTime = get13DateByStr(getBySql("select to_char(sysdate,'yyyy-mm-dd-hh24-mi-ss') from dual"));

		return dataBaseTime;

	}

}
