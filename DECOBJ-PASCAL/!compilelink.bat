@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

if exist DECOB1.MAC del DECOB1.MAC
if exist DECOB1.LST del DECOB1.LST
if exist DECOB1.OBJ del DECOB1.OBJ
if exist DECOB1.SAV del DECOB1.SAV
if exist DECOBJ.MAC del DECOBJ.MAC
if exist DECOBJ.LST del DECOBJ.LST
if exist DECOBJ.OBJ del DECOBJ.OBJ
if exist DECOBJ.SAV del DECOBJ.SAV

%rt11exe% RU PASCAL DECOB1,DECOB1=DECOB1.PAS

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" DECOB1.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo DECOB1.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " DECOB1.LST
  echo ======= DECOB1.PAS NOT COMPILED =======
  exit /b
)

%rt11exe% RU PASCAL DECOB2,DECOB2=DECOB2.PAS

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" DECOB2.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo DECOB2.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " DECOB2.LST
  echo ======= DECOB2.PAS NOT COMPILED =======
  exit /b
)

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

%rt11exe% MACRO/LIST:DK: DECOB1.MAC

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" DECOB1.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo DECOB1.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " DECOB1.LST
  echo ======= %errdet% =======
  exit /b
)

%rt11exe% MACRO/LIST:DK: DECOB2.MAC

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" DECOB2.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo DECOB2.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " DECOB2.LST
  echo ======= %errdet% =======
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

%rt11exe% LINK DECOB1,DECOB2,DECOBJ,PASCAL /EXE:DECOBJ.SAV /MAP:DECOBJ.MAP

for /f "delims=" %%a in ('findstr /B "Undefined globals" DECOBJ.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
REM  type DECOBJ.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)
