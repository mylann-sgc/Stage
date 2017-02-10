@echo off

	runas /profile /user:Administrateur install.bat < pass.txt
	
	"\\ficserv\allusers\Logiciels\01 - Install Mat\Script\Firefox\install.bat"
	
goto end
:end