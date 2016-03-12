

private "_aaAlphaValue";
private "_perimeter";
private "_posResume";
private "_posHelo";
private "_dirFaceHelo";
private "_isReady";


_aaAlphaValue = 0.35;

TASK_GO_TO_THE_AIRPORT setTaskState "Succeeded";
["TaskSucceeded", ["","Go to the airport"]] call BIS_fnc_showNotification;
cutText ["","BLACK OUT",5,false];
5 fadeSound 0;
player allowDamage false;
sleep 5;
skipTime (10.0+random 1.0);
player setFatigue 0;


_perimeter = ["MARKER_PERIMETER_SPAWN_AREA_KDX"] call HAYMAKER_fnc_constructPerimeter;
_posResume = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;
player setPos _posResume;
_posHelo = getPos thehelicopter;
_dirFaceHelo = [_posResume,_posHelo] call HAYMAKER_fnc_calcDirection;
player setDir _dirFaceHelo;

sleep 6;

null = [] execVM "scripts\spawn-fuel-truck-and-stavros.sqf";

5 fadeSound 1;
cutText ["Early the following morning...","BLACK IN",8,false];
player allowDamage true;

sleep (10+random 20);


_isReady = [THE_CO, "nqccsmpx1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "rhqqdblf1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "nqccsmpx2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "nqccsmpx3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "nqccsmpx4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

"MARKER_FUEL_TRUCK" setMarkerType "mil_dot";


_isReady = [THE_CO, "nqccsmpx5"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


"MARKER_OPFOR_AA_FRINI" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_FRINI" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_FRINI" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_FRINI_TEXT" setMarkerType "mil_dot";
sleep (random 2);
"MARKER_OPFOR_AA_IFESTONIA" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_IFESTONIA" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_IFESTONIA" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_IFESTONIA_TEXT" setMarkerType "mil_dot";
sleep (random 2);
"MARKER_OPFOR_AA_GALATI" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_GALATI" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_GALATI" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_GALATI_TEXT" setMarkerType "mil_dot";
sleep (random 2);
"MARKER_OPFOR_AA_PYRSOS" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_PYRSOS" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_PYRSOS" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_PYRSOS_TEXT" setMarkerType "mil_dot";
sleep (random 2);
"MARKER_OPFOR_AA_AMFISSA" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_AMFISSA" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_AMFISSA" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_AMFISSA_TEXT" setMarkerType "mil_dot";
sleep (random 2);
"MARKER_OPFOR_AA_MAGOS" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_MAGOS" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_MAGOS" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_MAGOS_TEXT" setMarkerType "mil_dot";
sleep (random 2);

_isReady = [THE_CO, "nqccsmpx6"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";

_isReady = [THE_CO, "nqccsmpx7"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "nqccsmpx8"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


TASK_LOAD_FUEL = player createSimpleTask ["TASKID_LOAD_FUEL"];
TASK_LOAD_FUEL setSimpleTaskDescription ["Refuel the helicopter at Stavros' truck.","Refuel","Refuel"];
TASK_LOAD_FUEL setSimpleTaskDestination (getMarkerPos "MARKER_LOAD_FUEL");
player setCurrentTask TASK_LOAD_FUEL;
TASK_LOAD_FUEL setTaskState "Assigned";
["TaskAssigned", ["","Refuel"]] call BIS_fnc_showNotification;
HAYMAKER_GLOBALS setVariable ["TASK_LOAD_FUEL_HAS_BEEN_ASSIGNED", true];


sleep 10;

if (SHOW_CHAPTER_TITLES) then {
    null = ["Flyboys"] execVM "scripts\show-chapter-title.sqf";
};
sleep 10;
TIME_LAST_SAVEGAME = time;
saveGame;
