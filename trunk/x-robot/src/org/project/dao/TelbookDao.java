package org.project.dao;

import java.util.List;

import org.project.model.Mtelbook;
import org.project.model.Mvistor_record;

import com.catic.tool.PageInfo;


public interface TelbookDao {
	public List getTelByOnwer(String id);
	public List getTelByOnwer(String id,String groupid,PageInfo pageInfo);
	public void add(Mtelbook telbook);
	public void update(Mtelbook telbook);
	public void del(String delid);
}
