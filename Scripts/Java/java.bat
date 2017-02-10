	@echo off

	runas /noprofile /user:Administrateur java.bat < pass.txt

:: Désactivation du service de Détection de services interactifs
	sc config UI0Detect start= disabled
	sc stop UI0Detect

:: Désinstallation de Java 
	
:: ------------------------------------------------------------------------------
::                                 Java Auto Updater
:: ------------------------------------------------------------------------------
REM Uninstall Java Updater
msiexec /x {4A03706F-666A-4037-7777-5F2748764D10} /q

:: ------------------------------------------------------------------------------
::                                     Java 8
:: ------------------------------------------------------------------------------
REM Uninstall Java 8 Update 121
msiexec /x {26A24AE4-039D-4CA4-87B4-2F32180121F0} /q

REM Uninstall Java 8 Update 111
msiexec /x {26A24AE4-039D-4CA4-87B4-2F32180111F0} /q

REM Uninstall Java 8 Update 101
msiexec /x {26A24AE4-039D-4CA4-87B4-2F32180101F0} /q

REM Uninstall Java 8 Update 91
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218091F0} /q

REM Uninstall Java 8 Update 77
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218077F0} /q

REM Uninstall Java 8 Update 73
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218073F0} /q

REM Uninstall Java 8 Update 51
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218051F0} /q

REM Uninstall Java 8 Update 45
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218045F0} /q

REM Uninstall Java 8 Update 31
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218031F0} /q

REM Uninstall Java 8 Update 25
msiexec /x {26A24AE4-039D-4CA4-87B4-2F83218025F0} /q

:: ------------------------------------------------------------------------------
::                                     Java 7
:: ------------------------------------------------------------------------------

REM Uninstall Java 7 Update 80
msiexec /x {26A24AE4-039D-4CA4-87B4-2F03217080FF} /q

REM Uninstall Java 7 Update 60
msiexec /x {26A24AE4-039D-4CA4-87B4-2F03217060FF} /q

REM JRE Runtime Environment 7.0 Update 45
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217045FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 45 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417045FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 40
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217040FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 40 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417040FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 25
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217025FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 25 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417025FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 21
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217021FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 21 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417021FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 17
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217017FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 17 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417017FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 15
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217015FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 15 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417015FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 13
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217013FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 13 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417013FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 11
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217011FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 11 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417011FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 10
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217010FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 10 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417010FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 9
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217009FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 9 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417009FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 7
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217007FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 7 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417007FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 6 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417006FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 6
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217006FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 5 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417005FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 5
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217005FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 4 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417004FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 4
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217004FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 3 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417003FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 3
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217003FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 2 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417002FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 2
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217002FF} /passive /norestart

REM JRE Runtime Environment 7.0 Update 1 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417001FF} /passive /norestart
REM JRE Runtime Environment 7.0 Update 1
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217001FF} /passive /norestart

REM JRE Runtime Environment 7.0 (x64)
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F86417000FF} /passive /norestart
REM JRE Runtime Environment 7.0
MsiExec.exe /uninstall {26A24AE4-039D-4CA4-87B4-2F83217000FF} /passive /norestart
	
:: Installation de Java
	\\ficserv\allusers\Logiciels\java\jre-8u121-windows-i586.exe INSTALL_SILENT=1 AUTO_UPDATE=0 REBOOT=0
	
:: Réactivation du Service de Détection de services interactifs
	sc config UI0Detect start= demand
	sc stop UI0Detect
goto end
:end