@echo off
REM ********************************************************************************
REM **** OCSAgentSetup.exe install by GPO                                       ****
REM **** by Philippe BEAUMONT                                                   ****
REM **** You must use it in a logon computer script in your Active Directory    ****
REM **** Not made to use with OCS Logon : Simply use the OCS setup agent        ****
REM ********************************************************************************

REM **** Please set here the version of the agent you use. 
REM **** Change it to upgrade the agent on all computer.
set VERSION=2.3.0.0

REM **** This is the fully qualified domain name of your OCS Inventory ng server.
set OCSSERVER=http://172.30.0.247

REM **** Network port used by apache 
REM **** If different change it. Ex. 8080
set PORT=80

REM **** You must put here the address of your file server where OCS-NG-Windows-Agent-Setup.exe is.
REM **** For exemple :
REM **** If OCS-NG-Windows-Agent-Setup.exe is on \\filesserver\public\ocs\OCS-NG-Windows-Agent-Setup.exe
REM **** you must put : fileserver\public\ocs
set INSTALLSERVER="192.168.10.28\allusers\Logiciels\OCS Inventory NG\OCSAgent"

IF %PROCESSOR_ARCHITECTURE%==x86 SET INSTALLDIR=%ProgramFiles%
IF %PROCESSOR_ARCHITECTURE%==AMD64 SET INSTALLDIR=%ProgramFiles(x86)%

IF EXIST "%INSTALLDIR%\OCS Inventory agent\OCSInventory.exe" goto upgrade

:install 
\\%INSTALLSERVER%\OCS-NG-Windows-Agent-Setup /S /SERVER=%OCSSERVER%:%PORT%/ocsinventory /SSL=0 /NOSPLASH /DEBUG /NOW
cd "%INSTALLDIR%\OCS Inventory agent\"
taskkill /im "OcsService.exe" /f
timeout 15
xcopy /Y "\\192.168.10.28\allusers\Logiciels\OCS Inventory NG\OCSAgent\ocsinventory.ini" "%PROGRAMDATA%\OCS Inventory NG\Agent\"
timeout 15
echo %VERSION% > %VERSION%.txt
start "" "%INSTALLDIR%\OCS Inventory agent\OcsService.exe"
start "" "%INSTALLDIR%\OCS Inventory agent\OcsSystray.exe"
start "" "%INSTALLDIR%\OCS Inventory agent\OCSInventory.exe" /FORCE
goto end

:upgrade
IF EXIST "%INSTALLDIR%\OCS Inventory agent\%VERSION%.txt" goto end
\\%INSTALLSERVER%\OCS-NG-Windows-Agent-Setup /S /UPGRADE /SERVER=%OCSSERVER%:%PORT%/ocsinventory /SSL=0 /NOSPLASH /DEBUG /NOW
cd "%INSTALLDIR%\OCS Inventory agent\"
taskkill /im "OcsService.exe" /f
timeout 15
xcopy /Y "\\192.168.10.28\allusers\Logiciels\OCS Inventory NG\OCSAgent\ocsinventory.ini" "%PROGRAMDATA%\OCS Inventory NG\Agent\"
timeout 15
echo %VERSION% > %VERSION%.txt
start "" "%INSTALLDIR%\OCS Inventory agent\OcsService.exe"
start "" "%INSTALLDIR%\OCS Inventory agent\OcsSystray.exe"
start "" "%INSTALLDIR%\OCS Inventory agent\OCSInventory.exe" /FORCE

:end