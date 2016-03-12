

private "_otherGroup";
private "_spawningComplete";
private "_dx";
private "_dy";
private "_isReady";
private "_speaker";
private "_posSuitcase3";
private "_dx2";
private "_dy2";
private "_posRadioFiddle";
private "_wp";
private "_dx3";
private "_dy3";


// spawn pilot and guards

null = [] execVM "scripts\spawn-pilot.sqf";
_otherGroup = createGroup east;
"O_Soldier_TL_F" createUnit [(getMarkerPos "MARKER_SPAWN_PILOT"),_otherGroup,"_pos = getPos this; _pos set [2,2.0]; this setPos _pos; removeHeadgear this; this removeWeapon 'NVGoggles_OPFOR';this removePrimaryWeaponItem 'optic_ACO_grn';",0.5,"CORPORAL"];

_spawningComplete = [] execVM "scripts\spawn-fireteam1.sqf";
waitUntil{
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

if ((random 1.0) < 0.5) then {
    _spawningComplete = [] execVM "scripts\spawn-fireteam2.sqf";
    waitUntil {
        sleep 0.5;
        if (scriptDone _spawningComplete) exitWith {true};
        false
    };
    _spawningComplete = nil;
};

_spawningComplete = [] execVM "scripts\spawn-fireteam3.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;





_dx = ((getPos thehelicopter) select 0) - ((getPos kostas) select 0);
_dy = ((getPos thehelicopter) select 1) - ((getPos kostas) select 1);

kostas disableAI "MOVE";
kostas disableAI "ANIM";
kostas setVectorDir [_dx,_dy,0];

_dx = nil;
_dy = nil;

null = [] spawn {
    kostas playAction "Salute";
    sleep 5;
    kostas playAction "SaluteOff";
};

//kostas action ["salute",kostas];



_isReady = [kostas, "egcnoprm1"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

waitUntil {
    sleep 1;
    if (((getPos player) distance (getPos kostas)) < 4) exitWith {true};
    false
};
kostas enableAI "MOVE";
kostas enableAI "ANIM";


TASK_MEET_KOSTAS setTaskState "Succeeded";
["TaskSucceeded", ["","Meet Kostas"]] call BIS_fnc_showNotification;

// ask about our pilot
_isReady = [player, "mbhglmap1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


// kostas hasnt heard anything because he hasnt had contact for a few days already
_isReady = [kostas, "egcnoprm2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "egcnoprm3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "mbhglmap2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


_isReady = [kostas, "egcnoprm4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "mbhglmap3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

// but we brought radios
_speaker = nil;
{
    _x allowDamage false;
    if (alive _x) exitWith {_speaker = _x};
} forEach [sf0,sf1,sf2,sf3];
_speaker groupChat "Perhaps we could use the new radios we brought?";
sleep (4+random 2);
//OUTLIVED_HIS_USEFULNESS set [0,true];
{
    _x allowDamage true;
} forEach [sf0,sf1,sf2,sf3];


_isReady = [player, "mbhglmap4"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

// unload radios
suitcase1 setPos (thehelicopter modelToWorld [-2,2.3,-1.4]);
suitcase2 setPos (thehelicopter modelToWorld [-2,2.0,-1.4]);
deleteVehicle suitcase3;
_posSuitcase3 = (thehelicopter modelToWorld [-4,4,-1.4]);
suitcase3 = createVehicle ["Land_SatellitePhone_F",_posSuitcase3,[],0,"NONE"];
suitcase3 setPos _posSuitcase3;
_posSuitcase3 = nil;

_dx2 = ((getPos thehelicopter) select 0) - (_posSuitcase3 select 0);
_dy2 = ((getPos thehelicopter) select 1) - (_posSuitcase3 select 1);
suitcase3 setVectorDir [_dx2,_dy2,0];
_dx2 = nil;
_dy2 = nil;

_posRadioFiddle = suitcase3 modelToWorld [0,-1,0];

SUITCASES_LOADED = false;


waitUntil {
    sleep 0.5;
    if (!isnil "_posRadioFiddle") exitWith {true};
    false
};

_wp = (group kostas) addWaypoint [_posRadioFiddle,0];
_wp setWaypointCompletionRadius 0.4;
_wp = nil;


sleep 7;

_dx3 = (_posSuitcase3 select 0) - (_posRadioFiddle select 0);
_dy3 = (_posSuitcase3 select 1) - (_posRadioFiddle select 1);

kostas setPos _posRadioFiddle;
_posRadioFiddle = nil;

kostas disableAI "MOVE";
kostas disableAI "ANIM";
kostas setVectorDir [_dx3,_dy3,0];
kostas playAction "SitDown";
_dx3 = nil;
_dy3 = nil;

// kostas gets on radio
sleep (1+random 2);

_isReady = [kostas, "egcnoprm5"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "egcnoprm6"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

christos globalChat "...Kostas, is that you?";
sleep (3+random 2);

_isReady = [kostas, "egcnoprm7"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

christos globalChat "Great!";
sleep (2+random 2);

_isReady = [kostas, "egcnoprm8"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

christos globalChat "Yeah, I saw the whole thing!";
sleep (2+random 2);

christos globalChat "I was out hunting rabbits, then all of a sudden this plane got shot out of the sky.";
sleep (7+random 2);

christos globalChat "Pilot made it out OK, but he was captured later by a CSAT patrol.";
sleep (5+random 2);

christos globalChat "They took him to where Sofia used to live. You remember her?";
sleep (5+random 2);

_isReady = [kostas, "egcnoprm9"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "egcnoprm10"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

christos globalChat "Bye!";
sleep (2+random 2);

// kostas gets info from a hunter; hunter identifies location where the pilot is kept and number of guards

kostas enableAI "MOVE";
kostas enableAI "ANIM";
deleteVehicle christos;

sleep (2+random 2);

_isReady = [kostas, "egcnoprm11"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "egcnoprm12"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

"MARKER_CAPTURED_PILOT_LOCATION" setMarkerType "mil_dot";
sleep (3+random 2);

_isReady = [kostas, "egcnoprm13"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "mbhglmap5"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


{
    _x lock 0;
} forEach (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD" nearObjects ["B_G_Offroad_01_F", 100]);
{
    _x lock 0;
} forEach (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD" nearObjects ["B_G_Quadbike_01_F", 100]);


TASK_FREE_PILOT = player createSimpleTask ["TASKID_FREE_PILOT"];
TASK_FREE_PILOT setSimpleTaskDescription ["We received information that the pilot is being held at a house just west of Syrta. We should go to the house as quickly as possible to free the pilot before CSAT relocate him to a more secure location.","Free the pilot","Free the pilot"];
player setCurrentTask TASK_FREE_PILOT;
TASK_FREE_PILOT setTaskState "Assigned";
["TaskAssigned", ["","Free the pilot"]] call BIS_fnc_showNotification;
TASK_FREE_PILOT_HAS_BEEN_ASSIGNED = true;

TRIGGER_STATUS_UPDATE = createTrigger["EmptyDetector",getMarkerPos "MARKER_REBEL_CAMP_HELIPAD"];
TRIGGER_STATUS_UPDATE setTriggerArea[150,150,0,false];
TRIGGER_STATUS_UPDATE triggerAttachVehicle [player];
TRIGGER_STATUS_UPDATE setTriggerActivation["VEHICLE","NOT PRESENT",false];
TRIGGER_STATUS_UPDATE setTriggerStatements["this", "null = [] execVM 'scripts\spawn-convoy.sqf';null = [] execVM 'scripts\radio-conversation-status-update.sqf'",""];

// spotter near Gravia airport notifies kostas of an enemy convoy leaving in westerly direction


waitUntil {
    sleep 5;
    if (HAYMAKER_GLOBALS getVariable "CONVOY_HAS_REACHED_LAKKA") exitWith {true};
    false
};

waitUntil {
    sleep 5;
    if (EVERYBODY_IS_DONE_TALKING) exitWith {true};
    false
};
EVERYBODY_IS_DONE_TALKING = false;


_isReady = [kostas, "egcnoprm14"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "mbhglmap6"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "egcnoprm15"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "mbhglmap7"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "egcnoprm16"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "mbhglmap8"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

EVERYBODY_IS_DONE_TALKING = true;


waitUntil {
    sleep 5;
    if (HAYMAKER_GLOBALS getVariable "CONVOY_HAS_REACHED_KORE") exitWith {true};
    false
};



if (CAN_ASSIGN_DESTROY_CONVOY_VEHICLES) then {
    private "_isReady";

    waitUntil {
        sleep 5;
        if (EVERYBODY_IS_DONE_TALKING) exitWith {true};
        false
    };
    EVERYBODY_IS_DONE_TALKING = false;

    _isReady = [kostas, "egcnoprm17"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    _isReady = nil;


    _isReady = [kostas, "egcnoprm18"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    _isReady = nil;

    _isReady = [kostas, "egcnoprm19"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    _isReady = nil;

    _isReady = [player, "mbhglmap9"] execVM "scripts\unitspeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    _isReady = nil;

    EVERYBODY_IS_DONE_TALKING = true;


    TASK_DESTROY_CONVOY_VEHICLES = player createSimpleTask ["TASKID_DESTROY_CONVOY_VEHICLES"];
    TASK_DESTROY_CONVOY_VEHICLES setSimpleTaskDescription ["A convoy of three vehicles is coming to secure the pilot. Mounting a surprise attack and destroying the convoy vehicles would help our cause. Tempting as it is, this objective is only secondary to getting the pilot back safely.","Destroy vehicles","Destroy vehicles"];
    TASK_DESTROY_CONVOY_VEHICLES setTaskState "Created";
    ["TaskCreated", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
    TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED = true;

};
