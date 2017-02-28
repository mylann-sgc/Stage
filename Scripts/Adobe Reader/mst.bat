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
	msiexec /i "\\ficserv\allusers\Logiciels\acrobat reader\15.023\AcroRead.msi" TRANSFORMS="\\ficserv\allusers\Logiciels\acrobat reader\15.023\update.mst" /quiet /norestart
	
:: Réactivation du Service de Détection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end