@echo off
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
echo �ݨӧA����Q�Ψt�κ޲z����������o�ӵ{��,�Ʊ�A���զۤv�b������
echo Looks like you want to proceed with administrator privileges, hope you know what you are doing.
echo �p�G�ާ@����,�i��|�ɭP�ū̩ξɭP�|���x�s���u�@��
echo If you do something wrong, you may cause BSOD or lose your unsaved work.
echo �Y�zı�o���{�����w��,�а��W���U�����k�W�����j�e�e
echo If you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo ���U���N��H�~��... (10���N�۰ʰ���)
echo Press any botton to procced... (Auto start at 10 seconds.)
timeout /T 10 >nul
cls

:administrator_no
echo      ___   __  __             __  _             ______
echo     /   ^| / /_/ /____  ____  / /_(_)___  ____  / / / /
echo    / /^| ^|/ __/ __/ _ \/ __ \/ __/ / __ \/ __ \/ / / / 
echo   / ___ / /_/ /_/  __/ / / / /_/ / /_/ / / / /_/_/_/  
echo  /_/  ^|_\__/\__/\___/_/ /_/\__/_/\____/_/ /_(_^|_^|_)   
echo.
echo �ݰ_�ӧA�S���t�κ޲z���v��,���L�o�ӵ{���٬O����B�@��
echo Looks like you don't have administrator privileges. But this program can still functional.
echo �p�G�A�J�즳�B�z�{�ǻݭn�޲z���{�Ǥ~��פ�,�Ф�ʵ������{���t�κ޲z���v��
echo If you meet some process that need administrator privileges to terminate, please give this program administrator privileges manually.
echo �Y�S������,�����ާ@���M���i��|�ɭP�|���x�s���u�@��
echo Otherwise, if you do something wrong you may lose your unsaved work.
echo �Y�zı�o���{�����w��,�а��W���U�����k�W�����j�e�e
echo If you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo ���U���N��H�~��... (10���N�۰ʰ���)
echo Press any botton to procced... (Auto start at 10 seconds.)
timeout /T 10 >nul
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
echo �w��ϥΥ��{���I�п�J�ﶵ:
echo 1. �ۦ��J�n�פ�B�z�{��(�{�ǦW��)
echo 2. �ۦ��J�n�פ�B�z�{��(PID)
echo 3. ���}
echo.
echo 0. �@�̸�T
set /p choice=�ﶵ: || set choice=nothingchosen
if "%choice%"=="nothingchosen" goto error_zhtw
if /i "%choice%"=="0" goto 0_zhtw
if /i "%choice%"=="3" goto 3_zhtw
if /i "%choice%"=="2" goto 2_zhtw
if /i "%choice%"=="1" goto 1_zhtw

:1_zhtw
cls
set /p processname=��J�A�Q�n�פ�B�z�{�ǦW��(���]�t������.exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
	echo �B�z�{�������... �]�\�ӳB�z�{�ǭ쥻�N���s�b?
) else (
	echo �B�z�{�Ǥ���\...
)
echo �����N����������...
pause >nul
exit

:2_zhtw
cls
set /p processpid=��J�A�Q�n�פ�B�z�{�Ǫ�PID:
taskkill /pid %processpid% /f >nul 2>&1
if errorlevel 1 (
	echo �B�z�{�������... �]�\�ӳB�z�{�ǭ쥻�N���s�b?
) else (
	echo �B�z�{�Ǥ���\...
)
echo �����N����������...
pause >nul
exit

:3_zhtw
cls
echo �w����...
echo �����N����������...
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
echo                                           :yyyy-       �@��:��@Kuan(sean22922)
echo                                           -syyy:       �p�κ��}:https://home.gamer.com.tw/sean22922
echo                                           .oyyys`      Github:https://github.com/sean22922
echo                                            :syyy+`     Copyright (c) 2018 Sean Kuan. ���{���w�}���A�èϥ�MIT�ۥѶ}���n����v���ڡC
echo                                             :syyso.    (�ګ��i�S�q����T�����ϼ˪��v�D���H�Ҿ֦�)
echo                                              .+syys+-`                    
echo                                                .+ssyss/:.``````.-.        
echo                                                  `.:+ossysso+/-.                       
echo �����N����������...
pause >nul
exit

:error_zhtw
echo �ﶵ���~!�Э��s��J�ﶵ!
timeout /T 3 >nul
cls
goto main_zhtw

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
set /p choice=Option: || set choice=nothingchosen
if "%choice%"=="nothingchosen" goto error_zhtw
if /i "%choice%"=="0" goto 0_zhtw
if /i "%choice%"=="3" goto 3_zhtw
if /i "%choice%"=="2" goto 2_zhtw
if /i "%choice%"=="1" goto 1_zhtw

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
echo                                           :yyyy-       Author:��@Kuan(sean22922)
echo                                           -syyy:       Website:https://home.gamer.com.tw/sean22922
echo                                           .oyyys`      Github:https://github.com/sean22922
echo                                            :syyy+`     Copyright (c) 2018 Sean Kuan. This program is licensed under the MIT License.
echo                                             :syyso.    (The "�ګ��i�S�q����T��" logo's copyright does not belong to me)
echo                                              .+syys+-`                    
echo                                                .+ssyss/:.``````.-.        
echo                                                  `.:+ossysso+/-.                       
echo Press any botton to close this window....
pause >nul
exit

:error_en
echo The option you entered is wrong! Please reenter!
timeout /T 3 >nul
cls
goto main_zhtw