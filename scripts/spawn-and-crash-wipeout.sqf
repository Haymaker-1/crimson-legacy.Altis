

private "_isReady";
private "_trg";
private "_iRandomPatrol";



sleep (5+random 5);

null = [] execVM "scripts\spawn-fireteam-crash-site.sqf";

thewipeout = createVehicle ["B_Plane_CAS_01_F",(getMarkerPos "MARKER_SPAWN_DOOMED_PLANE"),[],0,"FLY"];
thewipeout setPos [getPos thewipeout select 0,getPos thewipeout select 1,250];
thewipeout setDamage 1;
thewipeout setDir 45;
thewipeout setVelocity [(vectorDir thewipeout select 0)*(0 + random 100),(vectorDir thewipeout select 1)*(0 + random 100),(vectorDir thewipeout select 2)*0];

null = [] spawn {
    private "_doWait";
    _doWait = true;
    while {_doWait} do {
        private "_altWipeout";
        _altWipeout = (getPos thewipeout) select 2;
        _doWait = _altWipeout > 2.0;
        if (!_doWait) then {
            private "_craterWipeout";
            sleep 10;
            _craterWipeout = createVehicle ["CraterLong",getPos thewipeout,[],0,"CAN_COLLIDE"];
            _craterWipeout setDir (getDir thewipeout);
        };
        sleep 5;
    };
};


_isReady = [THE_CO, "drxopaef1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

sleep (8);

_isReady = [THE_CO, "drxopaef4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "embbzaox1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef5"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "embbzaox2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef6"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef7"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "embbzaox3"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef8"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

player removeSimpleTask TASK_DELIVER_RADIOS;


_dir = markerDir "MARKER_NABISCO_HELIPAD";
_trg = createTrigger["EmptyDetector", getMarkerPos "MARKER_NABISCO_HELIPAD"];
_trg setTriggerArea[10, 10, _dir, true];
_trg triggerAttachVehicle [player];
_trg setTriggerActivation["VEHICLE","PRESENT",false];
_trg setTriggerStatements["this AND TASK_WAIT_AT_NABISCO_HAS_BEEN_ASSIGNED AND (((getPos thehelicopter) distance (getMarkerPos 'MARKER_NABISCO_HELIPAD')) < 10) AND ((getPos thehelicopter select 2) <0.05) ", "TASK_WAIT_AT_NABISCO setTaskState 'Succeeded'; ['TaskSucceeded', ['','Wait at Nabisco']] call BIS_fnc_showNotification;", ""];
_trg = nil;

TASK_WAIT_AT_NABISCO = player createSimpleTask ["TASKID_WAIT_AT_NABISCO"];
TASK_WAIT_AT_NABISCO setSimpleTaskDestination (getMarkerPos "MARKER_NABISCO_HELIPAD");
TASK_WAIT_AT_NABISCO setSimpleTaskDescription ["We just got news that one of our planes went down. The CO ordered me to stand by at Nabisco until they have more information about the pilot's whereabouts.","Wait at Nabisco","Wait at Nabisco"];
TASK_WAIT_AT_NABISCO setTaskState "Assigned";
["TaskAssigned", ["","Wait at Nabisco"]] call BIS_fnc_showNotification;
TASK_WAIT_AT_NABISCO_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_WAIT_AT_NABISCO;



waitUntil {
    sleep 1;
    if ((taskState TASK_WAIT_AT_NABISCO) == "Succeeded") exitWith {true};
    false
};


sleep (20+random 10);

_isReady = [THE_CO, "drxopaef9"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "embbzaox4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerType "mil_dot";
"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerText "DISTRESS SIGNAL";

_isReady = [THE_CO, "drxopaef10"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "embbzaox5"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef11"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "drxopaef12"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_iRandomPatrol = [sf0] call HAYMAKER_fnc_findRandomPatrolmansGroup;
STOP_RANDOM_PATROL_GROUP set [_iRandomPatrol,true];


[sf0,sf1,sf2,sf3] joinSilent (group player);
(group player) selectLeader player;

null = [] spawn {
    waitUntil{
        sleep 5;
        if (sf0 in crew thehelicopter) exitWith {true};
        false
    };
    sf0 allowDamage true;
};
null = [] spawn {
    waitUntil{
        sleep 5;
        if (sf1 in crew thehelicopter) exitWith {true};
        false
    };
    sf1 allowDamage true;
};
null = [] spawn {
    waitUntil{
        sleep 5;
        if (sf2 in crew thehelicopter) exitWith {true};
        false
    };
    sf2 allowDamage true;
};
null = [] spawn {
    waitUntil{
        sleep 5;
        if (sf3 in crew thehelicopter) exitWith {true};
        false
    };
    sf3 allowDamage true;
};

TASK_FIND_CRASH_SITE = player createSimpleTask ["Find crash site"];
TASK_FIND_CRASH_SITE setSimpleTaskDescription ["The pilot enabled his <marker name='MARKER_PILOT_DISTRESS_SIGNAL'>distress signal</marker>. The captain has given me command of Nabisco's SF team. We need to find the crash site before CSAT forces get there and take our guy captive.","Find crash site","Find crash site"];
TASK_FIND_CRASH_SITE setTaskState "Assigned";
["TaskAssigned", ["","Find crash site"]] call BIS_fnc_showNotification;
TASK_FIND_CRASH_SITE_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_FIND_CRASH_SITE;

TRIGGER_I_SEE_SMOKE = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_I_SEE_SMOKE setTriggerArea[2000,2000,0,false];
TRIGGER_I_SEE_SMOKE triggerAttachVehicle [player];
TRIGGER_I_SEE_SMOKE setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_I_SEE_SMOKE setTriggerStatements["this AND ((getPos thehelicopter select 2) > 30)","sleep (random 5); player groupChat format ['I see smoke to our %1!',([getPos player, getPos thewipeout] call HAYMAKER_fnc_calcDirectionWindrose)];",""];

TRIGGER_CRASH_SITE_FOUND = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_CRASH_SITE_FOUND setTriggerArea[250,250,0,false];
TRIGGER_CRASH_SITE_FOUND triggerAttachVehicle [player];
TRIGGER_CRASH_SITE_FOUND setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CRASH_SITE_FOUND setTriggerStatements["this","null = [] execVM 'scripts\radio-conversation-crash-site-found.sqf'",""];


sleep 15;

if (HAYMAKER_GLOBALS getVariable "SHOW_CHAPTER_TITLES") then {
    null = ["M.I.A"] execVM "scripts\show-chapter-title.sqf";
};
sleep 10;
TIME_LAST_SAVEGAME = time;
saveGame;


waitUntil {
    sleep 10;
    if ((getPos thehelicopter) distance (getMarkerPos "MARKER_NABISCO_HELIPAD") > 800) exitWith {true};
    false
};

if (!triggerActivated TRIGGER_I_SEE_SMOKE AND count crew thehelicopter >= 3) then {
    player groupChat "Everybody, keep your eyes peeled for smoke!";
};
