@echo off

::	runas /noprofile /user:Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect
	
:: Désactivation du Service OCS
	net stop "OCS Inventory Service"
	
:: Suppression des fichiers de logs
	del /Q "C:\ProgramData\OCS Inventory NG\Agent\Download.log"
	del /Q "C:\ProgramData\OCS Inventory NG\Agent\OCSInventory.log"
	
:: Reactivation des services
	net start "OCS Inventory Service"
	sc config UI0Detect start= demand
	sc stop UI0Detect
	
:: Suppression du profil "mdupuy"
	rmdir /S /Q "c:\Users\mdupuy"	
goto end
:end