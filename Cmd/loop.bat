@echo off

set count=0
:_loop
@echo %count% "statement"
if %count% equ 4 goto _break
set /a count+=1
goto _loop
:_break


for /L %%i in (0,1,4) do (@echo %%i "statement")

pause