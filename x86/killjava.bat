@echo off

@taskKill /F /IM java.exe /T
@taskKill /F /IM java32.exe /T
@taskKill /F /IM java64.exe /T
@taskKill /F /IM javaw.exe /T

@taskKill /F /IM tomcat*.exe /T