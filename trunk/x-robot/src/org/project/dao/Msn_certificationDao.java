package org.project.dao;

import java.util.List;


public interface Msn_certificationDao {
	public List getUserTelByMsnId(String userMsn);
	public void insertUser(String user_msn,String user_tel,String areacode);
	public void del(String user_msn,String user_tel) ;
}
