

set BINPBO_PROGRAM_PATH=%programfiles(x86)%\Bohemia Interactive\Tools\BinPBO Personal Edition\
set THE_TMP_DIR=crimson-legacy.Altis
set FLAGS=/NP /NDL /NFL /NJH /NJS /E

robocopy .\data      .\..\%THE_TMP_DIR%\data %FLAGS%
robocopy .\functions .\..\%THE_TMP_DIR%\functions %FLAGS%
robocopy .\images    .\..\%THE_TMP_DIR%\images mission-wait-08.paa %FLAGS%
robocopy .\scripts   .\..\%THE_TMP_DIR%\scripts %FLAGS%
robocopy .\sounds    .\..\%THE_TMP_DIR%\sounds %FLAGS%
robocopy .\          .\..\%THE_TMP_DIR%\ description.ext init.sqf LICENSE mission.sqm  /NP /NDL /NFL /NJH /NJS

"%BINPBO_PROGRAM_PATH%\BinPBO.exe" "%CD%\..\%THE_TMP_DIR%" "%CD%\.." -PACK -DEBUG

rmdir /S /Q ..\%THE_TMP_DIR%
