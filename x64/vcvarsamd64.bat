@SET ComSpec=%SystemRoot%\system32\cmd.exe

@set JAVA_1.5_HOME=%ProgramFiles%\Java\jdk1.5.0_22
@set JAVA_HOME=%JAVA_1.5_HOME%
@set MAVEN_HOME=C:\Maven
@set MAVEN_OPTS=-Xms256m -Xmx1024m
@set PATH=%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;%MAVEN_HOME%\bin;%PATH%
@set THIRD_PARTY=C:\__WorkSpace__\SM_ThirdParty

@SET VSINSTALLDIR=C:\msvs9
@SET VCINSTALLDIR=C:\msvs9\VC
@SET FrameworkDir=C:\Windows\Microsoft.NET\Framework64
@SET FrameworkVersion=v2.0.50727
@SET Framework35Version=v3.5
@if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
@if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR

@echo Setting environment for using Microsoft Visual Studio 2008 Beta2 x64 tools.

@call :GetWindowsSdkDir

@if not "%WindowsSdkDir%" == "" (
	set "PATH=%WindowsSdkDir%bin\x64;%WindowsSdkDir%bin\win64\x64;%WindowsSdkDir%bin;%PATH%"
	set "INCLUDE=%WindowsSdkDir%include;%INCLUDE%"
	set "LIB=%WindowsSdkDir%lib\x64;%LIB%"
)

@set PATH=%VCINSTALLDIR%\BIN\amd64;%FrameworkDir%\%Framework35Version%;%FrameworkDir%\%Framework35Version%\Microsoft .NET Framework 3.5 (Pre-Release Version);%FrameworkDir%\%FrameworkVersion%;%VCINSTALLDIR%\VCPackages;%VSINSTALLDIR%\Common7\IDE;%VSINSTALLDIR%\Common7\Tools;%VSINSTALLDIR%\Common7\Tools\bin;%PATH%
@set INCLUDE=%VCINSTALLDIR%\ATLMFC\INCLUDE;%VCINSTALLDIR%\INCLUDE;%INCLUDE%
@set LIB=%VCINSTALLDIR%\ATLMFC\LIB\amd64;%VCINSTALLDIR%\LIB\amd64;%LIB%

@set LIBPATH=%FrameworkDir%\%Framework35Version%;%FrameworkDir%\%FrameworkVersion%;%FrameworkDir%\%Framework35Version%;%FrameworkDir%\%FrameworkVersion%;%VCINSTALLDIR%\ATLMFC\LIB\amd64;%VCINSTALLDIR%\LIB\amd64;%LIBPATH%

@goto end

:GetWindowsSdkDir
@call :GetWindowsSdkDirHelper HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkDirHelper HKCU > nul 2>&1
@if errorlevel 1 echo WindowsSdkDir not found
::@exit /B 0
@goto end

:GetWindowsSdkDirHelper
@SET WindowsSdkDir=
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows" /v "CurrentInstallFolder"') DO (
	if "%%i"=="CurrentInstallFolder" (
		SET "WindowsSdkDir=%%k"
	)
)
::@if "%WindowsSdkDir%"=="" exit /B 1
::@exit /B 0
@goto end


:error_no_VSINSTALLDIR
@echo ERROR: VSINSTALLDIR variable is not set. 
@goto end

:error_no_VCINSTALLDIR
@echo ERROR: VCINSTALLDIR variable is not set. 
@goto end

:end
@set PATH=%PATH:;C:\ntbins\x64=%
@set PATH=%PATH%;C:\ntbins\x64
@set PATH=%PATH:C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x64=%
@set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x64
