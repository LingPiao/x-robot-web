package com.catic.bean;

import java.util.HashMap;
import java.util.Map;

import net.sf.robot.util.service.api.RobotService;
import net.sf.robot.util.service.api.RobotServiceFactory;

public class Launch {
	Launch() {
	}

	public void startThread() throws Throwable {
		Map<String, Object> configure = new HashMap<String, Object>();
		configure.put("implementation",
				"net.sf.robot.service.tool.impl.ToolServiceFactoryImpl");
		configure.put("properties_file", "tool.properties");

		RobotServiceFactory factory = RobotServiceFactory
				.createFactory(configure);
		RobotService service = factory.createRobotService();

		service.start();

	}
}
