@echo off
setlocal EnableDelayedExpansion
goto check_Permissions

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto administrator_yes
    ) else (
        goto administrator_no
    )

:administrator_yes

echo   _       __                 _             ______
echo  ^| ^|     / /___ __________  (_)___  ____ _/ / / /
echo  ^| ^| /^| / / __ `/ ___/ __ \/ / __ \/ __ `/ / / / 
echo  ^| ^|/ ^|/ / /_/ / /  / / / / / / / / /_/ /_/_/_/  
echo  ^|__/^|__/\__,_/_/  /_/ /_/_/_/ /_/\__, (_^|_^|_)   
echo                                  /____/           
echo.
echo 이 프로그램을 실행하기 위해 시스템 관리자를 사용하려는 것 같습니다. 귀하가 무엇을하고 있는지 이해하기를 바랍니다.
echo Looks like you want to proceed with administrator privileges, hope you know what you are doing.
echo 부적절한 조작으로 인해 파란 화면이 나 저장되지 않은 작업이 손실될 수 있습니다.
echo If you do something wrong, you may cause BSOD or lose your unsaved work.
echo 이 프로그램이 안전하지 않다고 생각되면 창 오른쪽 상단에있는 큰 포크를 즉시 누르십시오.
echo If you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo 계속하려면 아무 키나 누르십시오 (10 초 후에 자동으로 실행됩니다)
echo Press any botton to procced... (Auto start at 10 seconds.)
timeout /T 10 >nul
goto language
cls

:administrator_no
echo      ___   __  __             __  _             ______
echo     /   ^| / /_/ /____  ____  / /_(_)___  ____  / / / /
echo    / /^| ^|/ __/ __/ _ \/ __ \/ __/ / __ \/ __ \/ / / / 
echo   / ___ / /_/ /_/  __/ / / / /_/ / /_/ / / / /_/_/_/  
echo  /_/  ^|_\__/\__/\___/_/ /_/\__/_/\____/_/ /_(_^|_^|_)   
echo.
echo 시스템 관리자 권한이 없는 것 같지만이 프로그램은 여전히 작동합니다.
echo Looks like you don't have administrator privileges. But this program can still functional.
echo 관리자가 종료해야 하는 처리기가 발생하면 수동으로 프로그램 시스템 관리자 권한을 부여하십시오.
echo If you meet some process that need administrator privileges to terminate, please give this program administrator privileges manually.
echo 그렇지 않은 경우 부적절한 작업으로 인해 아직 저장되지 않은 작업이 손실 될 수 있습니다.
echo Otherwise, if you do something wrong you may lose your unsaved work.
echo 이 프로그램이 안전하지 않다고 생각되면 창 오른쪽 상단에있는 큰 포크를 즉시 누르십시오.
echo If you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo 계속하려면 아무 키나 누르십시오 (10 초 후에 자동으로 실행됩니다)
echo Press any botton to procced... (Auto start at 10 seconds.)
timeout /T 10 >nul
goto language
cls

:language
for /F "tokens=3 delims= " %%G in ('reg query "hklm\system\controlset001\control\nls\language" /v Installlanguage') do (
if [%%G] EQU [0404] (
	goto main_zhtw
) else (
	goto main_en
)
)

:main_zhtw
cls
echo  ######                                               #    #                               
echo  #     # #####   ####   ####  ######  ####   ####     #   #  # #      #      ###### #####  
echo  #     # #    # #    # #    # #      #      #         #  #   # #      #      #      #    # 
echo  ######  #    # #    # #      #####   ####   ####     ###    # #      #      #####  #    # 
echo  #       #####  #    # #      #           #      #    #  #   # #      #      #      #####  
echo  #       #   #  #    # #    # #      #    # #    #    #   #  # #      #      #      #   #  
echo  #       #    #  ####   ####  ######  ####   ####     #    # # ###### ###### ###### #    # 
echo.
echo 이 프로그램에 오신 것을 환영합니다! 옵션을 입력하십시오 :
echo 1. 종료할 프로세스를 입력하십시오(프로그램 이름).
echo 2. 직접 종료할 프로세스(PID)를 입력하십시오.
echo 3. 나가기
echo.
echo 0. 작성자 정보
choice /N /C 1230 /M 옵션:
if %ERRORLEVEL% EQU 4 goto 0_zhtw
if %ERRORLEVEL% EQU 3 goto 3_zhtw
if %ERRORLEVEL% EQU 2 goto 2_zhtw
if %ERRORLEVEL% EQU 1 goto 1_zhtw


