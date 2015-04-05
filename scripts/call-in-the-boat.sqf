

player removeAction ACTION_RADIO_FOR_BOAT;
deleteVehicle TRIGGER_ADDACTION_CALL_BOAT;

sleep random 3;

_isReady = [player, "qzwpvxsn1"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

(leader gunBoatGroup) sideChat "This is Noah Three. I read you loud and clear.";
sleep 5;

_pos1 = getPos player;
_pos2 = getMarkerPos "MARKER_EGRESS_ALPHA";
_dist = _pos1 distance _pos2;
if (_dist > 100) then
{
    _isReady = [player, "qzwpvxsn2"] execVM "scripts\unitspeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
}
else
{
    _isReady = [player, "qzwpvxsn3"] execVM "scripts\unitspeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
};
sleep 5;

(leader gunBoatGroup) sideChat "Stand by. We are coming in now. Noah out.";
sleep 6;

_group = gunboatGroup;
_pos = getMarkerPos "MARKER_EGRESS_ALPHA_BOAT";

_wp = _group addWaypoint [_pos,1]; 
[_group,1] setWaypointCompletionRadius 100;
[_group,1] setWaypointType "MOVE"; 
[_group,1] setWaypointSpeed "NORMAL";
[_group,1] setWaypointBehaviour "SAFE";
[_group,1] setWaypointCombatMode "RED";
[_group,1] setWaypointStatements ["true","THE_GUNBOAT lockCargo [floor(random 7),false]; if (((getPos player) distance (getPos THE_GUNBOAT)) > 200) then {leader gunboatGroup sideChat 'We are in position at egress Alpha.';};"];



waitUntil {
    if (pilot in crew THE_GUNBOAT) exitWith {pilot disableAI "ANIM"; true};
    false
};

pilot disableAI "MOVE";
pilot allowDamage false;

null = [] execVM "scripts\translate-and-rotate-gunboat.sqf";

PILOT_EGRESS_WAS_SUCCESSFUL = true;

[pilot] joinSilent grpNull;

_perimeter = ["MARKER_PERIMETER_SPAWN_GUNBOAT"] call HAYMAKER_fnc_constructPerimeter;
_pos = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;

_wp = gunboatGroup addWaypoint [_pos,2];
[gunboatGroup,2] setWaypointStatements ["true", "{deleteVehicle _x} forEach units gunboatGroup; deleteVehicle THE_GUNBOAT;"];
[gunboatGroup,2] setWaypointCompletionRadius 100;


sleep random 10;

_isReady = [player, "qzwpvxsn4"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [THE_CO, "xwzldnaj1"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "qzwpvxsn5"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [THE_CO, "xwzldnaj2"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [THE_CO, "xwzldnaj3"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

if (random 1 < 0.5) then
{   
    _isReady = [player, "qzwpvxsn6"] execVM "scripts\unitspeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
}
else
{
    _isReady = [player, "qzwpvxsn7"] execVM "scripts\unitspeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
};

_isReady = [THE_CO, "xwzldnaj4"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "qzwpvxsn8"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};


_isReady = [THE_CO, "xwzldnaj5"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "qzwpvxsn9"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [THE_CO, "xwzldnaj6"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

sleep random 4;

TASK_ESCORT_PILOT setTaskState "Succeeded";
["TaskSucceeded", ["","Escort pilot"]] call BIS_fnc_showNotification;



sleep (10+random 30);

null = [] execVM "scripts\negades-retrieve-longrange-asset.sqf";




