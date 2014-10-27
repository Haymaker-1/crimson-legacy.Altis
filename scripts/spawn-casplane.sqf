

_pos = getMarkerPos "MARKER_CASPLANE_SPAWN";

casplane = createVehicle ["B_Plane_CAS_01_F", _pos,[],0,"FLY"];

_casPlaneGroup = createGroup WEST;

_unit = _casPlaneGroup createUnit ["B_Pilot_F", getPos casplane, [], 0, "NONE"];

_unit moveInDriver casplane;


{
    if !(_x in ["1000Rnd_Gatling_30mm_Plane_CAS_01_F","120Rnd_CMFlare_Chaff_Magazine"]) then {
        casplane removeMagazines _x;
    };
} forEach (magazines casplane);



ADD_CASPLANE_HOLDING_WP = true;
ADD_CASPLANE_ATTCKING_WP = false;

_marker = createMarker ["A",[0,0,0]];
_marker = createMarker ["B",[0,0,0]];

"A" setMarkerType "mil_dot";
"A" setMarkerColor "ColorGreen";
"A" setMarkerText "A";

"B" setMarkerType "mil_dot";
"B" setMarkerColor "ColorRed";
"B" setMarkerText "B";

while {alive casplane} do {


    if (ADD_CASPLANE_HOLDING_WP) then {
    
        ADD_CASPLANE_HOLDING_WP = false;
        
        {
            deleteWaypoint [_casPlaneGroup,_forEachIndex];
        } forEach (waypoints _casPlaneGroup);

        
        _wp1 = _casPlaneGroup addWayPoint [getMarkerPos "MARKER_CASPLANE_HOLDING_1",300];
        _wp1 setWaypointType "MOVE";
        
        _wp2 = _casPlaneGroup addWayPoint [getMarkerPos "MARKER_CASPLANE_HOLDING_2",300];
        _wp2 setWaypointType "MOVE";
        
        _cycleWP = _casPlaneGroup addWayPoint [getMarkerPos "MARKER_CASPLANE_HOLDING_3",300];
        _cycleWP setWaypointType "CYCLE";
        
    };
    
    if (ADD_CASPLANE_ATTACKING_WP) then {
    
        ADD_CASPLANE_ATTACKING_WP = false;    
    
        null = [] spawn {sleep (1+random 10); (assignedDriver casplane) sideChat "Strafing run initiated.";};
    
        {
            deleteWaypoint [_casPlaneGroup,_forEachIndex];
        } forEach (waypoints _casPlaneGroup);

        _dir = getDir player;
        _pos = getPos player;
        _range = 3000;
        _dx = sin (_dir) * _range;
        _dy = cos (_dir) * _range;
        _posx = _pos select 0;
        _posy = _pos select 1;
        _posBehind = [_posx - _dx,_posy - _dy, 300];
        _posInFront = [_posx + (_dx/10),_posy + (_dy/10), 300];
        
        "A" setMarkerPos _posBehind;
        "B" setMarkerPos _posInFront;
        
        _nPasses = 3;
        for "_i" from 0 to (_nPasses-1) do {

            _wp1 = _casPlaneGroup addWayPoint [_posBehind,100];
            _wp1 setWaypointType "MOVE";
            //_wp1 setWaypointBehaviour "COMBAT";
            _wp1 setWaypointCombatMode "RED";
            _wp1 setWaypointCompletionRadius 100;
            _wp1 setWaypointSpeed "NORMAL";
            
            _wp2 = _casPlaneGroup addWayPoint [_posInFront,100];
            _wp2 setWaypointType "MOVE";
            //_wp2 setWaypointBehaviour "COMBAT";
            _wp2 setWaypointCombatMode "RED";
            _wp2 setWaypointCompletionRadius 100;
            _wp2 setWaypointSpeed "LIMITED";
            
        };

        _wp3 = _casPlaneGroup addWayPoint [_posInFront,100];
        _wp3 setWaypointType "MOVE";
        //_wp3 setWaypointBehaviour "COMBAT";
        _wp3 setWaypointCombatMode "RED";
        _wp3 setWaypointCompletionRadius 100;
        _wp3 setWaypointStatements ["true","ADD_CASPLANE_HOLDING_WP = true; (assignedDriver casplane) sideChat 'Returning to holding pattern.'; "];
        

        
    };

    casplane setFuel 1;
    sleep 1;
    
};












