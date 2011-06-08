package net.sf.robot.service.tool.impl;


import net.sf.robot.util.service.api.RobotService;
import net.sf.robot.util.service.api.RobotServiceFactory;


public class ToolServiceFactoryImpl extends RobotServiceFactory 
{
	@Override
	public RobotService createRobotService() 
	{
		return new ToolServiceImpl(configure);
	}

}
