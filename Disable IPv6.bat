@echo off
goto check_Permissions
:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.        
    ) else (
        echo Failure: Please run this batch file as administrator!
        echo Failure: If you don't know how to, ask the tech support member helping you.
        echo Failure: Error code: UAC0
        timeout 30
        exit
    )

echo The following program will disable IPv6 on your device
echo Please note: This program will restart your PC when complete
echo If you want to exit/abort press CTRL + C or close this window
pause
netsh interface IPV6 set global randomizeidentifier=disabled
echo COMPLETED 1 OF 5
netsh interface IPV6 set privacy state=disable
echo COMPLETED 2 OF 5
netsh interface ipv6 6to4 set state state=disabled
echo COMPLETED 3 OF 5
netsh interface ipv6 isatap set state state=disabled
echo COMPLETED 4 OF 5
netsh interface ipv6 set teredo disable
echo COMPLETED 5 OF 5
timeout 3
echo Press ENTER to restart your PC. Make sure all your work is saved!
pause
shutdown -r
echo Your PC will restart shortly...
timeout 30
exit