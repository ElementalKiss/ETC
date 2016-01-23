@echo off

:_MENU
@echo 1 : Execution1
@echo 2 : Execution2
@echo 0 : END

choice /c:1234567890

IF %ERRORLEVEL% == 1 goto _EXECUTION1
IF %ERRORLEVEL% == 2 goto _EXECUTION2
IF %ERRORLEVEL% == 0 goto _END
exit

# message input
:_EXECUTION1
set /p INPUT=Input your message:
@echo youre message is %INPUT%.

goto _MENU

:_EXECUTION2
# execute another program(notepad.exe)
start notepad.exe newText.txt

goto _MENU

:END
exit