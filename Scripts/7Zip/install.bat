@echo off

	runas /noprofile /user:Administrateur install.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: Désinstallation de 7Zip
	msiexec -x {23170F69-40C1-2702-0920-000001000000} /quiet
	msiexec -x {23170F69-40C1-2702-1512-000001000000} /quiet
	msiexec -x {23170F69-40C1-2701-1514-000001000000} /quiet
	msiexec -x {23170F69-40C1-2702-1514-000001000000} /quiet
	msiexec -x {23170F69-40C1-2701-1602-000001000000} /quiet
	msiexec -x {23170F69-40C1-2702-1602-000001000000} /quiet
	
:: Installation de 7Zip
	msiexec -i "\\192.168.10.28\allusers\Logiciels\7zip\7z1604-x64.msi" /quiet
	
:: Réactivation du Service de Détection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end