@echo on
setlocal enabledelayedexpansion

set AGSEDITOR="C:\Program Files (x86)\Adventure Game Studio 3.5.0\AGSEditor.exe"
set AGSGAMEPROJECT=%SYSTEMDRIVE%\projects\ags-test-game

if [%~1]==[] goto :NOPARAM
set AGSGAMEPROJECT="%~1"

:NOPARAM

dir "C:\Program Files (x86)\"
dir %AGSGAMEPROJECT%

call %AGSEDITOR% /compile %AGSGAMEPROJECT%\ags_test_game\Game.agf

endlocal
