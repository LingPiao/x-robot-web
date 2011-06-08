package net.sf.robot.service.tool.impl;

import java.util.Map;

import net.sf.robot.util.service.api.RequestHandleFactory;
import net.sf.robot.util.service.impl.RobotServiceImpl;

public class ToolServiceImpl extends RobotServiceImpl {
	public ToolServiceImpl(Map<String, Object> configure) {
		super(configure);
	}

	public RequestHandleFactory createHandleFactory() {
		return new ToolReqHandleFactory();
	}
}
