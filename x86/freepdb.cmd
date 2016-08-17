@echo off
rem This script works around the bug causing a locked program database (pdb)
rem after each debug session with Visual Studio 2003 on Windows 7.
rem 
rem You will need the Handle utility from Windows Sysinternals for this script.
rem (1) Get it here and extract it into the folder containing this script:
rem     site: http://technet.microsoft.com/en-us/sysinternals/bb896655.aspx
rem     file: http://download.sysinternals.com/Files/Handle.zip
rem
rem To automate execution, open the properties dialog of your project in VS2003:
rem (2) Navigate to:     Build Events -> Pre-Build Event -> Command Line
rem (3) Enter this line: <path>\freepdb $(ProjectName)
rem     Replace <path> with the path to the folder containing this script.
rem
rem Have fun!
rem
rem 30/05/2010 support multiple handle instances of multiple debug sessions
rem 29/05/2010 initial version
rem freepdb@inot.de

if "%1"=="" (
  echo Usage: freepdb filename
  echo This will free all handles of VS2003 on filename.pdb
  echo Requires the Handle utility from Windows Sysinternals
  goto :eof
)

cd /d "%~dp0"
for /f "tokens=2 skip=5 delims=:" %%a in ('handle -p devenv.exe "%1.pdb"') do (
  for /f "tokens=1-2" %%b in ("%%a") do (
    handle -p %%b -c %%c -y >NUL
  )
)
exit /b 0
