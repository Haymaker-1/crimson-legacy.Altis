sleep 180;

HAYMAKER_GLOBALS setVariable ["NEGADES_IS_CLEAR", true];
TASK_CLEAR_NEGADES setTaskState "Succeeded";
["TaskSucceeded", ["","Clear Negades"]] call BIS_fnc_showNotification;

null = ["AREA_MARKER_PERIMETER_KLD_NEGADES","ColorGUER"] execVM "scripts\flip-marker-color.sqf";

