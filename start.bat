@echo off & setlocal EnableDelayedExpansion
title Blurfnes's Online Security Machine
color a
echo =========================================
echo       Blurfnes's Hacking Machine V1
echo =========================================
echo Please enter your name:
set /p name=
echo.
echo.
echo.
echo.
echo.
echo =====================
echo Good day %name%
echo =====================
echo Please choose what you would like to do below
echo      MENU
echo ______________
echo (1) DDOS
echo (2) Password Generator
echo (3) Rar/Zip Password Cracker
echo (4) Ip Changer
set /p choice="Type in your choice "
if "%choice%"=="1" (
goto ddos
)
if "%choice%"=="2" (
goto passwordgenerator
)
if "%choice%"=="3" (
goto passwordcracker
)
if "%choice%"=="4" (
goto ip
) else (
    start error.bat
)

:ddos
set input=
set /p input= Enter your Website here: 
if %input%==goto A if NOT B
echo Processing Your request
ping localhost>nul
ping localhost>nul
cls
color 02
echo -------------------------------------------------
echo Now DDOSing website. Please press CTRL + C to end
echo -------------------------------------------------
ping %input% -t -l 1000

:passwordgenerator
chcp 1257

set "alpha=aabccdeeefghiijklmnopqrsštuuuvwxyzžAABCCDEEEFGHIIJKLMNOPQRSŠTUUUVWXYZŽ"
set alphaCnt=70

For /L %%j in (1,1,10) DO CALL :GEN %%j

pause
Goto :Eof
:GEN
Set "Password="
For /L %%j in (1,1,10) DO (
    Set /a i=!random! %% alphaCnt
    Call Set PASSWORD=!PASSWORD!%%alpha:~!i!,1%%
)
echo Your Random Password %1 is [%PASSWORD%]

:passwordcracker
title Rar Password Cracker (Numeric)
mode con: cols=60 lines=30
SET PSWD=0
SET DEST=%TEMP%\%RANDOM%
MD %DEST%

:RAR
cls
echo ----------------------------------------------
echo                   GET DETAIL
echo ----------------------------------------------
echo.
SET/P "UNRAR_PATH=Enter Full Path of Unrar.exe (not including itself) :"
SET/P "PATH=Enter Full Path of the file (not including the file name) : "
IF "%PATH%"=="" goto PERROR
cd %PATH%
SET/P "NAME=Enter File Name  : "
IF "%NAME%"=="" goto NERROR
goto NEXT

:NERROR
echo ----------------------------------------------
echo                      ERROR
echo ----------------------------------------------
echo Sorry you can't leave it blank.
pause
goto RAR

:PERROR
echo ----------------------------------------------
echo                      ERROR
echo ----------------------------------------------
echo Sorry you can't leave it blank.
pause
goto RAR

:NEXT
IF EXIST "%PATH%\%NAME%" GOTO START
goto PATH

:PATH
cls
echo ----------------------------------------------
echo                     ERROR
echo ----------------------------------------------
echo Opppss File does not Exist..
pause
goto RAR

:START
cls
echo.
echo  Cracking... This might takes hours...
SET /A PSWD+=1
cd %UNRAR_PATH%
unrar E -INUL -P%PSWD% "%PATH%\%NAME%" "%DEST%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO START

:FINISH
RD %DEST% /Q /S
cls
echo ----------------------------------------------
echo                     CRACKED
echo ----------------------------------------------
echo.
echo PASSWORD FOUND!
echo FILE  = %NAME%
echo CRACKED PASSWORD = %PSWD%
pause >NUL
exit

:changeip
