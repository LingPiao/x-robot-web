package org.project.dao;

import java.util.List;

import org.project.model.Mtelbook_group;

import com.catic.tool.PageInfo;


public interface Telbook_groupDao {
	public List getGroupByOnwer(String onwer);
	public List getGroupByOnwer(String onwer,PageInfo pageInfo);
	public void add(Mtelbook_group telbook);
	public void update(Mtelbook_group telbook);
	public void del(String delid);
}
