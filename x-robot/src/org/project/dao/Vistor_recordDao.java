package org.project.dao;

import java.util.List;

import org.project.model.Mvistor_record;

import com.catic.tool.PageInfo;


public interface Vistor_recordDao {
	public void addRecord(Mvistor_record vrecord);
	public List getRecordByOnwer(String onwer,String con,PageInfo pageInfo);
}
