
POWER_PLANT_CLEARED = true;

waitUntil{
    sleep 5;
    if (POWER_PLANT_SEIZED) exitWith {true};
    false
};

deleteVehicle TRIGGER_POWER_PLANT_CLEARED;
deleteVehicle TRIGGER_POWER_PLANT_SEIZED;


_isReady = [player, "zdgzzloy1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "yazagpmr1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "zdgzzloy2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "yazagpmr2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "yazagpmr3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

if ('DemoCharge_Remote_Mag' in magazines player) then {
    _isReady = [player, "zdgzzloy3"] execVM "scripts\unitspeak.sqf";
    waitUntil{
        sleep 1; 
        if (scriptDone _isReady) exitWith {true};
        false
    };
}
else {
    _isReady = [player, "zdgzzloy4"] execVM "scripts\unitspeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
};


_isReady = [kostas, "yazagpmr4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

null = [] execVM "scripts\spawn-negades-demo-specialist.sqf";

waitUntil {
    sleep 1;
    if (!isnil "demoSpecialistGroup") exitWith {true};
    false
};

POWER_PLANT_CAN_PLACE_EXPLOSIVES = true;


// GUER specialist moves in
_wp = demoSpecialistGroup addWaypoint [getMarkerPos "MARKER_WP_DEMO_SPECIALISTS_DISEMBARK", 1];
[demoSpecialistGroup,1] setWaypointType "MOVE";
[demoSpecialistGroup,1] setWaypointCompletionRadius 50;
[demoSpecialistGroup,1] setWaypointSpeed "LIMITED";
demoSpecialistGroup setBehaviour "CARELESS";
[demoSpecialistGroup,1] setWaypointStatements ["true", "null = [] execVM 'scripts\add-waypoints-demo-specialist.sqf'"];
demoSpecialistGroup setCurrentWaypoint [demoSpecialistGroup, 1];

waitUntil{
    sleep 5;
    if ("DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects transformer) select 0)]) exitWith {true};
    false
};


_isReady = [player, "axdxdlzp1"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "oqlunvdd1"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};


sleep 2;

TASK_SEIZE_POWER_PLANT setTaskState "Succeeded";
["TaskSucceeded", ["","Seize power plant"]] call BIS_fnc_showNotification;

sleep 15;

_grp = createGroup WEST;
{
    if (alive _x) then {
        _x allowDamage false;
        _x enableFatigue false;
        _x setFatigue 0;
        [_x] join _grp;
        sleep 2;
    };
} forEach [sf3,sf2,sf1,sf0];



_grp setCombatMode "GREEN";


_wp = _grp addWaypoint [getMarkerPos "MARKER_SFTEAM_ROUTE_TO_CHRISTOS", 1];
[_grp,1] setWaypointType "MOVE";
[_grp,1] setWaypointCompletionRadius 50;
[_grp,1] setWaypointSpeed "FULL";

_grp setBehaviour "CARELESS";
_grp setCurrentWaypoint [_grp, 1];

_wp = _grp addWaypoint [getMarkerPos "MARKER_CHRISTOS_HOUSE", 2];
[_grp,2] setWaypointType "MOVE";
[_grp,2] setWaypointCompletionRadius 50;
[_grp,2] setWaypointSpeed "FULL";



TASK_DESTROY_VEHICLES_KAVALA = player createSimpleTask ["TASKID_DESTROY_VEHICLES_KAVALA"];
TASK_DESTROY_VEHICLES_KAVALA setSimpleTaskDescription ["Use the cover of darkness to infiltrate Kavala. Stay undetected for as long as possible by going in alone. Rig the vehicles in the <marker name='MARKER_MOTOR_POOL'>motorpool</marker> with explosives. Use your judgement to prioritize targets if there are too many vehicles to destroy them all.","Destroy vehicles","Destroy vehicles"];
TASK_DESTROY_VEHICLES_KAVALA setTaskState "Assigned";
["TaskAssigned", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_DESTROY_VEHICLES_KAVALA; 
TASK_DESTROY_VEHICLES_KAVALA_HAS_BEEN_ASSIGNED = true;

waitUntil {
    sleep 1;
    if (!alive transformer) exitWith {true};
    false
};

null = [1.00] execVM "scripts\lights-out-aggelochori.sqf";

