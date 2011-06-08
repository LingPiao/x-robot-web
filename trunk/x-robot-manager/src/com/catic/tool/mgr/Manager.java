package com.catic.tool.mgr;

import com.catic.tool.DataBase;
import java.util.ArrayList;

public class Manager
{
  String sql = "";

  DataBase db = new DataBase();

  public String getStr(String str) {
    try {
      String temp_p = str;
      byte[] temp_t = temp_p.getBytes("ISO8859-1");
      String temp = new String(temp_t);
      return temp;
    } catch (Exception localException) {
    }
    return "NULL";
  }

  public ArrayList getWelcome()
  {
    this.sql = "select temp.*,th.helptext from (select t.commandid,t.code||','||t.name||'['||t.aliascode||']' from t_command_tree t where t.commandid = 0 or t.commandid = 1 or t.commandid = 2 or t.commandid = 7 or t.commandid = 66 or t.commandid = 69 order by t.code) temp,t_help th where temp.commandid = th.commandid";

    ArrayList list = this.db.get(this.sql, 3);

    return list;
  }

  public String getWelByID(String id)
  {
    this.sql = 
      ("select t.helptext from t_help t where t.commandid = '" + id + 
      "'");

    String rs = this.db.getBySql(this.sql);

    return rs;
  }

  public int updateWel(String id, String memo)
  {
    this.sql = 
      ("update t_help set helptext = '" + memo + "' where commandid = " + 
      id);

    int rs = this.db.update(this.sql);

    return rs;
  }

  public ArrayList getRelated()
  {
    this.sql = "select t.name,t.value from t_properties t order by t.name";
    ArrayList list = this.db.get(this.sql, 2);
    return list;
  }

  public String getRelatedByID(String id) {
    this.sql = ("select t.value from t_properties t where t.name = '" + id + "'");
    String rs = this.db.getBySql(this.sql);
    return rs;
  }

  public int updateRelated(String id, String memo)
  {
    this.sql = 
      ("update t_properties set value = '" + memo + "' where name = '" + 
      id + "'");

    int rs = this.db.update(this.sql);

    return rs;
  }
}