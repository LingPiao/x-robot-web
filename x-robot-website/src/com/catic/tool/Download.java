package com.catic.tool;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download extends HttpServlet {

	public Download() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fileName = (String) request.getParameter("fileName");
		String path = "D:\\Tomcat 6.0\\webapps\\unicom\\music\\copyring\\"
				+ fileName;
		File f = new File(path);
		fileName = new String(fileName.getBytes("GB2312"), "ISO8859_1"); // 处理文件中含中文的问题,不是万能的
		boolean isOnLine = false;
		response.reset(); // 非常重要
		if (isOnLine) { // 在线打开方式
			URL u = new URL(path);
			response.setContentType(u.openConnection().getContentType());
			response.setHeader("Content-Disposition", "inline; filename="
					+ f.getName());
		} else { // 纯下载方式
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ fileName);
		}
		byte[] buf = new byte[1024];
		int len = 0;
		BufferedInputStream br = null;
		OutputStream out = null;
		try {
			br = new BufferedInputStream(new FileInputStream(f));
			out = response.getOutputStream();
			while ((len = br.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
			out.flush();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			if (br != null) {
				br.close();
				br = null;
			}
			if (out != null) {
				out.close();
				f.delete();
				out = null;
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
	}

}
