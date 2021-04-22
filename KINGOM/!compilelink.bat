@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

@if exist KINGOM.LST del KINGOM.LST
@if exist KINGOM.OBJ del KINGOM.OBJ

%rt11exe% MACRO/LIST:DK: KINGOM.MAC

for /f "delims=" %%a in ('findstr /B "Errors detected" KINGOM.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  echo COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGOM.LST
  echo ======= %errdet% =======
  exit /b
)

@if exist KINGOM.MAP del KINGOM.MAP
@if exist KINGOM.SAV del KINGOM.SAV

%rt11exe% LINK/STACK:1000 KINGOM /MAP:KINGOM.MAP

for /f "delims=" %%a in ('findstr /B "Undefined globals" KINGOM.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
  type KINGOM.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)
