@echo off
cls
setlocal enabledelayedexpansion

:input
set /p userInput=Enter the IP address or domain name (ip/domain -n 6): 

:: Extract the target and count from the user input
for /f "tokens=1,2,3 delims= " %%a in ("%userInput%") do (
    set target=%%a
    if /i "%%b"=="-n" (
        set count=%%c
    ) else (
        set count=4
    )
)

:pingLoop
cls
color 0A
ping -n %count% %target%
color 07

:continuePrompt
set /p exitChoice=Type 'exit' to stop or press Enter to ping again: 
if /i "%exitChoice%"=="exit" goto :resetColor
goto :input

:resetColor
color 07
cls
:end
echo Closed.