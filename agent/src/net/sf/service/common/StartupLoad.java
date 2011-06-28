package net.sf.service.common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import net.sf.robot.util.SpringInstance;

public class StartupLoad extends HttpServlet {

	private static final long serialVersionUID = 1L;

	static {
		SpringInstance.launch("spring_config.xml");
	}

	public void init() throws ServletException {
	}
}
