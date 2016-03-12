

if (SPAWN_RANDOM_PATROLS_ENABLED) then {

    private "_nPatrols";
	private "_iFrom";
	private "_iTo";

    _nPatrols = round (2 + random 2);
	_iFrom = HAYMAKER_GLOBALS getVariable "TOTAL_NUMBER_OF_RANDOM_PATROLS";
	_iTo = _iFrom + _nPatrols - 1;

    for "_i" from _iFrom to _iTo do {

        private "_perimeter";
        private "_randindex";
        private "_spawnPos";
        private "_iRandomPatrol";
        private "_group";
        private "_soldier";

        _perimeter = ["MARKER_PERIMETER_KRYA_NERA_KMJ"] call HAYMAKER_fnc_constructPerimeter;
        _randindex = floor (random (count _perimeter));
        _spawnPos = _perimeter select _randindex;

        _iRandomPatrol = _i;

        _group = createGroup west;
        _soldier = "B_Soldier_TL_F" createUnit [_spawnPos,_group];
        _soldier = "B_Soldier_GL_F" createUnit [_spawnPos,_group];
        _soldier = "B_Soldier_AR_F" createUnit [_spawnPos,_group];

        for "_j" from 0 to 3 do {
            private "_fighterType";
            _fighterType = ["B_Soldier_F",
                            "B_medic_F",
                            "B_Soldier_A_F",
                            "B_Soldier_LAT_F"] call BIS_fnc_selectRandom;

            if (random 1.0 < 0.25) then {
                _soldier = _fighterType createUnit [_spawnPos,_group];
            };
        };

        null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\set-as-random-patrol.sqf";
        null = [_group] execVM "scripts\change-equipment-blufor-group-members.sqf";

        HAYMAKER_GLOBALS setVariable ["TOTAL_NUMBER_OF_RANDOM_PATROLS", _i + 1];

    };

};

