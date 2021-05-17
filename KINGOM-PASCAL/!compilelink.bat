@echo off
set rt11exe=C:\bin\rt11\rt11.exe

rem Define ESCchar to use in ANSI escape sequences
rem https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESCchar=%%E"

if exist KINGOM.MAC del KINGOM.MAC
if exist KINGM2.MAC del KINGM2.MAC
if exist KINGM3.MAC del KINGM3.MAC
if exist KINGM4.MAC del KINGM4.MAC
if exist KINGM5.MAC del KINGM5.MAC
if exist KINGM6.MAC del KINGM6.MAC
if exist KINGOM.LST del KINGOM.LST
if exist KINGM2.LST del KINGM2.LST
if exist KINGM3.LST del KINGM3.LST
if exist KINGM4.LST del KINGM4.LST
if exist KINGM5.LST del KINGM5.LST
if exist KINGM6.LST del KINGM6.LST
if exist KINGOM.OBJ del KINGOM.OBJ
if exist KINGM2.OBJ del KINGM2.OBJ
if exist KINGM3.OBJ del KINGM3.OBJ
if exist KINGM4.OBJ del KINGM4.OBJ
if exist KINGM5.OBJ del KINGM5.OBJ
if exist KINGM6.OBJ del KINGM6.OBJ
if exist KINGOM.SAV del KINGOM.SAV

%rt11exe% @CPAS

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" KINGOM.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo KINGOM.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " KINGOM.LST
  echo ======= KINGOM.PAS NOT COMPILED =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" KINGM2.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo KINGM2.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " KINGM2.LST
  echo ======= KINGM2.PAS NOT COMPILED =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" KINGM3.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo KINGM3.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " KINGM3.LST
  echo ======= KINGM3.PAS NOT COMPILED =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" KINGM4.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo KINGM4.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " KINGM4.LST
  echo ======= KINGM4.PAS NOT COMPILED =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" KINGM5.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo KINGM5.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " KINGM5.LST
  echo ======= KINGM5.PAS NOT COMPILED =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "ERRORS DETECTED" KINGM6.LST') do set "errdet=%%a"
if "%errdet%"=="ERRORS DETECTED:  0    " (
  rem echo KINGM6.PAS COMPILED SUCCESSFULLY
) ELSE (
REM  findstr /RC:"^****** " KINGM6.LST
  echo ======= KINGM6.PAS NOT COMPILED =======
  exit /b
)

%rt11exe% @CMACRO

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" KINGOM.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo KINGOM.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGOM.LST
  echo ======= %errdet% =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" KINGM2.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo KINGM2.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGM2.LST
  echo ======= %errdet% =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" KINGM3.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo KINGM3.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGM3.LST
  echo ======= %errdet% =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" KINGM4.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo KINGM4.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGM4.LST
  echo ======= %errdet% =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" KINGM5.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo KINGM5.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGM5.LST
  echo ======= %errdet% =======
  exit /b
)

set errdet=
for /f "delims=" %%a in ('findstr /B "Errors detected" KINGM6.LST') do set "errdet=%%a"
if "%errdet%"=="Errors detected:  0" (
  rem echo KINGM6.MAC COMPILED SUCCESSFULLY
) ELSE (
  findstr /RC:"^[ABDEILMNOPQRTUZ] " KINGM6.LST
  echo ======= %errdet% =======
  exit /b
)

rem %rt11exe% LINK/STACK:1000 KINGOM,KINGM2,PASCAL /MAP:KINGOM.MAP
%rt11exe% @CLINK

for /f "delims=" %%a in ('findstr /B "Undefined globals" KINGOM.MAP') do set "undefg=%%a"
if "%undefg%"=="" (
REM  type KINGOM.MAP
  echo.
  echo %ESCchar%[92mLINKED SUCCESSFULLY%ESCchar%[0m
) ELSE (
  echo %ESCchar%[91m======= LINK FAILED =======%ESCchar%[0m
  exit /b
)
