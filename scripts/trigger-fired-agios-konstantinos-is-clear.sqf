
sleep 180;

AGIOS_KONSTANTINOS_IS_CLEAR = true;
TASK_CLEAR_AGIOS_KONSTANTINOS setTaskState "Succeeded";
["TaskSucceeded", ["","Clear Agios Konstantinos"]] call BIS_fnc_showNotification;  

null = ["AREA_MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS_","ColorGUER"] execVM "scripts\flip-marker-color.sqf";
