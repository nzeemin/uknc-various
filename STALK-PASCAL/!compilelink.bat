@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

@if exist FRANDU.LST del FRANDU.LST
@if exist FRANDU.OBJ del FRANDU.OBJ
@if exist STALK1.MAC del STALK1.MAC
@if exist STALK1.LST del STALK1.LST
@if exist STALKP.LST del STALKP.LST
@if exist STALKP.OBJ del STALKP.OBJ
@if exist STALKP.SAV del STALKP.SAV

%rt11exe% MACRO/LIST:DK: FRANDU.MAC

for /f "delims=" %%a in ('findstr /B "Errors detected" FRANDU.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  echo FRANDU COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " FRANDU.LST
  echo ======= %errdet% =======
  exit /b
)

%rt11exe% RU PASCAL STALK1,STALK1=STALK1.PAS

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" STALK1.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  echo STALK1.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " STALK1.LST
  echo ======= .PAS NOT COMPILED =======
  exit /b
)

@if exist STALKP.MAC del STALKP.MAC

REM Patching the STALK1.MAC file -> STALK1P.MAC
StalkPatcher\bin\Debug\StalkPatcher.exe

REM Adding BLK000.INC header to the patched file
copy BLK000.INC+STALK1P.MAC STALKP.MAC
del STALK1P.MAC

%rt11exe% MACRO/LIST:DK: STALKP.MAC

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" STALKP.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  echo STALKP.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " STALKP.LST
  echo ======= %errdet% =======
  exit /b
)

%rt11exe% LINK/STACK:1000 STALKP,FRANDU,PASCAL /MAP:STALKP.MAP

for /f "delims=" %%a in ('findstr /B "Undefined globals" STALKP.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
REM  type STALKP.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)
