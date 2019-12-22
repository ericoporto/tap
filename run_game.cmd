@echo on
setlocal enabledelayedexpansion

set AGSGAMEPROJECT=%SYSTEMDRIVE%\projects\ags-test-game
set SAVEGAMEDIR=%USERPROFILE%\Saved Games\

if [%~1]==[] goto :NOPARAM
set AGSGAMEPROJECT="%~1"

:NOPARAM

call %AGSGAMEPROJECT%\ags_test_game\Compiled\Windows\ags_test_game.exe
call %AGSGAMEPROJECT%\ags_test_game\Compiled\Windows\ags_test_game.exe --tell

endlocal
