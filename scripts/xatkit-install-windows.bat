@echo off

echo Creating environment variable XATKIT

set script_path=%~dp0
setx XATKIT %script_path% /M


set /p exit=Done, press any key to exit