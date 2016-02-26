

private "_men";
private "_perimeters";


_men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
_perimeters = [["MARKER_PERIMETER_FJE_BASE_1"] call HAYMAKER_fnc_constructPerimeter,
               ["MARKER_PERIMETER_WBU_BASE_2"] call HAYMAKER_fnc_constructPerimeter,
               ["MARKER_PERIMETER_GHS_BASE_3"] call HAYMAKER_fnc_constructPerimeter];



{

    private "_man";

    _man = _x;
    if (side _man == EAST) then {


        private "_group";
        private "_iRandomPatrol";

        _group = (group _man);

        _iRandomPatrol = [_man] call HAYMAKER_fnc_findRandomPatrolmansGroup;

        if (_iRandomPatrol >= 0) then {

            STOP_RANDOM_PATROL_GROUP set [_iRandomPatrol,true];

            null = [_man,_perimeters,_group,_iRandomPatrol] spawn {

                private "_man";
                private "_perimeters";
                private "_group";
                private "_iRandomPatrol";
                private "_dists";
                private "_indexMinimum";
                private "_distMin";
                private "_perimeter";


                _man = _this select 0;
                _perimeters = _this select 1;
                _group = _this select 2;
                _iRandomPatrol = _this select 3;

                waitUntil{
                    sleep 5;
                    if (!(STOP_RANDOM_PATROL_GROUP select _iRandomPatrol)) exitWith {true};
                    false
                };

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

                null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
            };
        };
    };
} forEach _men;
