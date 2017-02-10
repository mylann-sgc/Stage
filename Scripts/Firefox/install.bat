@echo off

	runas /profile /user:Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: Désinstallation de Mozilla Firefox et du Service de Maintenance
	"C:\Program Files (x86)\Mozilla Maintenance Service\Uninstall.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART
	"C:\Program Files (x86)\Mozilla Firefox\uninstall\helper.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART
	"C:\Program Files\Mozilla Firefox\uninstall\helper.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART	

:: Installation de Mozilla Firefox
	"\\ficserv\allusers\Logiciels\firefox\Firefox Setup 51.0.1.exe" /INI=\\ficserv\allusers\Logiciels\firefox\config.ini /verysilent /SUPPRESSMSGBOXES /NORESTART
	timeout 10
	
:: Remplacement de l'icone DMC
	powershell -executionpolicy Bypass -file "\\192.168.10.28\allusers\Logiciels\01 - Install Mat\Script\Firefox\Firefox.ps1"	

:: Mozilla par défaut	
	"%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" /SetAsDefaultAppUser

:: Réactivation du Service de Détection de services interactifs en restant éteint
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end