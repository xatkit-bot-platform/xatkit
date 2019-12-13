@echo off

echo Creating environment variable XATKIT_DEV

set script_path=%~dp0
setx XATKIT_DEV %script_path% /M


set /p exit=Done, press any key to exit