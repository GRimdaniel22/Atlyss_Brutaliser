@echo off
setlocal DisableDelayedExpansion

FOR %%I IN ("%~dp0.") DO set "SCRIPT_DIR_NAME=%%~nxI"

if /I not "%SCRIPT_DIR_NAME%"=="BepInEx" (
	echo Error: This script must be placed directly inside the BepInEx folder.
	pause
	exit /B 1
)
cd /d %~dp0\plugins 
	if %errorlevel% neq 0 (
		echo Error: Script could not locate plugins folder.
		pause
		exit /B 1
	) else (
		echo Plugins found
		del /F /S /Q mm_v2_manifest.json, README.md, CHANGELOG.md, "! NippleOverlays.zip", "LOREMASTER-Aionios_Pack-1.2.1.zip", "LOREMASTER-Aionios_Pack-1.3.0.zip", "LICENSE-ASSETS.txt", "LICENSE"
		FOR /d /r . %%d IN (*) DO (
			IF /I "%%~nxd"=="CustomQuests-Files" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Audio" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Misc" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="random images" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="ArmorRender" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Mesh" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Hair" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Skin" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Eyes" rd /S /Q "%%~fd"
			IF /I "%%~nxd"=="Mouth" rd /S /Q "%%~fd"
		)
		del /S /Q *.png, *.lua, *.propbundle, *.kra, *.png~
		pause
		exit /B
	)
