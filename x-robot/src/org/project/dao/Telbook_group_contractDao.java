package org.project.dao;

import java.util.List;

import org.project.model.Mtelbook_group_contract;

import com.catic.tool.PageInfo;


public interface Telbook_group_contractDao {
	public List getByGroupId(String groupid,PageInfo pageInfo);
	public void add(Mtelbook_group_contract telbook);
	public void mod(Mtelbook_group_contract telbook);
	public boolean checkExist(Mtelbook_group_contract telbook);
	public void del(Integer addressbookid,Integer groupid);
}