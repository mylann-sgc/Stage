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
	"\\192.168.10.28\allusers\Logiciels\firefox\Firefox Setup 45.0.exe" /INI=\\192.168.10.28\allusers\Logiciels\firefox\config.ini /verysilent /SUPPRESSMSGBOXES /NORESTART
	timeout 10
	
:: Remplacement de l'icone DMC
	powershell -executionpolicy Bypass -file "\\192.168.10.28\allusers\Logiciels\01 - Install Mat\Script\Firefox\Firefox32.ps1"
	timeout 5

:: Blocage des MAJ
	xcopy "\\192.168.10.28\allusers\Logiciels\firefox\channel-prefs.js" /Y "C:\Program Files (x86)\Mozilla Firefox\defaults\pref\"
	timeout 5

:: Mozilla par défaut	
	"%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" /SetAsDefaultAppUser

:: Réactivation du Service de Détection de services interactifs en restant éteint
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end	