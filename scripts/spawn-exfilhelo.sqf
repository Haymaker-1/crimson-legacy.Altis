

TASK_BOARD_EXFILHELO = player createSimpleTask ["TASKID_BOARD_EXFILHELO"];
TASK_BOARD_EXFILHELO setSimpleTaskDescription ["Go to the <marker name = 'MARKER_LZ_EXFILHELO'>LZ</marker> and board the helicopter to complete the mission.","Board the helicopter","Board the helicopter"];
TASK_BOARD_EXFILHELO setSimpleTaskDestination (getMarkerPos "MARKER_LZ_EXFILHELO");
TASK_BOARD_EXFILHELO setTaskState "Assigned";
["TaskAssigned", ["","Board the helicopter"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_BOARD_EXFILHELO; 

sleep 10;

_heloType = [[["B_Heli_Transport_03_F",0.75],
              ["B_Heli_Transport_03_unarmed_F",0.25]]] call HAYMAKER_fnc_selectWeightedRandom;

_group = createGroup WEST;
              
_spawnPos = getMarkerPos "MARKER_SPAWN_EXFILHELO";
_spawnPos set [2,5000];
exfilhelo = createVehicle [_heloType,_spawnPos,[],0,"FLY"];

"B_Helipilot_F" createUnit [_spawnPos,_group,"exfilheloPilot = this;",0.6,"PRIVATE"];
"B_Helipilot_F" createUnit [_spawnPos,_group,"exfilheloCopilot = this;",0.6,"PRIVATE"];

exfilheloPilot moveInDriver exfilhelo;
exfilheloCopilot moveInTurret [exfilhelo,[0]];

_posFrom = _spawnPos;
_posTo = getMarkerPos "MARKER_LZ_EXFILHELO";
_heloDir = [_posFrom,_posTo] call HAYMAKER_fnc_calcDirection;
exfilhelo setDir _heloDir;

exfilhelo allowDamage false;
{
    _x allowDamage false;
} forEach crew exfilhelo;


waitUntil {
    sleep 5;
    if (!isnil "exfilhelo") exitWith {true};
    false
}; 

{
    deleteWaypoint _x;
} forEach waypoints _group;

_idx = count waypoints _group;
_wp = _group addWaypoint [getMarkerPos "MARKER_LZ_EXFILHELO",0];
[_group, _idx] setWaypointCompletionRadius 50;
[_group, _idx] setWaypointBehaviour "CARELESS";
[_group, _idx] setWaypointStatements ["true", "exfilhelo land 'LAND';"];

waitUntil {
    sleep 1;
    if ((getPos exfilhelo select 2) < 5.0) exitWith {true};
    false
};

exfilhelo animateDoor ["door_rear_source", 1, false];

_cond = true;
while {_cond} do {
    _cond = false;
    {   
        if (!(_x in crew exfilhelo)) then {
            _cond = true;
        };
    } forEach units group player;
    sleep 0.5;
};
exfilhelo lock 2;
exfilhelo animateDoor ["door_rear_source", 0, false];
//disableUserInput true;


_idx = count waypoints _group;
_wp = _group addWaypoint [getMarkerPos "MARKER_SPAWN_EXFILHELO",0];
[_group, _idx] setWaypointCompletionRadius 50;
[_group, _idx] setWaypointBehaviour "CARELESS";

TASK_BOARD_EXFILHELO setTaskState "Succeeded";
["TaskSucceeded", ["","Board the helicopter"]] call BIS_fnc_showNotification;
sleep 10;


waitUntil {
    sleep 5; 
    if ((getPos exfilhelo) distance (getMarkerPos "MARKER_LZ_EXFILHELO") > 500) exitWith {true};
    false
};


null = [] spawn {
    cutText ["Thanks for playing","PLAIN",10,true];

    sleep 20;

    ENDMISSION_REASON_THROWN = true;
    _endName = "Win1";
    _isVictory = true;
    _fadeType = true;

    [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
};

