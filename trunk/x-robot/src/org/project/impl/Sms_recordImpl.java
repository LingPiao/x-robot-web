package org.project.impl;

import java.util.List;

import org.project.dao.Sms_recordDao;
import org.project.dao.SqlDao;
import org.project.dao.Sms_recordDao;
import org.project.model.Msms_record;


public class Sms_recordImpl implements Sms_recordDao {

	private SqlDao sqlDao;
	public void  addRecord(Msms_record srecord) {
		String sql ="";
		sql ="Select max(REC_ID) as num from sms_record";
		int maxid = sqlDao.queryForInt(sql);
		maxid++;
		//System.out.println(maxid);
		sql = "insert into sms_record(REC_ID,REC_SEND_TEL,REC_SEND_TIME,REC_SEND_CONTENT,REC_RECIEVE_TEL,REC_RECIEVE_NAME,MEG_CLASS,REC_SEND_PICURL,del) values " +
				"("+maxid+",'"+srecord.getREC_SEND_TEL()+"',"+srecord.getREC_SEND_TIME()+",'"+srecord.getREC_SEND_CONTENT()+"'," +
						"'"+srecord.getREC_RECIEVE_TEL()+"','"+srecord.getREC_RECIEVE_NAME()+"','"+srecord.getMEG_CLASS()+"'," +
								"'"+srecord.getREC_SEND_PICURL()+"','"+srecord.getDEL()+"')";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
