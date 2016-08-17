@echo off
@call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\vcvars32.bat"
@set MAVEN_HOME=D:/SMTools/Maven 2.2.1
@set TOMCAT_HOME=D:\SMTools\Tomcat7
@set JAVA_HOME=D:/SMTools/jdk1.6.0_30
@set ANT_HOME=C:/ant192
set CPP_CHECK=C:\Program Files (x86)\Cppcheck
set SysBin=C:\Windows\SysWOW64\
set ComSpec=%SysBin%cmd.exe
set PYTHON_HOME=C:\Python27\
set SVN_HOME=C:\Program Files (x86)\CollabNet\Subversion Client\

set BullEyeBin=C:\__WorkSpace__\SM\9.4xmain\server\rte\build\BullseyeCoverage\bin

set PATH=C:\Ruby200\bin;C:\Perl\site\bin;C:\Perl\bin;c:\python27;c:\python27\Scripts
set PATH=%PATH%;%BullEyeBin%
set PATH=%PATH%;%ANT_HOME%\bin;%MAVEN_HOME%/bin;%TOMCAT_HOME%/bin;%JAVA_HOME%\bin
set PATH=%PATH%;C:\Program Files (x86)\Beyond Compare 3
set PATH=%PATH%;D:\MaaSTools\UltraEdit;C:\ntbins\x86
set PATH=%PATH%;%CPP_CHECK%
set PATH=%PATH%;%SysBin%
set PATH=%PATH%;%SVN_HOME%



set CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:%JAVA_HOME%/lib/tools.jar
set THIRD_PARTY=D:\ThirdParty



