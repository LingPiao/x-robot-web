package com.catic.tool;

/**
 * @author mikko
 * @filename ConfigInfo.java
 * @date 2008-5-30
 */

public class ConfigInfo {

	private static String driver = null;

	private static String url = null;

	private static String user = null;

	private static String password = null;

	public String getDriver() {
		return driver;
	}

	public String getPassword() {
		return password;
	}

	public String getUrl() {
		return url;
	}

	public String getUser() {
		return user;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setUser(String user) {
		this.user = user;
	}

}