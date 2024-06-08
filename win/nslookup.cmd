@echo off
cls
setlocal enabledelayedexpansion

:: Save the initial DNS settings
for /f "tokens=1,* delims=:" %%a in ('netsh interface ip show dns ^| find "DNS Servers"') do (
    set initialDNS=%%b
)

:: Set Google DNS servers
echo Setting DNS servers to Google's DNS (8.8.8.8 and 8.8.4.4)...
netsh interface ipv4 set dns name="Local Area Connection" static 8.8.8.8
netsh interface ipv4 add dns name="Local Area Connection" 8.8.4.4 index=2

:input
set /p domain=Enter the domain name: 

:nslookupLoop
cls
color 0A
echo Retrieving DNS records for %domain%...
nslookup %domain%
color 07

:continuePrompt
set /p exitChoice=Type 'exit' to stop or press Enter to lookup another domain: 
if /i "%exitChoice%"=="exit" goto :resetColor
goto :input

:resetColor
:: Reset DNS servers to initial settings
echo Resetting DNS servers to initial settings...
netsh interface ipv4 set dns name="Local Area Connection" %initialDNS%

color 07
cls
:end
echo Closed.