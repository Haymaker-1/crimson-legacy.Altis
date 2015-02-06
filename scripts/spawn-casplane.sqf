

TRIGGER_CALL_CASPLANE = createTrigger["EmptyDetector",[0,0,0]];
TRIGGER_CALL_CASPLANE setTriggerArea[5,5,0,true];
TRIGGER_CALL_CASPLANE setTriggerActivation["ECHO","PRESENT",true];
TRIGGER_CALL_CASPLANE setTriggerText "Close Air Support";
TRIGGER_CALL_CASPLANE setTriggerStatements["this", "ADD_CASPLANE_ATTACKING_WP = true;",""]; 


_pos = getMarkerPos "MARKER_CASPLANE_SPAWN";

casplane = createVehicle ["B_Plane_CAS_01_F", _pos,[],0,"FLY"];

_casPlaneGroup = createGroup WEST;

_unit = _casPlaneGroup createUnit ["B_Pilot_F", getPos casplane, [], 0, "NONE"];

_unit moveInDriver casplane;

(assignedDriver casplane) disableAI "AUTOTARGET";

null = [] execVM "scripts\monitor-number-of-bombs.sqf";



ADD_CASPLANE_HOLDING_WP = true;
ADD_CASPLANE_ATTCKING_WP = false;

_marker = createMarker ["MARKER_CASPLANE_ZONE",[0,0,0]];

"MARKER_CASPLANE_ZONE" setMarkerShape "RECTANGLE";
"MARKER_CASPLANE_ZONE" setMarkerColor "ColorOrange";
"MARKER_CASPLANE_ZONE" setMarkerSize [100,((1.0+0.2) * 2000) * 0.5];
"MARKER_CASPLANE_ZONE" setMarkerAlpha 0;


_hasAmmo = true;
_wipeoutMags = ["1000Rnd_Gatling_30mm_Plane_CAS_01_F",
                "6Rnd_Missile_AGM_02_F",
                "4Rnd_Bomb_04_F",
                "7Rnd_Rocket_04_HE_F",
                "7Rnd_Rocket_04_AP_F"];
                
_fuelThreshold = 0.2;
                
while {alive casplane AND _hasAmmo AND (fuel casplane > _fuelThreshold)} do {

    _hasAmmo = false;
    {
        _magType = _x select 0;
        _magCount = _x select 1;
        if (_magType in _wipeoutMags) then {
            if (_magCount > 0) then {
                _hasAmmo = true;
            };
        };
    } forEach (magazinesAmmo casplane);


    if (ADD_CASPLANE_HOLDING_WP) then {
    
        ADD_CASPLANE_HOLDING_WP = false;
  
        while {count (waypoints casplane) > 0} do {
            deleteWaypoint [_casPlaneGroup,0];
        };
        
        _wp1 = _casPlaneGroup addWayPoint [getMarkerPos "MARKER_CASPLANE_HOLDING_1",300];
        _wp1 setWaypointType "MOVE";
        
        (assignedDriver casplane) doMove getMarkerPos "MARKER_CASPLANE_HOLDING_1";
        (assignedDriver casplane) disableAI "TARGET";
        (group (assignedDriver casplane)) setCombatMode "GREEN";
        
        "MARKER_CASPLANE_ZONE" setMarkerAlpha 0;
        
    };

    if (ADD_CASPLANE_ATTACKING_WP) then {
    
        ADD_CASPLANE_ATTACKING_WP = false;    
    
        null = [] spawn {sleep (1+random 10); (assignedDriver casplane) sideChat "Receiving coordinates...on my way.";};
        
        CAS_START_DAYTIME = daytime;
        null = [] spawn {
            waitUntil {
                sleep 60;
                if (daytime - CAS_START_DAYTIME > 0.1) exitWith {true};
                false
            }; 
            ADD_CASPLANE_HOLDING_WP = true;  
            (assignedDriver casplane) disableAI "TARGET"; 
            (group (assignedDriver casplane)) setCombatMode "GREEN";
        };
    
        while {count (waypoints casplane) > 0} do {
            deleteWaypoint [_casPlaneGroup,0];
        };

        _safetyZone = 10;
        _dir = (getDir player + _safetyZone) % 360;
        _pos = getPos player;
        _range = 2000;
        _dx = sin (_dir) * _range;
        _dy = cos (_dir) * _range;
        _posx = _pos select 0;
        _posy = _pos select 1;
        _posBehind = [_posx - _dx,_posy - _dy, 300];
        _posInFront = [_posx + (_dx/5),_posy + (_dy/5), 300];
        _posMiddle = [(_posBehind select 0) + (_dx * 0.6),(_posBehind select 1) + (_dy * 0.6), 300];
        
        "MARKER_CASPLANE_ZONE" setMarkerPos _posMiddle;
        "MARKER_CASPLANE_ZONE" setMarkerDir _dir;
        "MARKER_CASPLANE_ZONE" setMarkerAlpha 1;
        
        _nPasses = 2 + round (random 2);
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
            _wp2 setWaypointSpeed "NORMAL";
            
        };

        _wp3 = _casPlaneGroup addWayPoint [_posInFront,100];
        _wp3 setWaypointType "MOVE";
        //_wp3 setWaypointBehaviour "COMBAT";
        _wp3 setWaypointCombatMode "RED";
        _wp3 setWaypointCompletionRadius 100;
        _wp3 setWaypointStatements ["true","ADD_CASPLANE_HOLDING_WP = true; (assignedDriver casplane) sideChat 'Returning to holding pattern.'; 'MARKER_CASPLANE_ZONE' setMarkerAlpha 0; "];
        

        
    };
    
    if (!ADD_CASPLANE_HOLDING_WP AND !ADD_CASPLANE_ATTACKING_WP) then {
        // currently attacking
        
        (assignedDriver casplane) enableAI "TARGET";
        (group (assignedDriver casplane)) setCombatMode "RED";
        
        {
            _target = _x;
            _targetSide = _target select 2;
            if (_targetSide == EAST) then {
                _id = (_target select 4);
                if (player knowsabout _id > 3.5) then {

                    (group casplane) reveal _id;
                    (assignedDriver casplane) doTarget _id; 
                    (assignedDriver casplane) doFire _id; 
                    
                };
            };
        } forEach (player nearTargets 1500);
    };    
    

    sleep 10;
    
};


//player globalChat "DBG: move somewhere out of sight";

if (alive casplane AND !_hasAmmo) then {
    (assignedDriver casplane) sideChat "Munitions black, I'm RTB. Good luck!";
};

if (alive casplane AND (fuel casplane > _fuelThreshold)) then {
    (assignedDriver casplane) sideChat "I'm running low on fuel. Returning to base.";
};

deleteVehicle TRIGGER_CALL_CASPLANE;
5 setRadioMsg "NULL";

deleteVehicle "MARKER_CASPLANE_ZONE";




