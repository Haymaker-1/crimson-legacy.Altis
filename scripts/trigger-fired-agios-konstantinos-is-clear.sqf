
sleep 180 + random 120;

AGIOS_KONSTANTINOS_IS_CLEAR = true;
TASK_CLEAR_AGIOS_KONSTANTINOS setTaskState "Succeeded";
["TaskSucceeded", ["","Clear Agios Konstantinos"]] call BIS_fnc_showNotification;  

null = [] execVM "scripts\flip-marker-color-agios-konstantinos.sqf";
