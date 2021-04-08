@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

@if exist STALK1.MAC del STALK1.MAC
@if exist STALK1.LST del STALK1.LST
@if exist STALK1.OBJ del STALK1.OBJ
@if exist STALK1.SAV del STALK1.SAV

%rt11exe% RU PASDWK.SAV STALK1,STALK1=STALK1.PAS

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" STALK1.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  echo .PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " STALK1.LST
  echo ======= .PAS NOT COMPILED =======
  exit /b
)

@if exist STALK1.LST del STALK1.LST

%rt11exe% MACRO/LIST:DK: STALK1.MAC

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" STALK1.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  echo COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " STALK1.LST
  echo ======= %errdet% =======
  exit /b
)

%rt11exe% LINK/STACK:1000 STALK1,PASDWK /MAP:STALK1.MAP

for /f "delims=" %%a in ('findstr /B "Undefined globals" STALK1.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
REM  type STALK1.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)
