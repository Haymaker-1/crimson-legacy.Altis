

_nEast = 1e10;
_nEastThres = 45;



_men = nil;

while {_nEast > _nEastThres} do {

    _men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
    _nEast = east countSide _men;
    sleep 60;
};

TASK_ASSAULT_KAVALA setTaskState "Succeeded";

TASK_CLEAR_STRAGGLERS_KAVALA = player createSimpleTask ["TASKID_CLEAR_STRAGGLERS_KAVALA"];
TASK_CLEAR_STRAGGLERS_KAVALA setSimpleTaskDescription ["We are gaining the upper hand in this battle, but there are a few remaining pockets of resistance. Locate and eliminate them.","Clear stragglers","Clear stragglers"];
TASK_CLEAR_STRAGGLERS_KAVALA setTaskState "Assigned";
["TaskAssigned", ["","Clear stragglers"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_CLEAR_STRAGGLERS_KAVALA; 
TASK_CLEAR_STRAGGLERS_KAVALA_HAS_BEEN_ASSIGNED = true;


null = [] execVM "scripts\kavala-opfor-groups-fall-back.sqf";


while {_nEast > (_nEastThres - 10)} do {

    _men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
    _nEast = east countSide _men;
    sleep 60;
};

sleep 10;

//_noVehiclesLeftInKavala = false;
//_enemyVehicleTypes = ["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_MRAP_02_F"];
//
//while {!_noVehiclesLeftInKavala} do {
//    _noVehiclesLeftInKavala = true;
//    {
//        _veh = _x;
//        if ((side _veh == EAST) AND (alive _veh) AND (typeOf _veh in _enemyVehicleTypes)) then {
//            _noVehiclesLeftInKavala = false;
//        };
//    } forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearEntities [["Car","Tank"],1250]);
//    sleep 10;
//};

{
    _veh = _x;
    {
        _unit = _x;
        _unit leaveVehicle _veh;
    } forEach crew _veh;
} forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearEntities [["Car","Tank"],1250]);

{
    _veh = (assignedVehicle _x);
    _unit = _x;
    _unit leaveVehicle _veh;
} forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["O_HMG_01_high_F",1250]);

{
    _x setDamage 1;
} forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearObjects ["O_HMG_01_high_F",1250]);

{
    _veh = (assignedVehicle _x);
    _unit = _x;
    _unit leaveVehicle _veh;
} forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["O_Mortar_01_F",1250]);

{
    _x setDamage 1;
} forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearObjects ["O_Mortar_01_F",1250]);

{
    if (["MARKER_STATIC_DEFENSE_",_x,count toArray "MARKER_STATIC_DEFENSE_"] call HAYMAKER_fnc_strcmpn) then {
        deleteMarker _x;
    };
} forEach allMapMarkers;

{
    _x allowDamage false;
} forEach (units group player);

_menNearMotorPool = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
_everybodySurrendered = false;

_iUnitCaptured = 0;

{
    _theUnit = _x;
    
    if (((side _theUnit) == EAST) AND (alive _theUnit)) then {
        
        null = [_theUnit] execVM "scripts\opfor-unit-dump-gear.sqf";
        
        _grp = createGroup EAST;
        [_x] joinSilent _grp;
        
        _x setCaptive true;
        _x allowFleeing 0.0; 
        _x setUnitPos "UP";
        
        {
            deleteWaypoint [_grp, _forEachIndex];
        } forEach (waypoints _grp);
        
        _pos = getMarkerPos "MARKER_MOTOR_POOL";
        _x = (_pos select 0) + (_iUnitCaptured%5 - 2) * 4;
        _y = (_pos select 1) + ((floor(_iUnitCaptured/5) - 2) * 4);
        _pos set [0,_x];
        _pos set [1,_y];
        
        _wp = _grp addWaypoint [_pos,0,0];
        _grp setBehaviour "CARELESS";
        _grp setFormation "FILE";
        [_grp,0] setWaypointSpeed "LIMITED";
        [_grp,0] setWaypointCompletionRadius 4;
        [_grp,0] setWaypointStatements ["true", "{[_x] joinSilent grpNull;_x playAction 'Surrender';} forEach thisList"];
        _grp setCurrentWaypoint [_grp,0];

        _iUnitCaptured = _iUnitCaptured + 1;

    };
    
    
    if (_forEachIndex == ((count _menNearMotorPool) - 1)) then {
        _everybodySurrendered = true;
        
        player globalChat format ["%1 units surrendered",_iUnitCaptured];
        
    };
    
} forEach _menNearMotorPool;

waitUntil {
    sleep 2.0;
    if (_everybodySurrendered) exitWith {true};
    false
};

null = ["AREA_MARKER_PERIMETER_FKS_KAVALA_","ColorGUER"] execVM "scripts\flip-marker-color.sqf";
null = ["AREA_MARKER_PERIMETER_SHJ_","ColorGUER"] execVM "scripts\flip-marker-color.sqf";
null = ["AREA_MARKER_PERIMETER_AIRBASE_","ColorGUER"] execVM "scripts\flip-marker-color.sqf";



deleteMarker "MARKER_ALPHA_SECTOR_KAVALA";
deleteMarker "MARKER_ALPHA_SECTOR_KAVALA_TEXT";
deleteMarker "MARKER_BRAVO_SECTOR_KAVALA";
deleteMarker "MARKER_BRAVO_SECTOR_KAVALA_TEXT";
deleteMarker "MARKER_CHARLIE_SECTOR_KAVALA";
deleteMarker "MARKER_CHARLIE_SECTOR_KAVALA_TEXT";
deleteMarker "MARKER_DELTA_SECTOR_KAVALA";
deleteMarker "MARKER_DELTA_SECTOR_KAVALA_TEXT";


_isReady = [kostas, "nvurkijn1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

sleep 10;

TASK_CLEAR_STRAGGLERS_KAVALA setTaskState "Succeeded";

["TaskSucceeded", ["","Clear stragglers"]] call BIS_fnc_showNotification;

sleep 10;


null = [] execVM "scripts\spawn-exfilhelo.sqf";

