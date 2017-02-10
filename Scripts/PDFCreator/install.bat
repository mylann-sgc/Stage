@echo off

	runas /noprofile /user:Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: Sauvegarde du Registre
	reg export HKEY_CURRENT_USER\Software\Microsoft C:\Temp\AppBkUp.reg /Y	
	
:: Installation de .Net Framework 4.0
if exist HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\ (
	goto uninstall 
	) else ( 
		"\\ficserv\allusers\Logiciels\dotnet\4.0\dotNetFx40_Client_x86_x64.exe" /q /norestart )

:: Désinstallation de PDF Creator
:uninstall
	"C:\Program Files\PDFCreator\unins000.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART 

:: Installation de PDF Creator
	"\\ficserv\allusers\Logiciels\pdf creator\PDFCreator-2_4_1-setup.exe" /ProxyName=192.168.10.254:8080 /LOADINF="\\ficserv\allusers\Logiciels\pdf creator\PDFCreator.ini" /VERYSILENT /NORESTART /FORCEINSTALL /NOICONS /tasks=\"!desktop_icon\"

:: Restauration du Registre
	reg import C:\Temp\AppBkUp.reg
	timeout 60
	del C:\Temp\AppBkUp.reg
	
:: Réactivation du Service de Détection de services interactifs en restant éteint
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end