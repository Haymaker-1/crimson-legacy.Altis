
rmdir /S /Q %CD%\..\tmp.Altis

robocopy .\data .\..\tmp.Altis\data /NP /NDL /NFL /NJH /NJS /E
robocopy .\functions .\..\tmp.Altis\functions /NP /NDL /NFL /NJH /NJS /E
robocopy .\images\ .\..\tmp.Altis\images mission-wait-08.paa /NP /NDL /NFL /NJH /NJS /E
robocopy .\scripts .\..\tmp.Altis\scripts /NP /NDL /NFL /NJH /NJS /E
robocopy .\sounds .\..\tmp.Altis\sounds /NP /NDL /NFL /NJH /NJS /E
robocopy .\ .\..\tmp.Altis\ description.ext init.sqf LICENSE mission.sqm  /NP /NDL /NFL /NJH /NJS





