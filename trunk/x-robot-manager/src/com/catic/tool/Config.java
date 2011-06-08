package com.catic.tool;

/**
 * @author mikko
 * @filename Config.java
 * @date 2008-5-30
 */
import org.dom4j.Document;
import org.dom4j.io.SAXReader;
import org.dom4j.Element;
import java.io.File;

public class Config {

	private static String rootPath = null;

	private static String configPath = null;

	private static ConfigInfo configInfo = null;

	public Config() {
	}

	public Config(String strRootPath) {
		rootPath = strRootPath;
		configPath = rootPath + "\\WEB-INF\\Config.xml";
	}

	public static String getRootPath() {
		return rootPath;
	}

	public static ConfigInfo getConfigInfo() {
		return configInfo;
	}

	public static void setConfigInfo() {
		try {
			SAXReader reader = new SAXReader();
			Document document = reader.read(new File(configPath));

			// 得到根节点
			Element root = document.getRootElement();
			Object[] obj_root = root.elements().toArray();
			int iLen = obj_root.length;

			for (int i = 0; i < iLen; i++) {
				Element child = (Element) obj_root[i];

				if (child.attribute("name").getValue().equals(
						"Db_Connection_Config")) {
					Object[] obj_child = child.elements().toArray();
					configInfo = new ConfigInfo();
					configInfo.setDriver(((Element) obj_child[0]).attribute(
							"value").getValue());
					configInfo.setUrl(((Element) obj_child[1]).attribute(
							"value").getValue());
					configInfo.setUser(((Element) obj_child[2]).attribute(
							"value").getValue());
					configInfo.setPassword(((Element) obj_child[3]).attribute(
							"value").getValue());
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}