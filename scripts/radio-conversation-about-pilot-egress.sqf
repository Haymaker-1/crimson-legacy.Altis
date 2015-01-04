

["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";



_isReady = [player, "qlwajhnj1"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "yiuwnpkq1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "qlwajhnj2"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "yiuwnpkq2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "qlwajhnj3"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "yiuwnpkq3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "yiuwnpkq4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

"MARKER_EGRESS_ALPHA" setMarkerType "mil_dot";

_isReady = [THE_CO, "yiuwnpkq5"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "yiuwnpkq6"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "yiuwnpkq7"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};



// add task
// show notification
sleep random 4;


TASK_ESCORT_PILOT = player createSimpleTask ["TASKID_ESCORT_PILOT"];
TASK_ESCORT_PILOT setSimpleTaskDescription ["Escort the pilot to <marker name='MARKER_EGRESS_ALPHA'>the egress point</marker>. Once there, use your radio to call the boat in.","Escort pilot","Escort pilot"];
//TASK_ESCORT_PILOT setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
player setCurrentTask TASK_ESCORT_PILOT;
TASK_ESCORT_PILOT setTaskState "Assigned";
["TaskAssigned", ["","Escort pilot"]] call BIS_fnc_showNotification;
TASK_ESCORT_PILOT_HAS_BEEN_ASSIGNED = true;





_spawningComplete = [] execVM "scripts\spawn-fireteams-agios-konstantinos.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteams-negades.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteams-agios-negades-bases.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

null = [] execVM "scripts\spawn-sniper-negades.sqf";
null = [] execVM "scripts\create-bases.sqf";

// spawn boat off the coast

_perimeter = ["MARKER_PERIMETER_SPAWN_GUNBOAT"] call HAYMAKER_fnc_constructPerimeter;
_pos = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;

THE_GUNBOAT = createVehicle ["B_Boat_Armed_01_minigun_F",_pos,[],0,"CAN_COLLIDE"];
THE_GUNBOAT setDir 90;
THE_GUNBOAT allowDamage false;
THE_GUNBOAT lockCargo [0,true];
THE_GUNBOAT lockCargo [1,true];
THE_GUNBOAT lockCargo [2,true];
THE_GUNBOAT lockCargo [3,true];
THE_GUNBOAT lockCargo [4,true];
THE_GUNBOAT lockCargo [5,true];
THE_GUNBOAT lockCargo [6,true];
THE_GUNBOAT lockCargo [7,true];

THE_GUNBOAT allowDamage false;


gunboatGroup = createGroup west;
gunboatGroup setGroupId ["Noah Three","GroupColor4"];

"B_crew_F" createUnit [_pos,gunboatGroup,"this moveInCommander THE_GUNBOAT; this allowDamage false;"];
"B_crew_F" createUnit [_pos,gunboatGroup,"this moveInGunner THE_GUNBOAT; this allowDamage false;"];
"B_crew_F" createUnit [_pos,gunboatGroup,"this moveInDriver THE_GUNBOAT; this allowDamage false;"];


TRIGGER_ADDACTION_CALL_BOAT = createTrigger["EmptyDetector",getMarkerPos "MARKER_EGRESS_ALPHA"];
TRIGGER_ADDACTION_CALL_BOAT setTriggerArea[1000,1000,0,false];
TRIGGER_ADDACTION_CALL_BOAT triggerAttachVehicle [player];
TRIGGER_ADDACTION_CALL_BOAT setTriggerActivation["VEHICLE","PRESENT",true];
TRIGGER_ADDACTION_CALL_BOAT setTriggerStatements["this AND TASK_ESCORT_PILOT_HAS_BEEN_ASSIGNED","ACTION_RADIO_FOR_BOAT = player addAction ['Call in the boat','scripts\call-in-the-boat.sqf',nil,0,false];","player removeAction ACTION_RADIO_FOR_BOAT;"]; 







