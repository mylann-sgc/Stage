@echo off

	runas /noprofile /user:Administrateur install.bat < pass.txt
	
:: D�sactivation du service de D�tection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: D�sinstallation de TightVNC 
	taskkill /im tvnserver.exe /f
	msiexec /x "\\ficserv\allusers\Logiciels\TightVNC\tightvnc-2.8.5-gpl-setup-64bit.msi" /quiet /norestart
		
:: Installation de TightVNC
	msiexec /i "\\ficserv\allusers\Logiciels\TightVNC\tightvnc-2.8.5-gpl-setup-64bit.msi" /quiet /norestart ADDLOCAL=Server	SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=master

:: R�activation du Service de D�tection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end