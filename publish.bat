@echo off
REM Double-clic pour sync vault -> content/ + commit + push (zero prompt)
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0publish.ps1" -Yes
pause
