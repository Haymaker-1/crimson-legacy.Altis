
//null = [] execVM "scripts\setAsRandomPatrol.sqf"

_perimeter = _this select 0;
_group = _this select 1;
_iGroup = _this select 2;
_str = format ["RANDOM_PATROL_GROUP_HAS_ARRIVED set [%1,true];",_iGroup];


RANDOM_PATROL_GROUP_HAS_ARRIVED set [_iGroup,true];

while {true} do 
{

    if (RANDOM_PATROL_GROUP_HAS_ARRIVED select _iGroup) then
    {
        RANDOM_PATROL_GROUP_HAS_ARRIVED set [_iGroup,false];
        {
            if (_forEachIndex!=0) then 
            {
                deleteWaypoint [_group, _forEachIndex];
            };
        } forEach (waypoints _group);

        _pos = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;

        _wp = _group addWaypoint [_pos,0]; 
        [_group,1] setWaypointCompletionRadius 30;
        [_group,1] setWaypointType "MOVE"; 
        [_group,1] setWaypointSpeed "LIMITED";
        [_group,1] setWaypointBehaviour "SAFE";
        [_group,1] setWaypointCombatMode "RED";
        [_group,1] setWaypointStatements ["true",_str];
    };
    sleep (random 20);
};