package org.project.dao;

import java.util.List;


public interface Msn_certificationDao {
	public List getUserTelByMsnId(String userMsn);
	public void insertUser(String user_msn,String user_tel,String areacode);
	public boolean check(String user_msn);
	public void update(String user_msn,String user_tel);
	public void del(String user_msn,String user_tel) ;
}
