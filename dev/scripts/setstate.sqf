hint "setting the debug state";

// null = [] execVM "scripts\setstate.sqf"

skipTime 10.75;

SUITCASES_LOADED = true;
TASK_DELIVER_RADIOS_HAS_BEEN_ASSIGNED = true;

thehelicopter setPos (getMarkerPos "MARKER_STATE_RESUME");
player setPos (getMarkerPos "MARKER_STATE_RESUME");
player assignAsDriver thehelicopter;
player moveInDriver thehelicopter;
thehelicopter engineOn true;
thehelicopter setFuel 1;



thewipeout = createVehicle ["B_Plane_CAS_01_F",(getMarkerPos "MARKER_SPAWN_DOOMED_PLANE"),[],0,"FLY"];
thewipeout setPos [getPos thewipeout select 0,getPos thewipeout select 1,250]; 
thewipeout setDamage 1;
thewipeout setDir 45;
thewipeout setVelocity [(vectorDir thewipeout select 0)*(0 + random 100),(vectorDir thewipeout select 1)*(0 + random 100),(vectorDir thewipeout select 2)*0];


//[thelittebird,30,time,false,false] spawn BIS_Effects_Burn;


"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerType "mil_dot"; 
"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerText "DISTRESS SIGNAL"; 


[sf0,sf1,sf2,sf3] joinSilent (group player);
(group player) selectLeader player;

sf0 moveInCargo [thehelicopter,2];
sf1 moveInCargo [thehelicopter,3];
sf2 moveInCargo [thehelicopter,4];
sf3 moveInCargo [thehelicopter,5];


{_x allowDamage true;} forEach (units (group player));

TASK_FIND_CRASH_SITE = player createSimpleTask ["Find crash site"];
TASK_FIND_CRASH_SITE setSimpleTaskDescription ["The pilot enabled his <marker name='MARKER_PILOT_DISTRESS_SIGNAL'>distress signal</marker>. The captain has given me command of Nabisco's SF team. We need to find the crash site before CSAT forces get there and take our guy captive.","Find crash site","Find crash site"];
TASK_FIND_CRASH_SITE setTaskState "Assigned";
["TaskAssigned", ["Find crash site"]] call BIS_fnc_showNotification;
TASK_FIND_CRASH_SITE_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_FIND_CRASH_SITE;

TRIGGER_WATCH_FOR_SMOKE = createTrigger["EmptyDetector",getPos thehelicopter];
TRIGGER_WATCH_FOR_SMOKE setTriggerArea[150,150,0,false];
TRIGGER_WATCH_FOR_SMOKE triggerAttachVehicle [player];
TRIGGER_WATCH_FOR_SMOKE setTriggerActivation["VEHICLE","NOT PRESENT",false];
TRIGGER_WATCH_FOR_SMOKE setTriggerStatements["this", "sleep (5+random 5); player groupChat 'Everybody, keep your eyes peeled for smoke!';",""]; 

sleep 15;  // allow for crash time

TRIGGER_I_SEE_SMOKE = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_I_SEE_SMOKE setTriggerArea[3000,3000,0,false];
TRIGGER_I_SEE_SMOKE triggerAttachVehicle [player];
TRIGGER_I_SEE_SMOKE setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_I_SEE_SMOKE setTriggerStatements["this AND ((getPos thehelicopter select 2) > 30)","sleep (random 5); player groupChat format ['I see smoke to our %1!',([getPos player, getPos thewipeout] call calcDirectionWindrose)];",""]; 



TRIGGER_CRASH_SITE_FOUND = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_CRASH_SITE_FOUND setTriggerArea[350,350,0,false];
TRIGGER_CRASH_SITE_FOUND triggerAttachVehicle [player];
TRIGGER_CRASH_SITE_FOUND setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CRASH_SITE_FOUND setTriggerStatements["this","null = [] execVM 'scripts\radio-conversation-crash-site-found.sqf'",""]; 


