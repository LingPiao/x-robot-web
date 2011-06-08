package com.catic.tool;
import java.io.*;
import java.sql.*;
import oracle.sql.*;

public class InsertData {
	// 外面传进的参数
	private DataConn dataConn;

	// 内部成员变量

	private Connection conn = null;

	private java.sql.Statement stmt = null;

	private String sqlstr = "";

	// 对外的成员变量
	private int insertdata_errcode = 0;

	private String insertdata_errstr = "";

	public InsertData() {
	}

	/**
	 * 构造函数InsertDfata(DataConn)获得数据库的一个连接 参数为数据库连接类DataConn的一个实例
	 * 
	 * @param dataConnection
	 */
	public InsertData(DataConn dataConnection) {
		dataConn = new DataConn();
		conn = dataConn.getConnection();
	}

	/**
	 * 方法setErrorMessage :设置数据库检验的报错信息
	 * 
	 * @param dataConn的实例
	 */
	private void setErrorMessage() {
	}

	/**
	 * 方法getErrorCode返回执行delete操作的错误代码
	 * 
	 * @return
	 */
	public int getErrorCode() {
		return insertdata_errcode;
	}

	/**
	 * 方法getErrorMessage返回执行delete操作的错误信息
	 * 
	 * @return
	 */
	public String getErrorMessage() {
		return insertdata_errstr;
	}

	/**
	 * 
	 * @param tablenamestr
	 * @param fieldarraystr
	 * @param valuearraystr
	 * @return
	 */
	// 向表中插入数据
	public int insert(String tablenamestr, String fieldarraystr,
			String valuearraystr) {
		insertdata_errcode = 0;
		insertdata_errstr = "";
		boolean flag = true;

		try {
			if (flag) {

				// 向数据表插入数据
				sqlstr = "insert into " + tablenamestr + "(" + fieldarraystr
						+ ") values (";
				sqlstr = sqlstr + valuearraystr + ")";
				//System.out.println(sqlstr);
				stmt = conn.createStatement();
				try {
					stmt.executeUpdate(sqlstr);
				} catch (java.sql.SQLException ex) {
					insertdata_errstr = ex.getMessage();
					insertdata_errcode = ex.getErrorCode();
				}
				stmt.close();
			}
		} catch (java.sql.SQLException ex) {
			insertdata_errstr = ex.getMessage();
			insertdata_errcode = ex.getErrorCode();
		} catch (java.lang.Exception ex) {
			insertdata_errstr = ex.getMessage();
			insertdata_errcode = ex.hashCode();
		}
		// System.out.println(insertdata_errcode);
		return insertdata_errcode;
	}
	/**
	 * 
	 * @param tablenamestr
	 * @param fieldarraystr
	 * @param valuearraystr
	 * @return
	 */
	// 向表中插入数据,BLOG字段用
	public int insertBinaryStream(String sTable,String sField, int MMS_id,String MMS_CLASS,String MMS_TITLE,String MMS_CONTENT) {
		insertdata_errcode = 0;
		insertdata_errstr = "";
		boolean flag = true;
		BLOB blob = null;
		try {
			conn.setAutoCommit(false);
			File   files   =   new   File(MMS_CONTENT);   
		    FileInputStream   fis=new   FileInputStream(files);
		    
		    //这里empty_blob一定要放到最后
			sqlstr="INSERT INTO "+sTable+" ( "+sField+" ) VALUES (?,?,?,empty_blob())";
			PreparedStatement ps = conn.prepareStatement(sqlstr);
		    ps.setInt(1, MMS_id); 
		    ps.setString(2, MMS_TITLE);
		    //int型数据最大也就65535，就是先插入空BLOB或空CLOB, 然后再用update 写入数据流
		    //ps.setBinaryStream(3, fis, (int)files.length());
		    ps.setString(3, MMS_CLASS);
		    ps.executeUpdate();
		    ps.close(); 
		    //更新字段
		    sqlstr="select MMS_CONTENT from "+sTable+" where MMS_ID= ? for update";
		    PreparedStatement ps1 = conn.prepareStatement(sqlstr); 			    
		    ps1.setInt(1,MMS_id); 
            ResultSet rset = ps1.executeQuery();
            if (rset.next()) 
            	blob = (BLOB) rset.getBlob(1); 
            ps = conn.prepareStatement("update "+sTable+" set MMS_CONTENT=? where MMS_ID=?"); 
            OutputStream out = blob.getBinaryOutputStream(); 
            int count = -1, total = 0; 
            byte[] data = new byte[blob.getBufferSize()];
            while ((count = fis.read(data)) != -1) { 
              total += count; 
              out.write(data, 0, count); 
            } 
              
            fis.close(); 
            out.close(); 

            ps.setBlob(1,blob); 
            ps.setInt(2,MMS_id); 
			try {
				ps.executeUpdate();
			} catch (java.sql.SQLException ex) {
				insertdata_errstr = ex.getMessage();
				insertdata_errcode = ex.getErrorCode();
			}
			ps.close();
		    conn.commit(); 
		    conn.close();
		} catch (java.sql.SQLException ex) {
			insertdata_errstr = ex.getMessage();
			insertdata_errcode = ex.getErrorCode();
		}  catch (IOException e){ 
	        System.err.println(e.getMessage()); 
		}

		return insertdata_errcode;
	}
	/**
	 * 从表获得插入数据的最新ID 号
	 * 
	 * @param tablenamestr
	 * @param fiedldnamestr
	 * @return
	 */
	public int getInsertedId(String tablenamestr) {
		String sqlstr = "select @@IDENTITY as 'Identity' from " + tablenamestr;
		int identity = 0;
		try {
			java.sql.Statement stmt = conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery(sqlstr);
			if (rs.next()) {
				identity = rs.getInt("Identity");
			}
			stmt.close();
		} catch (SQLException sqle) {
			insertdata_errstr = sqle.getMessage();
			insertdata_errcode = sqle.hashCode();

		}
		return identity;
	}

	/**
	 * 往数据库新增数据，参数是数组
	 * 
	 * @param sTable
	 * @param field_str
	 * @param value_str
	 * @return
	 * @throws Exception
	 */
	public boolean insert(String sTable, String field_str[], String value_str[])
			throws Exception {
		try {
			if (sTable == null || field_str == null || value_str == null) {

				return false;
			}

			int iField = field_str.length;
			int iValue = value_str.length;
			if (iField != iValue) {

				return false;
			}
			String sField = KenString.arrayToString(field_str);
			String sValue = KenString.arrayToString(value_str);
			String sSQL = "";
			sSQL = " INSERT INTO " + sTable + " (" + sField + ") values ("
					+ sValue + ")";
			// System.out.println(sSQL);
			stmt = conn.createStatement();
			stmt.executeUpdate(sSQL);
			stmt.close();
			return true;
		} catch (Exception e) {
			throw e;
		}

	}
	public void close() {
		if (dataConn != null) {
			try {
				dataConn.close();
			} catch (Exception sqle) {
				
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception sqle) {
				
			}
		}
	}
	public String getSqlStr() {
		return sqlstr;
	}

}
