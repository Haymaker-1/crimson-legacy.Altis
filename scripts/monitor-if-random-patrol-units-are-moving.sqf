

while {true} do {


    STUCK_UNITS = [];

    {   
        _group = _x select 0;
        _iGroup = _forEachIndex;
        
        if (!isNull _group) then {
        
            _lastKnownPositions = RANDOM_PATROL_GROUP_LAST_KNOWN_POS select _iGroup;
            _currentPositions = [];
            _currentPositions resize count (units _group);
            
            if (_lastKnownPositions isEqualTo locationNull) then {
                _lastKnownPositions = [];
                _lastKnownPositions resize count (units _group);
                {
                    _lastKnownPositions set [_forEachIndex,locationNull];
                } forEach (units _group);
            };
            
            {
                
                _unit = _x;
                _iUnit = _forEachIndex;
               
                _prevPos = (_lastKnownPositions select _iUnit); 
                _curPos = getPos _unit;
                _currentPositions set [_iUnit,_curPos];                
                
                _dist = _prevPos distance _curPos;
                
                if (_dist < 5.0) then {
                    //player globalChat format ["DBG (%1): AI unit %2 seems stuck.",time,_unit];
                    _nUnits = count STUCK_UNITS;
                    STUCK_UNITS resize (_nUnits + 1);
                    STUCK_UNITS set[_nUnits,_unit];
                };

            } forEach (units _group);
           
            RANDOM_PATROL_GROUP_LAST_KNOWN_POS set [_iGroup,_currentPositions];
            
        };
    } forEach RANDOM_PATROL_GROUP_HAS_ARRIVED;
    
    
    { 
        // remove any old map markers that begin with "MARKER_STUCK_"
        _isStuckMarker = [_x, "MARKER_STUCK_", count toArray "MARKER_STUCK_"] call HAYMAKER_fnc_strcmpn;
        if (_isStuckMarker) then {
            deleteVehicle _x;
        };
    } forEach allmapMarkers;
    
    { 
        // create new map marker for every unit that is stuck
        _markerName = format ["MARKER_STUCK_",_forEachIndex];
        _marker = createMarker [_markerName, getPos _x];
        _markerName setMarkerColor "ColorPink";
        _markerName setMarkerType "mil_box";
        _markerName setMarkerSize [0.25,0.25];
    } forEach STUCK_UNITS;
    
    
    sleep 60;
    
};