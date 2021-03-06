@echo off
@SET ComSpec=%SystemRoot%\SysWOW64\cmd.exe
@title x86 Environment

@IF /I (%1) EQU () @FOR /F "tokens=1-4 delims=\" %%i IN ('cd') DO @SET DRIVE=%%i&@SET WORKSPACE=%%j&@SET BRANCH=%%k
@IF /I (%1) NEQ () @FOR /F "tokens=1-4 delims=\" %%i IN ("%~1") DO @SET DRIVE=%%i&@SET WORKSPACE=%%j&@SET BRANCH=%%k

:CheckPath
@IF /I (%DRIVE%) NEQ (c:) @GOTO Usage1
@IF /I "%WORKSPACE%" NEQ "workspace" @GOTO Usage1
@IF /I (%BRANCH%) EQU () @GOTO Usage2
@GOTO initProjectVariables

:::::::::::::::::::CheckPath Help::::::::::::::::::::::::::::
:Usage1
@echo please check your project path!

:Usage2
@echo Current directory is not a valid project path!
@echo Please cd C:\WorkSpace\smXYZ or C:\WorkSpace\smXYZ\[subdir] 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:initProjectVariables
@set PROJSPACE=%DRIVE%\%WORKSPACE%\%BRANCH%
@echo                          PROJSPACE=%DRIVE%\%WORKSPACE%\%BRANCH%

@set EXE=%PROJSPACE%\server\rte\build\Run\Debug
@set DBGEXE=%PROJSPACE%\server\rte\build\Run\Debug
@set SERVER=%PROJSPACE%\server

@set RUBYTEST=%PROJSPACE%\autotest\ruby
@set RUBYLIB=%PROJSPACE%\autotest\ruby\framework;%PROJSPACE%\autotest\ruby\libsm
IF /I (%BRANCH%) EQU (SM930) @SET PROJSPACE_OOB_DB=ODBC_SM930DB
IF /I (%BRANCH%) EQU (SM940) @SET PROJSPACE_OOB_DB=ODBC_SM940DB
IF /I (%BRANCH%) EQU (PROJMAIN) @SET PROJSPACE_OOB_DB=ODBC_SM930DB
IF /I (%BRANCH%) EQU (TRUNK) @SET PROJSPACE_OOB_DB=ODBC_SM940DB


@title %BRANCH%_x86

:init
@set JAVA_1.5_HOME=%ProgramFiles%\Java\jdk1.5.0_22
@set JAVA_1.6_HOME=%ProgramFiles%\Java\jdk1.6.0_30

@set JAVA_HOME=%JAVA_1.6_HOME%
@set MAVEN_HOME=C:\Maven
@set MAVEN_OPTS=-Xms256m -Xmx1024m
@set PATH=%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;%MAVEN_HOME%\bin;%PATH%
@set RUBY_HOME=C:\Ruby187
@set ANT_HOME=C:\ant

@set M2=C:\Users\aidong\.m2
@set M2_HOME=C:\Maven

::@set THIRD_PARTY=\\banana30\ThirdParty
@set THIRD_PARTY=C:\ThirdParty

@SET VSINSTALLDIR=C:\msvs9
@SET VCINSTALLDIR=C:\msvs9\VC
@SET FrameworkDir=C:\Windows\Microsoft.NET\Framework
@SET FrameworkVersion=v2.0.50727
@SET Framework35Version=v3.5
@SET WindowsSdkDir=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\
@SET PSModulePath=C:\Windows\SysWOW64\WindowsPowerShell\v1.0\Modules\

::@echo Setting environment for using Microsoft Visual Studio 2008 x86 tools.

@rem
@rem Root of Visual Studio IDE installed files.
@rem
@set DevEnvDir=C:\msvs9\Common7\IDE

@set PATH=C:\msvs9\Common7\IDE;C:\msvs9\VC\BIN;C:\msvs9\Common7\Tools;C:\Windows\Microsoft.NET\Framework\v3.5;C:\Windows\Microsoft.NET\Framework\v2.0.50727;C:\msvs9\VC\VCPackages;%PATH%
@set INCLUDE=C:\msvs9\VC\ATLMFC\INCLUDE;C:\msvs9\VC\INCLUDE;%INCLUDE%
@set LIB=C:\msvs9\VC\ATLMFC\LIB;C:\msvs9\VC\LIB;%LIB%
@set LIBPATH=C:\Windows\Microsoft.NET\Framework\v3.5;C:\Windows\Microsoft.NET\Framework\v2.0.50727;C:\msvs9\VC\ATLMFC\LIB;C:\msvs9\VC\LIB;%LIBPATH%

@cd %~dp1 > nul 2>&1
@cd %~df1 > nul 2>&1


:initEnvironmentVariables
@set ANT_HOME=C:\ant
@set PATH=C:\msvs9\Common7\IDE
@set PATH=%PATH%;C:\msvs9\VC\BIN
@set PATH=%PATH%;C:\msvs9\Common7\Tools
@set PATH=%PATH%;C:\Windows\Microsoft.NET\Framework\v3.5
@set PATH=%PATH%;C:\Windows\Microsoft.NET\Framework\v2.0.50727

