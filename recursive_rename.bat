@echo off
setlocal enabledelayedexpansion
set /p find="Find: "
set /p replace="Replace: "


for %%f in (*.*) do ( 
	set name=%%~nxf
	set name=!name:%find%=%replace%!
	ren "%%~f" "!name!"
)

for /d %%F in (*.*) do (
	cd %%F
	for %%f in (*.*) do ( 
		set nameSub=%%~nxf
		set nameSub=!nameSub:%find%=%replace%!
		ren "%%~f" "!nameSub!"
	)
	cd ..
	set name=%%~nxF
	set name=!name:%find%=%replace%!
	ren "%%~fF" "!name!"
)
pause