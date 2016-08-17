@echo off
FOR /F "usebackq delims==" %%i IN (`cd`) DO @SET SM_SERVER=%%i

@SET EXE=%SM_SERVER%\rte\build\Run\Debug

@SET DLIST= appserver common configuration cross-platform dao daoobjects embedded irlang mbeanclient mbeans plugins utility scautoserver

FOR /D %%i IN (%DLIST%) DO IF EXIST %%i (CALL :XCOPY %%i) ELSE (GOTO :USAGE)
GOTO :EOF

:XCOPY
@XCopy /Y %SM_SERVER%\%1\build\*.war  %SM_SERVER%\rte\build\Run\Debug\lib
@XCopy /Y %SM_SERVER%\%1\build\*.jar  %SM_SERVER%\rte\build\Run\Debug\lib
GOTO :EOF

:USAGE
@ECHO =========USAGE BEGIN=================================
@ECHO Current directory is not server directory!!!!!!!!
@ECHO Please goto server directory! 
@ECHO or SET %%SM_SERVER%% variable to be server directory.
@ECHO =========USAGE END===================================