@set PATH=%PATH%;C:\msvs9\VC\VCPackages
::@set PATH=%PATH%;C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\bin
@set PATH=%PATH%;C:\Windows\Microsoft.NET\Framework\v2.0.50727
@set PATH=%PATH%;C:\msvs9\VC\VCPackages
@set PATH=%PATH%;%JAVA_HOME%\bin
@set PATH=%PATH%;%JAVA_HOME%\jre\bin

@set PATH=%PATH%;%MAVEN_HOME%\bin
@set PATH=%PATH%;%JAVA_HOME%\jre\bin
@set PATH=%PATH%;%ANT_HOME%\bin

@set ORACLE_HOME=C:\app\aidong\product\11.2.0\dbhome_1

@set PATH=%PATH%;%ORACLE_HOME%\bin
@set PATH=%PATH%;C:\Program Files (x86)\CollabNet\Subversion Client

@set PATH=%PATH%;C:\Program Files (x86)\Common Files\NetSarang
@set PATH=%PATH%;C:\Program Files (x86)\AMD APP\bin\x86_64
@set PATH=%PATH%;C:\Program Files (x86)\AMD APP\bin\x86
@set PATH=%PATH%;C:\Program Files\RA2HP\
@set PATH=%PATH%;C:\app\aidong\product\11.2.0\client_1\bin
@set PATH=%PATH%;C:\Program Files (x86)\Windows Resource Kits\Tools\
@set PATH=%PATH%;C:\Windows\SysWOW64
@set PATH=%PATH%;C:\Windows
@set PATH=%PATH%;C:\Windows\SysWOW64\Wbem
@set PATH=%PATH%;C:\Windows\SysWOW64\WindowsPowerShell\v1.0\
@set PATH=%PATH%;C:\Program Files\ActivIdentity\ActivClient\
@set PATH=%PATH%;C:\Program Files (x86)\ActivIdentity\ActivClient\
@set PATH=%PATH%;C:\Program Files\WIDCOMM\Bluetooth Software\
@set PATH=%PATH%;C:\Program Files\WIDCOMM\Bluetooth Software\syswow64
@set PATH=%PATH%;C:\Tools\Doxygen\bin
@set PATH=%PATH%;C:\Tools\Graphviz\bin
@set PATH=%PATH%;C:\Program Files (x86)\UltraEdit
@set PATH=%PATH%;C:\Program Files (x86)\ATI Technologies\ATI.ACE\Core-Static
@set PATH=%PATH%;C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\
@set PATH=%PATH%;C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\VSShell\Common7\IDE\
@set PATH=%PATH%;C:\Program Files (x86)\Microsoft SQL Server\100\DTS\Binn\
@set PATH=%PATH%;C:\Program Files (x86)\TortoiseSVN\bin
@set PATH=%PATH%;C:\ntbins\x86
@set PATH=%PATH%;C:\ntbins\x86\LinuxLibsOnWin32
@set PATH=%PATH%;C:\Ruby187\bin
@set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86

@SET "WindowsSdkDir="

:removeDuplicatedVariables
@set PATH=%PATH:;C:\ntbins\x86=%
@set PATH=%PATH%;C:\ntbins\x86

@set PATH=%PATH:;C:\ntbins\x86\LinuxLibsOnWin32=%
@set PATH=%PATH%;C:\ntbins\x86\LinuxLibsOnWin32

@set PATH=%PATH:;%RUBY_HOME%\bin=%
@set PATH=%PATH%;%RUBY_HOME%\bin

@set PATH=%PATH:;%ANT_HOME%\bin=%
@set PATH=%PATH%;%ANT_HOME%\bin

@set PATH=%PATH:C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86=%
@set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86

@set PATH=%PATH:C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\bin=%
@set PATH=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\bin;%PATH%
@set INCLUDE=%INCLUDE:C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\include=%
@set INCLUDE=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\include;%INCLUDE%"
@set LIB=%LIB:C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\lib=%
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\lib;%LIB%

@set LIB=%LIB:C:\Program Files (x86)\Git\cmd=%
@set LIB=C:\Program Files (x86)\Git\cmd;%LIB%


@set LIB=%LIB:C:\Program Files (x86)\Git\bin=%
@set LIB=C:\Program Files (x86)\Git\bin;%LIB%
	

@set PATH=%PATH:C:\Tools\Python\2.5.4\Scripts=%
@set PATH=%PATH%;C:\Tools\Python\2.5.4\Scripts

::@set PATH=%PATH:C:\Program Files (x86)\Apache Software Foundation\Maven 1.1\bin=%
::@set PATH=C:\Program Files (x86)\Apache Software Foundation\Maven 1.1\bin;%PATH%

::@cd %SERVER%

:eof