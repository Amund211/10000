::This project is licensed under the terms of the GNU General Public License v3.0.

@echo off
for /f "delims=" %%a in ('cd') do @set dir=%%a
del %dir%\6.txt
del %dir%\5.txt
del %dir%\4.txt
del %dir%\3.txt
del %dir%\2.txt
del %dir%\1.txt
echo. > %dir%\6.txt
echo. > %dir%\5.txt
echo. > %dir%\4.txt
echo. > %dir%\3.txt
echo. > %dir%\2.txt
echo. > %dir%\1.txt
