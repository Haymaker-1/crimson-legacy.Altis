//null = [] execVM "scripts\spawn-convoy.sqf"

_headgearArray = ["H_Beret_blk",
                  "H_Beret_grn",
                  "H_Beret_grn_SF",
                  "H_Shemag_khk",
                  "H_Shemag_tan",
                  "H_ShemagOpen_khk",
                  "H_ShemagOpen_tan",
                  "H_TurbanO_blk",
                  "H_Booniehat_indp",
                  "H_Cap_oli",
                  "H_Cap_blk_Raven",
                  "H_Cap_tan",
                  "H_Booniehat_khk",
                  "H_Booniehat_mcamo",
                  "H_Booniehat_grn",
                  "H_Booniehat_tan",
                  "H_Booniehat_dirty",
                  "H_Booniehat_dgtl"];


convoyIfritGMGGroup = createGroup east;                            
convoyIfritGMG = createVehicle ["O_MRAP_02_gmg_F",(getMarkerPos "MARKER_SPAWN_CONVOY_0"),[],0,"NONE"];
convoyIfritGMG setDir -137.972;
convoyIfritGMGGroup addVehicle convoyIfritGMG;
convoyIfritGMG lock 0;

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_0"),
                            convoyIfritGMGGroup,
                            "this assignAsDriver convoyIfritGMG; this moveInDriver convoyIfritGMG"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_0"),
                            convoyIfritGMGGroup,
                            "this assignAsGunner convoyIfritGMG; this moveInGunner convoyIfritGMG"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_0"),
                            convoyIfritGMGGroup,
                            "this assignAsCargoIndex [convoyIfritGMG,0]; this moveInCargo convoyIfritGMG;"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_0"),
                            convoyIfritGMGGroup,
                            "this assignAsCargoIndex [convoyIfritGMG,1]; this moveInCargo convoyIfritGMG;"];
                            
"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_0"),
                            convoyIfritGMGGroup,
                            "this assignAsCargoIndex [convoyIfritGMG,2]; this moveInCargo convoyIfritGMG;"];
                            

{
    removeHeadGear _x;
    _headgear = _headgearArray call BIS_fnc_selectRandom;
    _x addHeadGear _headgear;
    _x removeWeapon "NVGoggles_OPFOR";
    _x removePrimaryWeaponItem "optic_ACO_grn";
} forEach units convoyIfritGMGGroup;
                            
convoyIfritHMGGroup = createGroup east;
convoyIfritHMG = createVehicle ["O_MRAP_02_hmg_F",(getMarkerPos "MARKER_SPAWN_CONVOY_1"),[],0,"NONE"];
convoyIfritHMG setDir -137.972;
convoyIfritHMGGroup addVehicle convoyIfritHMG;
convoyIfritHMG lock 0;

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_1"),
                            convoyIfritHMGGroup,
                            "this assignAsDriver convoyIfritHMG; this moveInDriver convoyIfritHMG"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_1"),
                            convoyIfritHMGGroup,
                            "this assignAsGunner convoyIfritHMG; this moveInGunner convoyIfritHMG"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_1"),
                            convoyIfritHMGGroup,
                            "this assignAsCargoIndex [convoyIfritHMG,0]; this moveInCargo convoyIfritHMG;"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_1"),
                            convoyIfritHMGGroup,
                            "this assignAsCargoIndex [convoyIfritHMG,1]; this moveInCargo convoyIfritHMG;"];
                            
"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_1"),
                            convoyIfritHMGGroup,
                            "this assignAsCargoIndex [convoyIfritHMG,2]; this moveInCargo convoyIfritHMG;"];
                        
{
    removeHeadGear _x;
    _headgear = _headgearArray call BIS_fnc_selectRandom;
    _x addHeadGear _headgear;
    _x removeWeapon "NVGoggles_OPFOR";
    _x removePrimaryWeaponItem "optic_ACO_grn";
} forEach units convoyIfritHMGGroup;
                            
