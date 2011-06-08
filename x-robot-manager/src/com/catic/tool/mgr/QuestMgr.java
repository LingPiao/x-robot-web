package com.catic.tool.mgr;

import java.util.ArrayList;

import com.catic.tool.DataBase;

public class QuestMgr {

	String sql = "";

	DataBase db = new DataBase();

	public String getStr(String str) {
		try {
			String temp_p = str;
			byte[] temp_t = temp_p.getBytes("ISO8859-1");
			String temp = new String(temp_t);
			return temp;
		} catch (Exception e) {
		}
		return "NULL";
	}

	// 获取业务分类
	public ArrayList getClassID() {

		sql = "select class_num,class_name from t_unicom_class t where class_type='question' order by CLASS_NUM";

		ArrayList list = db.get(sql, 2);

		return list;
	}

	// 获取问题列表
	public ArrayList getQuest(String t_keyword, String classID) {
		sql = "select t.questionid,t.question,t.answer from t_unicom_question t where t.state = '0' and (t.keyword1 like '%"
				+ t_keyword + "%' or t.keyword2 like '%" + t_keyword + "%')";

		if (!classID.equals("0")) {
			sql = sql + " and t.question_class = '" + classID + "'";
		}

		sql = sql + " order by questionid desc";

		ArrayList list = db.get(sql, 3);

		return list;
	}

	// 获取答案
	public String getAnswer(String questionid) {
		sql = "select t.answer from t_unicom_question t where t.questionid = "
				+ questionid;
		String str = db.getBySql(sql);
		return str;
	}

}
