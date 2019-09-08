@echo off

REM Hehe

php enlua.php
pause
exit

java -jar unluac.jar main_encode.lua > main.lua

REM C:\Program Files (x86)\Lua\5.1
luac -o "form_main_chat.lua" "form_main_chat.luac"
pause