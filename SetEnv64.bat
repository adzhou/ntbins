@echo off

title X64 Environment

start /B C:\Windows\System32\cmd.exe /V:ON  

"C:\msvs9\VC\vcvarsall.bat" x64

if (%1)==() goto :next
set currDir=%1
cd %currDir%
echo Current Directory is changed to %currDir%

:next



pushd
set PATH=%PATH:;ntbins=%
set PATH=%PATH%;ntbins
set PATH=%PATH:C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x64=%
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x64
popd
