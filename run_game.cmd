@echo off
setlocal enabledelayedexpansion

set AGSGAMEPROJECT=%SYSTEMDRIVE%\projects\tap
set SAVEGAMEDIR=C:\Users\appveyor\SAVEDG~1\tap_demo

if [%~1]==[] goto :NOPARAM
set AGSGAMEPROJECT="%~1"

:NOPARAM

call %AGSGAMEPROJECT%\tap_demo\Compiled\Windows\tap_demo.exe

type %SAVEGAMEDIR%\agstest.log

endlocal
