@echo off

	runas /profile /user:soleil\Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect
	
:: Désinstallation d'Adobe Reader
	msiexec -x {AC76BA86-7AD7-1036-7B44-AC0F074E4100} /quiet

:: Installation de d'Adobe Reader
	"\\ficserv\allusers\Logiciels\acrobat reader\AcroRdrDC1502320053_fr_FR.exe" /sAll /rs /ALLUSERS=1 EULA_ACCEPT=YES SUPPRESS_APP_LAUNCH=YES

:: Réactivation du Service de Détection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end