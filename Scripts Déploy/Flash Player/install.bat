@echo off

	runas /noprofile /user:Administrateur install.bat < pass.txt

:: D�sactivation du service de D�tection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: D�sinstallation de Flash Player (tous modules)
	"\\192.168.10.28\allusers\Logiciels\flash player\uninstall_flash_player.exe" -uninstall

:: Installation de Flash Player
	msiexec /i "\\192.168.10.28\allusers\Logiciels\flash player\install_flash_player_24_active_x.msi" /quiet /norestart
	msiexec /i "\\192.168.10.28\allusers\Logiciels\flash player\install_flash_player_24_plugin.msi" /quiet /norestart

:: Fichier de Configuration d'Adobe Flash 
	xcopy "\\192.168.10.28\allusers\Logiciels\flash player\mms.cfg" /Y C:\windows\syswow64\macromed\flash\ 
	
:: R�activation du Service de D�tection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end