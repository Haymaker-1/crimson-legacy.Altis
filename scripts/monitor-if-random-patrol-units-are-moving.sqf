


while {true} do {

    {   
        _group = _x select 0;
        if (!isNull _group) then {
            _lastKnownPositions = RANDOM_PATROL_GROUP_LAST_KNOWN_POS select _forEachIndex;
            _currentPositions = [];
            _currentPositions resize count (units _group);
            {
                _prevPos = (_lastKnownPositions select _forEachIndex); 
                _curPos = (_currentPositions select _forEachIndex);
                _dist = _prevPos distance _curPos;
                if (_dist < 5.0) then {
                    _unit = _x;            
                    player globalChat format ["DBG (%1): AI unit %2 seems stuck.",time,_unit];
                };
            } forEach (units _group);
            RANDOM_PATROL_GROUP_LAST_KNOWN_POS set [_forEachIndex,_currentPositions];
        };
    } forEach RANDOM_PATROL_GROUP;
    
    sleep 300;
    
};