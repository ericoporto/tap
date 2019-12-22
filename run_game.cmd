@echo on
setlocal enabledelayedexpansion

set AGSGAMEPROJECT=%SYSTEMDRIVE%\projects\ags-test-game
set SAVEGAMEDIR=C:\Users\appveyor\SAVEDG~1\ags_test_game

if [%~1]==[] goto :NOPARAM
set AGSGAMEPROJECT="%~1"

:NOPARAM

call %AGSGAMEPROJECT%\ags_test_game\Compiled\Windows\ags_test_game.exe
dir %SAVEGAMEDIR%

type %SAVEGAMEDIR%\agstest.log

endlocal