convoyZamakGroup = createGroup east;

convoyZamak = createVehicle ["O_Truck_02_covered_F",(getMarkerPos "MARKER_SPAWN_CONVOY_2"),[],0,"NONE"];
convoyZamak setDir -137.972;
convoyZamakGroup addVehicle convoyZamak;
convoyZamak lock 0;

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_2"),
                            convoyZamakGroup,
                            "this assignAsDriver convoyZamak; this moveInDriver convoyZamak"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_2"),
                            convoyZamakGroup,
                            "this assignAsCargoIndex [convoyZamak,11]; this moveInCargo convoyZamak;"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_2"),
                            convoyZamakGroup,
                            "this assignAsCargoIndex [convoyZamak,12]; this moveInCargo convoyZamak;"];
                            
"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_SPAWN_CONVOY_2"),
                            convoyZamakGroup,
                            "this assignAsCargoIndex [convoyZamak,14]; this moveInCargo convoyZamak;"];
                            

{
    removeHeadGear _x;
    _headgear = _headgearArray call BIS_fnc_selectRandom;
    _x addHeadGear _headgear;
    _x removeWeapon "NVGoggles_OPFOR";
    _x removePrimaryWeaponItem "optic_ACO_grn";
} forEach units convoyZamakGroup;
                            
_convoyMemberGroups = [convoyIfritGMGGroup, convoyIfritHMGGroup, convoyZamakGroup];


TRIGGER_CONVOY_HAS_REACHED_LAKKA = createTrigger["EmptyDetector",getMarkerPos "MARKER_CONVOY_HAS_REACHED_LAKKA"];
TRIGGER_CONVOY_HAS_REACHED_LAKKA setTriggerArea[300,50,82.2,true];
TRIGGER_CONVOY_HAS_REACHED_LAKKA triggerAttachVehicle [convoyIfritGMG];
TRIGGER_CONVOY_HAS_REACHED_LAKKA setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CONVOY_HAS_REACHED_LAKKA setTriggerStatements["this", "CONVOY_HAS_REACHED_LAKKA=true;",""]; 

TRIGGER_CONVOY_HAS_REACHED_KORE = createTrigger["EmptyDetector",getMarkerPos "MARKER_CONVOY_HAS_REACHED_KORE"];
TRIGGER_CONVOY_HAS_REACHED_KORE setTriggerArea[300,50,82.2,true];
TRIGGER_CONVOY_HAS_REACHED_KORE triggerAttachVehicle [convoyIfritGMG];
TRIGGER_CONVOY_HAS_REACHED_KORE setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CONVOY_HAS_REACHED_KORE setTriggerStatements["this", "CONVOY_HAS_REACHED_KORE=true;",""]; 


CAN_ASSIGN_DESTROY_CONVOY_VEHICLES = true;
null = [] execVM "scripts\monitor-if-convoy-is-alive.sqf";


_iConvoyLeader = 0;

_distArray = [];
_distArray resize (count _convoyMemberGroups);

_waypointArray = [];
_waypointArray resize (count _convoyMemberGroups);

_markerSpawnBasename = "MARKER_SPAWN_CONVOY_";
_markerFormatStr = _markerSpawnBasename + "%1";

_posLast = getMarkerPos format [_markerFormatStr,(count _convoyMemberGroups - 1)];
{
    _posOther = getMarkerPos format [_markerFormatStr,_forEachIndex];
    _dist = _posOther distance _posLast; 
    _distArray set [_forEachIndex,_dist];

} forEach _convoyMemberGroups;


_markerWaypointArray = ["MARKER_CONVOY_WAYPOINT_1",
                        "MARKER_CONVOY_WAYPOINT_2",
                        "MARKER_CONVOY_WAYPOINT_3",
                        "MARKER_CONVOY_WAYPOINT_4"];


