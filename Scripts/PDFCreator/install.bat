@echo off

runas /noprofile /user:administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: Sauvegarde du Registre
	reg export HKEY_CURRENT_USER\Software\Microsoft %USERPROFILE%\AppBkUp.reg /Y	
	
:: Installation de .Net Framework 4.0
	"\\192.168.10.28\allusers\Logiciels\dotnet\4.0\dotNetFx40_Client_x86_x64.exe" /q /norestart

:: Désinstallation de PDF Creator
	"C:\Program Files\PDFCreator\unins000.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART 

:: Installation de PDF Creator
	"\\192.168.10.28\allusers\Logiciels\pdf creator\PDFCreator-2_4_1-setup.exe" /ProxyName=192.168.10.254:8080 /LOADINF="\\192.168.10.28\allusers\Logiciels\pdf creator\PDFCreator.ini" /VERYSILENT /NORESTART /FORCEINSTALL /NOICONS /tasks=\"!desktop_icon\"

:: Suppression des Imprimantes Windows
	rundll32 printui.dll,PrintUIEntry /dl /q /n "Microsoft XPS Document Writer"
	rundll32 printui.dll,PrintUIEntry /dl /q /n "Fax"

:: Import du registre
	reg import %USERPROFILE%\AppBkUp.reg
	timeout 5
	del %USERPROFILE%\AppBkUp.reg /Y
	
:: Réactivation du Service de Détection de services interactifs en restant éteint
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end