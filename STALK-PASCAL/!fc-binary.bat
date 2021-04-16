@echo off
fc /b STALKP.SAV ..\STALK\STALK.GME > STALKP-diff.lst
echo Number of diferent bytes:
find /v /c "" STALKP-diff.lst