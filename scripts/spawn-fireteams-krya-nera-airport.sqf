
diag_log format ["starting %1", __FILE__];

if (SPAWN_RANDOM_PATROLS_ENABLED) then {

    private "_nPatrols";

    _nPatrols = 2 + round (random 2);

    for "_i" from (TOTAL_NUMBER_OF_RANDOM_PATROLS) to (TOTAL_NUMBER_OF_RANDOM_PATROLS + _nPatrols - 1) do {

        private "_perimeter";
        private "_spawnPos";
        private "_iRandomPatrol";
        private "_group";

        _perimeter = ["MARKER_PERIMETER_KRYA_NERA_AIRPORT_FTS"] call HAYMAKER_fnc_constructPerimeter;
        _spawnPos = getMarkerPos "MARKER_FTS_SPAWN";

        _iRandomPatrol = _i;

        _group = createGroup west;
        "B_Soldier_TL_F" createUnit [_spawnPos,_group];
        "B_Soldier_GL_F" createUnit [_spawnPos,_group];
        "B_Soldier_AR_F" createUnit [_spawnPos,_group];

        for "_j" from 0 to 3 do {
            private "_fighterType";
            _fighterType = ["B_Soldier_F",
                            "B_medic_F",
                            "B_Soldier_A_F",
                            "B_Soldier_LAT_F"] call BIS_fnc_selectRandom;

            if (random 1.0 < 0.25) then
            {
                _fighterType createUnit [_spawnPos,_group];
            };
        };

        null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
        null = [_group] execVM "scripts\change-equipment-blufor-group-members.sqf";

        TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;

    };
};

diag_log format ["%1: done", __FILE__];
