package com.catic.bean;

import com.catic.tool.DataConn;
import com.catic.tool.DeleteData;
import com.catic.tool.InsertData;
import com.catic.tool.KenString;
import com.catic.tool.QueryData;
import com.catic.tool.UpdateData;
import java.io.PrintStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class KeyWordAction
{
  private final String sKeyField = "KEYWORD_ID";
  private final String sTable = "T_UNICOM_KEYWORD";
  private final String sField = "KEYWORD_ID,KEYWORD_NAME";
  String sCond = "";
  ResultSet rs = null;
  DataConn dataConn = null;
  QueryData queryData = null;
  InsertData insertData = null;
  UpdateData updateData = null;
  DeleteData deleteData = null;

  public KeyWordAction() { this.dataConn = new DataConn(); }

  public List getAllCategory(String hot_keyword)
  {
	  System.out.println("*********************");
    hot_keyword = hot_keyword.toUpperCase();
    String temptable = "";
    String tempfield = "";
    List list = new ArrayList();
    this.queryData = new QueryData(this.dataConn);
    try {
      if (!hot_keyword.equals("")) {
        this.sCond = ("upper(KEYWORD_NAME) like '%" + hot_keyword + "%' order by " + "KEYWORD_ID");
      }
      else {
        this.sCond = "1=1 order by KEYWORD_ID";
      }
      System.out.println(this.sCond);
      this.queryData.setRecordSet("T_UNICOM_KEYWORD", "KEYWORD_ID,KEYWORD_NAME", this.sCond);
      this.rs = this.queryData.getResultSet();

      while (this.rs.next())
      {
        Map map = new HashMap();
        map.put("KEYWORD_ID", this.rs.getString("KEYWORD_ID"));
        map.put("KEYWORD_NAME", this.rs.getString("KEYWORD_NAME"));
        list.add(map);
      }
      this.rs.close();
      this.dataConn.close();
      this.queryData.close();
    }
    catch (SQLException e) {
      System.out.println("错误原因:" + e.getMessage());
    }
    return list;
  }
  public List getCategoryById(String cateid) {
    String temptable = "";
    String tempfield = "";
    List list = new ArrayList();
    this.queryData = new QueryData(this.dataConn);
    try {
      temptable = "T_UNICOM_KEYWORD";
      tempfield = "KEYWORD_ID,KEYWORD_NAME";
      this.sCond = ("KEYWORD_ID='" + cateid + "'");
      this.queryData.setRecordSet(temptable, tempfield, this.sCond);
      this.rs = this.queryData.getResultSet();

      if (this.rs.next())
      {
        Map map = new HashMap();
        map.put("KEYWORD_ID", this.rs.getString("KEYWORD_ID"));
        map.put("KEYWORD_NAME", this.rs.getString("KEYWORD_NAME"));
        list.add(map);
      }
      this.rs.close();
      this.dataConn.close();
      this.queryData.close();
    }
    catch (SQLException e) {
      System.out.println("错误原因:" + e.getMessage());
    }
    return list;
  }
  public boolean insert(String CLASS_NAME) throws Exception {
    boolean flag = false;
    String tempValueStr = "";
    this.queryData = new QueryData(this.dataConn);
    this.insertData = new InsertData(this.dataConn);
    try {
      int iKey = this.queryData.KeyNextValue("T_UNICOM_KEYWORD", "KEYWORD_ID");
      tempValueStr = iKey + ",'" + CLASS_NAME + "'";
      int iReturn = this.insertData.insert("T_UNICOM_KEYWORD", "KEYWORD_ID,KEYWORD_NAME", tempValueStr);
      if (iReturn == 0)
        flag = true;
      this.dataConn.close();
      this.insertData.close();
    }
    catch (Exception e) {
      throw e;
    }
    return flag;
  }
  public boolean update(String CLASS_ID, String CLASS_NAME) throws Exception {
    boolean flag = false;
    String tempStr = "";
    this.updateData = new UpdateData(this.dataConn);
    try {
      tempStr = "KEYWORD_NAME='" + CLASS_NAME + "'";
      this.sCond = ("KEYWORD_ID='" + CLASS_ID + "'");
      int iReturn = this.updateData.update("T_UNICOM_KEYWORD", tempStr, this.sCond);
      if (iReturn == 0)
        flag = true;
      this.dataConn.close();
      this.updateData.close();
    }
    catch (Exception e) {
      throw e;
    }
    return flag;
  }

  public boolean delete(String[] sID) throws Exception {
    this.deleteData = new DeleteData(this.dataConn);
    boolean flag = false;
    try {
      String idStr = KenString.arrayToString(sID);
      this.sCond = ("KEYWORD_ID in (" + idStr + ")");
      int iReturn = this.deleteData.delete("T_UNICOM_KEYWORD", this.sCond);
      if (iReturn == 0)
        flag = true;
      this.dataConn.close();
      this.deleteData.close();
    }
    catch (Exception e) {
      throw e;
    }
    return flag;
  }
  public int getCategoryNameById(String WORDKEY_NAME) {
    String temptable = "";
    String tempfield = "";
    String catename = "";
    int i = 0;
    this.queryData = new QueryData(this.dataConn);
    temptable = "T_UNICOM_KEYWORD";
    tempfield = "KEYWORD_ID,KEYWORD_NAME";
    this.sCond = (" KEYWORD_NAME = '" + WORDKEY_NAME + "'");
    this.queryData.setRecordCount(temptable, this.sCond);
    i = this.queryData.getRecordCount();

    this.dataConn.close();
    this.queryData.close();
    return i;
  }
  public void close() {
    this.dataConn.close();
  }

  public boolean updateywck(String id, String count) throws Exception
  {
    boolean flag = false;
    String tempStr = "";
    this.updateData = new UpdateData(this.dataConn);
    try {
      tempStr = "COUNT=" + count;
      this.sCond = ("questionid=" + id);
      int iReturn = this.updateData.update("T_UNICOM_QUESTION", tempStr, this.sCond);
      if (iReturn == 0)
        flag = true;
      this.dataConn.close();
      this.updateData.close();
    }
    catch (Exception e) {
      throw e;
    }
    return flag;
  }
}