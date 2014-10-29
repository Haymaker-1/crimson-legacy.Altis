


player globalChat "ag4df";

_men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
_perimeters = [["MARKER_PERIMETER_FJE_BASE_1"] call HAYMAKER_fnc_constructPerimeter,
               ["MARKER_PERIMETER_WBU_BASE_2"] call HAYMAKER_fnc_constructPerimeter,
               ["MARKER_PERIMETER_GHS_BASE_3"] call HAYMAKER_fnc_constructPerimeter];


               
{
    _man = _x;
    if (side _man == EAST) then {
    
        _group = (group _man);
        
        _iRandomPatrol = [_man] call HAYMAKER_fnc_findRandomPatrolmansGroup;
        
        if (_iRandomPatrol >= 0) then {
        
            player globalChat format ["stopping group %1",_iRandomPatrol];
            
            STOP_RANDOM_PATROL_GROUP set [_iRandomPatrol,true];

            null = [_man,_perimeters,_group,_iRandomPatrol] spawn {
                
                _man = _this select 0;
                _perimeters = _this select 1;
                _group = _this select 2;
                _iRandomPatrol = _this select 3;
                
                player globalChat format ["waiting for group %1",_iRandomPatrol];
                        
                waitUntil{sleep 5;!(STOP_RANDOM_PATROL_GROUP select _iRandomPatrol)};
                    
                player globalChat format ["starting group %1",_iRandomPatrol];

                _dists = [_man distance getMarkerPos "MARKER_OPFOR_BASE_KAVALA_1",
                          _man distance getMarkerPos "MARKER_OPFOR_BASE_KAVALA_2",
                          _man distance getMarkerPos "MARKER_OPFOR_BASE_KAVALA_3"];
                                  
                _indexMinimum = 0;
                _distMin = _dists select _indexMinimum;
                        
                for "_i" from 1 to (count _dists - 1) do {
                    if ((_dists select _i) < _distMin) then {
                        _distMin = _dists select _i;
                        _indexMinimum = _i;
                    };
                };
                
                _perimeter = _perimeters select _indexMinimum;
                        
                player globalChat format["_indexMinimum = %1",_indexMinimum];
                player globalChat format["_group = %1",_group];
                player globalChat format["_iRandomPatrol = %1",_iRandomPatrol];
                
                null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
            };
        };
    };
    
    
    
} forEach _men;




