package com.catic.bean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class StartupLoad extends HttpServlet {

	public void init() throws ServletException {

		Launch launch = new Launch();

		try {
			launch.startThread();
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}

}
