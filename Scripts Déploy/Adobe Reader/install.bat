@echo off

	runas /profile /user:soleil\Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect
	
:: Désinstallation d'Adobe Reader
	msiexec -x {AC76BA86-7AD7-1036-7B44-AC0F074E4100} /quiet /norestart
	msiexec -x {AC76BA86-7AD7-1036-7B44-AB0000000001} /quiet /norestart
	msiexec -x {AC76BA86-7AD7-1036-7B44-AA1000000001} /quiet /norestart

:: Installation de d'Adobe Reader
	"\\192.168.10.28\allusers\Logiciels\acrobat reader\AcroRdrDC1502320053_fr_FR.exe" /sAll /rs /ALLUSERS=1 EULA_ACCEPT=YES SUPPRESS_APP_LAUNCH=YES DISABLE_ARM_SERVICE_INSTALL=1
	timeout 10
	del "C:\Users\Public\Desktop\Acrobat Reader DC".lnk /Q
	
:: Réactivation du Service de Détection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end