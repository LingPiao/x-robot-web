package org.project.dao;

import java.util.List;


public interface Msn_certificationDao {
	public List getUserMsnByMobile(String user_mobile);
	
	public String getMobileByUserMsn(String user_msn);
	
	public void BindMobile(String userid,String mobile);
	
	public void UnBindMobile(String userid,String mobile);
	}
