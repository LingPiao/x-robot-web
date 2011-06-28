@echo off
cd /d %~dp0
echo 111111|jarsigner -keystore agentClient.store AgentClient.jar mbq 
echo.
echo Signing the applet...
echo The applet signed successfully.	
echo.
