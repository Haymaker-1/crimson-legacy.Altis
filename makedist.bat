

set BINPBO_PROGRAM_PATH=%programfiles(x86)%\Bohemia Interactive\Tools\BinPBO Personal Edition\
set thisDir=%cd%

rmdir /S /Q %CD%\..\crimson-legacy.Altis

robocopy .\data .\..\crimson-legacy.Altis\data /NP /NDL /NFL /NJH /NJS /E
robocopy .\functions .\..\crimson-legacy.Altis\functions /NP /NDL /NFL /NJH /NJS /E
robocopy .\images\ .\..\crimson-legacy.Altis\images mission-wait-08.paa /NP /NDL /NFL /NJH /NJS /E
robocopy .\scripts .\..\crimson-legacy.Altis\scripts /NP /NDL /NFL /NJH /NJS /E
robocopy .\sounds .\..\crimson-legacy.Altis\sounds /NP /NDL /NFL /NJH /NJS /E
robocopy .\ .\..\crimson-legacy.Altis\ description.ext init.sqf LICENSE mission.sqm  /NP /NDL /NFL /NJH /NJS

"%BINPBO_PROGRAM_PATH%\BinPBO.exe" "%thisDir%\..\crimson-legacy.Altis" "%thisDir%\.." -PACK -DEBUG

