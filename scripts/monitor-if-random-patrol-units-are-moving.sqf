

while {true} do {


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
                    (group _unit) setBehaviour "COMBAT";
                };

            } forEach (units _group);
           
            RANDOM_PATROL_GROUP_LAST_KNOWN_POS set [_iGroup,_currentPositions];
            
        };
    } forEach RANDOM_PATROL_GROUP_HAS_ARRIVED;
    
    
    
    sleep 60;
    
};