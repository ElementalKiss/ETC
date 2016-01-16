@echo off

:: 대기하다가 사용자의 키 입력이 있으면 종료
timeout /t 5
:: CTRL+Z를 제외하고 키 입력을 무시하고 원하는 시간만큼 대기
timeout /t 5 /NOBREAK

:: 사용자 키 입력을 무한 대기 pause?
timeout /t -1 

pause