_iMarker = 0;
{
    (_convoyMemberGroups select _iConvoyLeader) addWaypoint [(getMarkerPos _x), _iMarker]; 
    [(_convoyMemberGroups select _iConvoyLeader),_iMarker] setWaypointCompletionRadius 30;
    [(_convoyMemberGroups select _iConvoyLeader),_iMarker] setWaypointType "MOVE"; 
    [(_convoyMemberGroups select _iConvoyLeader),_iMarker] setWaypointSpeed "LIMITED";
    [(_convoyMemberGroups select _iConvoyLeader),_iMarker] setWaypointBehaviour "AWARE";
    [(_convoyMemberGroups select _iConvoyLeader),_iMarker] setWaypointCombatMode "RED";
    [(_convoyMemberGroups select _iConvoyLeader),_iMarker] setWaypointFormation "FILE";
    _iMarker = _iMarker + 1;
} forEach _markerWaypointArray; 

_posFinal = getMarkerPos (_markerWaypointArray select ((count _markerWaypointArray) - 1));
_posCurrent = [null,null];

CONVOY_HAS_ARRIVED = false;
_k = 0;
while {!CONVOY_HAS_ARRIVED} do 
{

    _vehicleLeader = assignedVehicle ((units (_convoyMemberGroups select _iConvoyLeader)) select 0);
    _posReference = getPos _vehicleLeader;

    for "_i" from (count _convoyMemberGroups - 1) to 0 step -1 do
    {
        _posCurrent = getPos _vehicleLeader;
        while {(_posCurrent distance _posReference) < (_distArray select _i)} do
        {
            sleep 1;
            _posCurrent = getPos _vehicleLeader;
        };
        _waypointArray set [_i,_posCurrent];
    };
    
    //player globalChat format ["DEBUG (%1): %2",time,(_posCurrent distance _posReference)];

    for "_i" from 1 to (count _convoyMemberGroups - 1) do
    {
    
        {
            deleteWaypoint [(_convoyMemberGroups select _i),_indexForEach];
        } forEach waypoints (_convoyMemberGroups select _i);
    
        (_convoyMemberGroups select _i) addWaypoint [_waypointArray select _i, 0]; 
        [(_convoyMemberGroups select _i),0] setWaypointCompletionRadius 5;
        [(_convoyMemberGroups select _i),0] setWaypointType "MOVE"; 
        [(_convoyMemberGroups select _i),0] setWaypointSpeed "NORMAL";
        [(_convoyMemberGroups select _i),0] setWaypointBehaviour "AWARE";
        [(_convoyMemberGroups select _i),0] setWaypointCombatMode "RED";
        [(_convoyMemberGroups select _i),0] setWaypointFormation "FILE";    
        
    };
    

    if ((_posCurrent distance _posFinal) < 100) then 
    {
        CONVOY_HAS_ARRIVED = true;
    };
    
    
    _k = _k + 1;
    _fuelLevel = fuel _vehicleLeader;
    _vehicleLeader setFuel 0;
    sleep 7;
    _vehicleLeader setFuel _fuelLevel;
};

{
    deleteWaypoint [(_convoyMemberGroups select _i),_indexForEach];
} forEach waypoints (_convoyMemberGroups select _i);

for "_i" from 0 to ((count _convoyMemberGroups) - 1) do

    (_convoyMemberGroups select _i) addWaypoint [_posFinal, 0]; 
    [(_convoyMemberGroups select _i),0] setWaypointCompletionRadius 25;
    [(_convoyMemberGroups select _i),0] setWaypointType "UNLOAD"; 
    [(_convoyMemberGroups select _i),0] setWaypointSpeed "NORMAL";
    [(_convoyMemberGroups select _i),0] setWaypointBehaviour "AWARE";
    [(_convoyMemberGroups select _i),0] setWaypointCombatMode "RED";
    [(_convoyMemberGroups select _i),0] setWaypointFormation "FILE";    
};





