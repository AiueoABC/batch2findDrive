cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
)

echo list volume>b

rem diskpart /s b | find "Volume 4" >a

SETLOCAL ENABLEDELAYEDEXPANSION

rem for /f "tokens=3" %%c in (a) do (
for /f "tokens=3" %%c in ('echo list volume ^| diskpart ^| find "Volume 4"') do (
  echo %%c
  set str=%%c
)

echo %str%

cd /d %str%:

start Disable.bat

pause