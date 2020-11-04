cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
)

SETLOCAL ENABLEDELAYEDEXPANSION

rem "Add your specific volume label to find it, instead of "Volume 4""

for /f "tokens=3" %%c in ('echo list volume ^| diskpart ^| find "Volume 4"') do (
  echo %%c
  set str=%%c
)

echo %str%

cd /d %str%:

rem "Add anything you want in your volume"
start Disable.bat

pause