:1_zhtw
cls
set /p processname=종료할 프로세스의 이름을 입력하십시오(종료 .exe 제외).:
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
	echo 프로세스가 중단되었습니다 ... 프로세스가 존재하지 않았을 수 있습니까?
) else (
	echo 핸들러가 성공적으로 중단되었습니다 ...
)
echo 아무 키나 누르면 창을 닫을 수 있습니다 ...
pause >nul
exit

:2_zhtw
cls
set /p processpid=종료하려는 핸들러의 PID를 입력하십시오.:
taskkill /pid %processpid% /f >nul 2>&1
if errorlevel 1 (
	echo 처리기가 중단되었습니다 ... 처리기가 존재하지 않았을 수 있습니까?
) else (
	echo 처리기가 성공적으로 중단되었습니다....
)
echo 아무 키나 눌러 창을 닫습니다....
pause >nul
exit

:3_zhtw
cls
echo 취소됨...
echo 아무 키나 눌러 창을 닫습니다....
pause >nul
exit

:0_zhtw
cls
echo    `..-:://///++++++++++++///////:::::---...```                           
echo     ``..--:/++osssssssssssssssssssssssssssssssoo++/:-.`                   
echo                `..://+osssssssssssssssssssssssssssssssoo+:-.`             
echo           ```...---::/+osssssssssyyyyyyyyyyyyyyssssssssssssoo/:.`         
echo `.--:://++oossssssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysssssssoo/`      
echo         `````..-::/+oossyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso..-      
echo                      ``.-/+syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso/` `      
echo                            `./syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-``..---.` 
echo                               .oyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-`.-:+ssso//
echo                                /yyyyyyyyyyyyyyyyyyyyyyyyyyyss:  `-/sys+/:.
echo                               .syyysssoooosyyyyyyyyyyyyyyyyss-`-ossyy/`   
echo                             `:oo+/-..`````-oyyyyyyyyyyyyyyyyssosyyyys-..` 
echo                           `.--``           :syyyso+/::::+syyyyyyyyyysooss/
echo                           ``              `+so/-.` ``-:/osyyyyss+/:/-.`--.
echo                       ``   `` ``  `       -/-``  `-/+osyyyyyys/.          
echo                    `..://::/++/++/++:.``  ```./ooossysssyyyyyo.           
echo                    ``````````..-/+ossso+++++osssssoo/:-+yyyso-            
echo                                   ``.-:///////:--.``/:+oo++-`             
echo                                                    :yss/::-..``           
echo                                                 .:/sysssoo+++++/-`        
echo                                               -/ssys+:.`     ``.:/:`      
echo                                             `/syys/.              .:.     
echo                                            `+yyyo.                  ..    
echo                                           `+syys.                    `    
echo                                           -syyy/                          
echo                                           :yyyy-       저자:關@Kuan(sean22922)
echo                                           -syyy:       캐빈 URL:https://home.gamer.com.tw/sean22922
echo                                           .oyyys`      Github:https://github.com/sean22922
echo                                            :syyy+`     Copyright (c) 2018 Sean Kuan. 이 프로그램은 MIT 라이센스 조항을 사용합니다.
echo                                             :syyso.    (巴哈姆特電玩資訊站 의 저작권은 저의 소유가 아닙니다.)
echo                                              .+syys+-`                    
echo                                                .+ssyss/:.``````.-.        
echo                                                  `.:+ossysso+/-.                       
echo.
echo 아무 키나 눌러 창을 닫습니다....
pause >nul
exit

:main_en
cls
echo  ######                                               #    #                               
echo  #     # #####   ####   ####  ######  ####   ####     #   #  # #      #      ###### #####  
echo  #     # #    # #    # #    # #      #      #         #  #   # #      #      #      #    # 
echo  ######  #    # #    # #      #####   ####   ####     ###    # #      #      #####  #    # 
echo  #       #####  #    # #      #           #      #    #  #   # #      #      #      #####  
echo  #       #   #  #    # #    # #      #    # #    #    #   #  # #      #      #      #   #  
echo  #       #    #  ####   ####  ######  ####   ####     #    # # ###### ###### ###### #    # 
echo.
echo Thank you for using this program! Please enter option:
echo 1. Enter the process name you want to terminate.
echo 2. Enter the process PID you want to terminate.
echo 3. Leave
echo.
echo 0. Author Information
choice /N /C 1230 /M Option:
if %ERRORLEVEL% EQU 4 goto 0_en
if %ERRORLEVEL% EQU 3 goto 3_en
if %ERRORLEVEL% EQU 2 goto 2_en
if %ERRORLEVEL% EQU 1 goto 1_en

:1_en
cls
set /p processname=Enter the process name you want to terminate(do not include".exe"):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
	echo Failed to terminate process... 
	echo Maybe the process doesn't even exist?
) else (
	echo Process terminated sucessfully...
)
echo Press any botton to close this window....
pause >nul
exit

:2_en
cls
set /p processname=Enter the process PID you want to terminate:
taskkill /pid %processpid% /f >nul 2>&1
if errorlevel 1 (
	echo Failed to terminate process... 
	echo Maybe the process doesn't even exist?
) else (
	echo Process terminated sucessfully...
)
echo Press any botton to close this window....
pause >nul
exit

:3_en
cls
echo Cancelled...
echo Press any botton to close this window....
pause >nul
exit

:0_en
cls
echo    `..-:://///++++++++++++///////:::::---...```                           
echo     ``..--:/++osssssssssssssssssssssssssssssssoo++/:-.`                   
echo                `..://+osssssssssssssssssssssssssssssssoo+:-.`             
echo           ```...---::/+osssssssssyyyyyyyyyyyyyyssssssssssssoo/:.`         
echo `.--:://++oossssssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysssssssoo/`      
echo         `````..-::/+oossyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso..-      
echo                      ``.-/+syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso/` `      
echo                            `./syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-``..---.` 
echo                               .oyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-`.-:+ssso//
echo                                /yyyyyyyyyyyyyyyyyyyyyyyyyyyss:  `-/sys+/:.
echo                               .syyysssoooosyyyyyyyyyyyyyyyyss-`-ossyy/`   
echo                             `:oo+/-..`````-oyyyyyyyyyyyyyyyyssosyyyys-..` 
echo                           `.--``           :syyyso+/::::+syyyyyyyyyysooss/
echo                           ``              `+so/-.` ``-:/osyyyyss+/:/-.`--.
echo                       ``   `` ``  `       -/-``  `-/+osyyyyyys/.          
echo                    `..://::/++/++/++:.``  ```./ooossysssyyyyyo.           
echo                    ``````````..-/+ossso+++++osssssoo/:-+yyyso-            
echo                                   ``.-:///////:--.``/:+oo++-`             
echo                                                    :yss/::-..``           
echo                                                 .:/sysssoo+++++/-`        
echo                                               -/ssys+:.`     ``.:/:`      
echo                                             `/syys/.              .:.     
echo                                            `+yyyo.                  ..    
echo                                           `+syys.                    `    
echo                                           -syyy/                          
echo                                           :yyyy-       Author:關@Kuan(sean22922)
echo                                           -syyy:       Website:https://home.gamer.com.tw/sean22922
echo                                           .oyyys`      Github:https://github.com/sean22922
echo                                            :syyy+`     Copyright (c) 2018 Sean Kuan. This program is licensed under the MIT License.
echo                                             :syyso.    (The "巴哈姆特電玩資訊站" logo's copyright does not belong to me)
echo                                              .+syys+-`                    
echo                                                .+ssyss/:.``````.-.        
echo                                                  `.:+ossysso+/-.                       
echo.
echo Press any botton to close this window....
pause >nul
exit
