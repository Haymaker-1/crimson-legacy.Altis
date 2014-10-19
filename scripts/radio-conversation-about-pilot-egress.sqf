

["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";



player sideChat "Delta Actual, this is Delta One, come in please.";
sleep 6;

THE_CO sideChat "Go ahead, One.";
sleep 3;

player sideChat "Good news, Captain! We managed to liberate the pilot! He's with me now.";
sleep 6;

THE_CO sideChat "Outstanding, One!";
sleep 4;

player sideChat "What do you want me to do with him, sir? Is there some kind of egress plan?";
sleep 8;

THE_CO sideChat "Absolutely! While you got to run around and shoot guns, I've been busy arranging transport.";
sleep 10;

THE_CO sideChat "One of our boats is standing by off of the coast of Agios Konstantinos. Their callsign is Noah Three."; 
sleep 9;

"MARKER_EGRESS_ALPHA" setMarkerType "mil_dot";

THE_CO sideChat "Your task is to escort the pilot to the boat. I've updated your map with the arranged pickup location.";
sleep 9;

THE_CO sideChat "Be careful though! The western coast has a strong CSAT presence.";
sleep 5;

THE_CO sideChat "Delta Actual, out.";
sleep 5;


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





null = [] execVM "scripts\spawn-fireteams-agios-konstantinos.sqf";
sleep 60;
null = [] execVM "scripts\spawn-fireteams-negades.sqf";
sleep 60;
null = [] execVM "scripts\spawn-sniper-negades.sqf";

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







