@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

@if exist STALK.LST del STALK.LST
@if exist STALK.OBJ del STALK.OBJ

%rt11exe% MACRO/LIST:DK: STALK.MAC

for /f "delims=" %%a in ('findstr /B "Errors detected" STALK.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  echo COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " STALK.LST
  echo ======= %errdet% =======
  exit /b
)

@if exist STALK.MAP del STALK.MAP
@if exist STALK.SAV del STALK.SAV

%rt11exe% LINK/STACK:1000 STALK /MAP:STALK.MAP

for /f "delims=" %%a in ('findstr /B "Undefined globals" STALK.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
  type STALK.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)

fc /b STALK.GME STALK.SAV
