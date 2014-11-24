

_isReady = [kostas, "eyxywhrw1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "fcfnpird1"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "eyxywhrw2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "fcfnpird2"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "eyxywhrw3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "fcfnpird3"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "eyxywhrw4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};





sleep 15;

TASK_CLEAR_AGIOS_KONSTANTINOS = player createSimpleTask ["TASKID_CLEAR_AGIOS_KONSTANTINOS"];
TASK_CLEAR_AGIOS_KONSTANTINOS setSimpleTaskDescription ["Clear the area around <marker name='MARKER_AGIOS_KONSTANTINOS'>Agios Konstantinos</marker> of all enemies.","Clear Agios Konstantinos","Clear Agios Konstantinos"];
//TASK_CLEAR_AGIOS_KONSTANTINOS setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
player setCurrentTask TASK_CLEAR_AGIOS_KONSTANTINOS;
TASK_CLEAR_AGIOS_KONSTANTINOS setTaskState "Assigned";
["TaskAssigned", ["","Clear Agios Konstantinos"]] call BIS_fnc_showNotification;
TASK_CLEAR_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED = true;

sleep 6;

TASK_CLEAR_NEGADES = player createSimpleTask ["TASKID_CLEAR_NEGADES"];
TASK_CLEAR_NEGADES setSimpleTaskDescription ["Clear the area around <marker name='MARKER_NEGADES'>Negades</marker> of all enemies.","Clear Negades","Clear Negades"];
//TASK_CLEAR_NEGADES setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
//player setCurrentTask TASK_CLEAR_NEGADES;
TASK_CLEAR_NEGADES setTaskState "Created";
["TaskCreated", ["","Clear Negades"]] call BIS_fnc_showNotification;
TASK_CLEAR_NEGADES_HAS_BEEN_ASSIGNED = true;


sleep 6;

TASK_SEIZE_SRIFLE = player createSimpleTask ["TASKID_SEIZE_SRIFLE"];
TASK_SEIZE_SRIFLE setSimpleTaskDescription ["We have intel that there is an anti-material rifle near <marker name='MARKER_NEGADES'>Negades</marker>. Seizing it could help turn the tables in our advantage.","Seize rifle","Seize rifle"];
//TASK_SEIZE_SRIFLE setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
//player setCurrentTask TASK_SEIZE_SRIFLE;
TASK_SEIZE_SRIFLE setTaskState "Created";
["TaskCreated", ["","Seize rifle"]] call BIS_fnc_showNotification;
TASK_SEIZE_RIFLE_HAS_BEEN_ASSIGNED = true;


sleep 10;

if (SHOW_CHAPTER_TITLES) then {
    null = ["Street sweepers"] execVM "scripts\show-chapter-title.sqf";
};
sleep 10;
TIME_LAST_SAVEGAME = time;
saveGame;


waitUntil{sleep 5;AGIOS_KONSTANTINOS_IS_CLEAR AND NEGADES_IS_CLEAR};

_spawningComplete = [] execVM "scripts\spawn-blufor-fireteams-agios-konstantinos.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-blufor-fireteams-negades.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

null = [] execVM "scripts\set-up-op-agios-konstantinos.sqf";




