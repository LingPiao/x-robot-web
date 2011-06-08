package com.catic.tool;

import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import java.io.*;
import java.util.*;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2009
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author Ã·Ïþ¶¬
 * @version 1.0
 */

public class ConfigServlet extends HttpServlet {

	private static final String CONTENT_TYPE = "text/html; charset=GBK";

	// Initialize global variables
	public void init(ServletConfig servletConfig) throws ServletException {
		String path = servletConfig.getServletContext().getRealPath("");
		Config config = new Config(path);
		config.setConfigInfo();
	}

	// Clean up resources
	public void destroy() {
	}
}