

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


_powGroup = createGroup EAST;

{
    _theUnit = _x;
    
    if ((side _theUnit == EAST) AND (alive _theUnit)) then {
        
        _mags = magazines _theUnit;
        _weaps = weapons _theUnit;
        _items = items _theUnit;
        
        {
            _theUnit removeMagazine _x; 
        } forEach _mags;
        
        {
            _theUnit removeWeapon _x; 
        } forEach _weaps;
        
        {
            _theUnit removeItem _x; 
        } forEach _items;
        
        _holder = createVehicle ["GroundWeaponHolder",getPos _theUnit,[],3,"NONE"];
        
        {
            _holder addMagazineCargo [_x,1];
        } forEach _mags;
        
        {
            _holder addWeaponCargo [_x,1];
        } forEach _weaps;
        
        {
            _holder addItemCargo [_x,1];
        } forEach _items;
        
        removeVest _theUnit;
        removeAllAssignedItems _theUnit;
        removeBackpack _x;
        removeHeadgear _x;
        removeGoggles _x;
        
        [_x] joinSilent _powGroup;
    };
} forEach ((getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250]);

{   
    _x setCaptive true;
    _x allowFleeing 0.0; 
    _x setUnitPos "UP";
    
    null = [_x] spawn {
        _unit = _this select 0; 
        waitUntil {
            sleep 5;
            if ((getPos _unit) distance (getMarkerPos "MARKER_MOTOR_POOL") < 20) exitWith {true};
            false
        }; 
        [_unit] joinSilent grpNull;
        _unit playAction "Surrender";
    };
    
} forEach (units _powGroup);

{
    deleteWaypoint [_powGroup, _forEachIndex];
} forEach waypoints _powGroup;


_wp = _powGroup addWaypoint [getMarkerPos "MARKER_MOTOR_POOL",10];
[_powGroup,0] setBehaviour "CARELESS";
[_powGroup,0] setFormation "FILE";
[_powGroup,0] setWaypointSpeed "LIMITED";
_powGroup setCurrentWaypoint [_powGroup, 0];






null = [] execVM "scripts\flip-marker-color-kavala.sqf";


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

