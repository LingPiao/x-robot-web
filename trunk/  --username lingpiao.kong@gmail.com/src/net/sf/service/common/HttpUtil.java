package net.sf.service.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.webwork.ServletActionContext;

public class HttpUtil {

	private HttpUtil() {

	}

	/**
	 * Write html content with GB2312
	 * 
	 * @param content
	 * @throws IOException
	 */
	public static void writeHtml(String content) throws IOException {
		if (content == null) {
			return;
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		writeHtml(response, content);
	}

	/**
	 * Write html content with GB2312
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param content
	 * @throws IOException
	 */
	public static void writeHtml(HttpServletResponse response, String content) throws IOException {
		if (response == null || content == null) {
			return;
		}
		response.setContentType("text/plain; charset=GB2312");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(content);
			out.flush();
		} catch (IOException e) {
			throw e;
		} finally {
			if (out != null)
				out.close();
		}
	}
}
