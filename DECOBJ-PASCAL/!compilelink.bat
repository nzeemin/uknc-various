@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

if exist DECOBJ.MAC del DECOBJ.MAC
if exist DECOBJ.LST del DECOBJ.LST
if exist DECOBJ.OBJ del DECOBJ.OBJ
if exist DECOBJ.SAV del DECOBJ.SAV

%rt11exe% RU PASCAL DECOBJ,DECOBJ=DECOBJ.PAS

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" DECOBJ.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo DECOBJ.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " DECOBJ.LST
  echo ======= DECOBJ.PAS NOT COMPILED =======
  exit /b
)

%rt11exe% MACRO/LIST:DK: DECOBJ.MAC

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" DECOBJ.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo DECOBJ.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " DECOBJ.LST
  echo ======= %errdet% =======
  exit /b
)

%rt11exe% LINK/STACK:1000 DECOBJ,PASCAL /MAP:DECOBJ.MAP

for /f "delims=" %%a in ('findstr /B "Undefined globals" DECOBJ.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
REM  type DECOBJ.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)
