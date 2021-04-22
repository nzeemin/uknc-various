@echo off
fc /b KINGOM.SAV KINGOM.GME > KINGOM-diff.lst
echo Number of diferent bytes:
find /v /c "" KINGOM-diff.lst
