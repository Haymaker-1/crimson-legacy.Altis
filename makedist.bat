


:: Copy all the relevant files to the build directory

SET BINPBO_PROGRAM_PATH=%programfiles(x86)%\Bohemia Interactive\Tools\BinPBO Personal Edition\
SET THE_TMP_DIR=crimson-legacy.Altis
SET FLAGS=/NP /NDL /NFL /NJH /NJS /E

robocopy .\data      .\..\%THE_TMP_DIR%\data %FLAGS%
robocopy .\functions .\..\%THE_TMP_DIR%\functions %FLAGS%
robocopy .\images    .\..\%THE_TMP_DIR%\images mission-wait-08.paa %FLAGS%
robocopy .\scripts   .\..\%THE_TMP_DIR%\scripts %FLAGS%
robocopy .\sounds    .\..\%THE_TMP_DIR%\sounds %FLAGS%
robocopy .\          .\..\%THE_TMP_DIR%\ description.ext init.sqf LICENSE mission.sqm  /NP /NDL /NFL /NJH /NJS

:: before packing the mission, put the build datetime in /scripts/init-player.sqf
:: use windows powershell to find the string defined by this regular expression...
SET fnrRegExpr={{AUTO_INSERT_BUILD_DATETIME}}
:: ... in this file
SET fnrFile=.\..\%THE_TMP_DIR%\scripts\init-player.sqf
powershell.exe -Command "(Get-Content %fnrFile%) | ForEach-Object { $_ -Replace \"%fnrRegExpr%\", (get-date  -format "{dd-MMM-yyyy HH:mm}") } | Set-Content %fnrFile%"

:: and now, finally, package everything into a binary
"%BINPBO_PROGRAM_PATH%\BinPBO.exe" "%CD%\..\%THE_TMP_DIR%" "%CD%\.." -PACK -DEBUG

:: clean up the temporary directory
rmdir /S /Q ..\%THE_TMP_DIR%

