
_s = loadFile "data\helipads-nabisco.sqf";
_s = "NABISCO_HELIPADS = " + _s;

call compile _s;

_pos = nil;
_dir = nil;
_hellcatCanLand = false;
while {!_hellcatCanLand} do {

    _chosen = [NABISCO_HELIPADS] call HAYMAKER_fnc_selectWeightedRandom;

    _pos = _chosen select 0;
    _dir = _chosen select 1;
    _hellcatCanLand = _chosen select 2;
    
};

_marker = createMarker ["MARKER_NABISCO_HELIPAD",_pos];

"chemlight_yellow" createVehicle _pos;
"Land_HelipadSquare_F" createVehicle _pos;

_trg = createTrigger["EmptyDetector",_pos]; 
_trg setTriggerArea[10,10,_dir,true];
_trg triggerAttachVehicle [player];
_trg setTriggerActivation["VEHICLE","PRESENT",false];
_trg setTriggerStatements["this AND TASK_WAIT_AT_NABISCO_HAS_BEEN_ASSIGNED AND (((getPos thehelicopter) distance (getMarkerPos 'MARKER_NABISCO_HELIPAD')) < 10) AND ((getPos thehelicopter select 2) <0.05) ", "TASK_WAIT_AT_NABISCO setTaskState 'Succeeded'; ['TaskSucceeded', ['','Wait at Nabisco']] call BIS_fnc_showNotification;", ""]; 