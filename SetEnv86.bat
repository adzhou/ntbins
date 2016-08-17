@echo off
title x86 Environment
C:\Windows\SysWOW64\cmd.exe /V:ON  /K "C:\ntbins\x86\vsvars32.bat"


if (%1)==() goto :next
set currDir=%1
cd %currDir%
echo Current Directory is changed to %currDir%

:next

set PATH=%PATH:;ntbins=%
set PATH=%PATH%;ntbins

set PATH=%PATH:C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86=%
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86

