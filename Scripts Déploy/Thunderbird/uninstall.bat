@echo off

	runas /noprofile /user:Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: Désinstallation de Thunderbird
	"C:\Program Files (x86)\Mozilla Thunderbird\uninstall\helper.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART
	"C:\Program Files (x86)\Mozilla Maintenance Service\Uninstall.exe" /verysilent /SUPPRESSMSGBOXES /NORESTART
	
:: Réactivation du Service de Détection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end