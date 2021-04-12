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

REM Patching the STALK1.MAC file replacing KOI-7 chars with KOI-8 ones
set replaces= -replace ^
 ':\t.WORD\t25120\r\n\t.WORD\t23109\r\n\t.WORD\t19488\r\n\t.WORD\t21317\r\n\t.WORD\t20052\r\n\t.WORD\t17225\r\n\t.WORD\t16217', ^
 ':	.BYTE 32,226,197,218,32,204,197,211,212,206,201,195,217,63' -replace ^
 ':\t.WORD\t2378\r\n\t.WORD\t20336\r\n\t.WORD\t23108\r\n\t.WORD\t19781\r\n\t.WORD\t19525\r\n\t.WORD\t17752\r\n\t.WORD\t32', ^
 ':	.BYTE 74,9,240,207,196,218,197,205,197,204,216,197,32,0' -replace ^
 ':\t.WORD\t28192\r\n\t.WORD\t17696\r\n\t.WORD\t19488\r\n\t.WORD\t22560\r\n\t.WORD\t23072\r\n\t.WORD\t20768', ^
 ':	.BYTE 32,238,32,197,32,204,32,216,32,218,32,209' -replace ^
 ':\t.WORD\t8314\r\n\t.WORD\t8279\r\n\t.WORD\t8261\r\n\t.WORD\t8274\r\n\t.WORD\t8280\r\n\t.WORD\t33', ^
 ':	.BYTE 250,32,215,32,197,32,210,32,216,32,33,0' -replace ^
 ':\t.WORD\t16750\r\n\t.WORD\t23584\r\n\t.WORD\t20308\r\n\t.WORD\t8266\r\n\t.WORD\t21595\r\n\t.WORD\t19285\r\n\t.WORD\t8261\r\n\t.WORD\t16730\r\n\t.WORD\t19531\r\n\t.WORD\t21585\r\n\t.WORD\t17737\r\n\t.WORD\t0', ^
 ':	.BYTE 238,193,32,220,212,207,202,32,219,212,213,203,197,32,218,193,203,204,209,212,201,197,0,0'
powershell -Command "(Get-Content STALK1.MAC -Raw) %replaces% | Out-File -encoding ASCII STALK1P.MAC"

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
