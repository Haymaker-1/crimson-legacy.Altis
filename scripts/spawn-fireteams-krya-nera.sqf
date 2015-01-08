

if (SPAWN_RANDOM_PATROLS_ENABLED) then {

    _nPatrols = round (2 + random 2);

    for "_i" from (TOTAL_NUMBER_OF_RANDOM_PATROLS) to (TOTAL_NUMBER_OF_RANDOM_PATROLS + _nPatrols - 1) do 
    {

        _perimeter = ["MARKER_PERIMETER_KRYA_NERA_KMJ"] call HAYMAKER_fnc_constructPerimeter;
        _spawnPos = getMarkerPos "MARKER_SPAWN_KMJ";
        
        _iRandomPatrol = _i;

        _group = createGroup west;    
        _soldier = "B_Soldier_TL_F" createUnit [_spawnPos,_group];
        _soldier = "B_Soldier_GL_F" createUnit [_spawnPos,_group];
        _soldier = "B_Soldier_AR_F" createUnit [_spawnPos,_group];

        for "_j" from 0 to 3 do
        {
            _fighterType = ["B_Soldier_F",
                            "B_medic_F",
                            "B_Soldier_A_F",
                            "B_Soldier_LAT_F"] call BIS_fnc_selectRandom;
                            
            if (random 1.0 < 0.25) then
            {
                _soldier = _fighterType createUnit [_spawnPos,_group];
            };
        };
        
        null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
        null = [_group] execVM "scripts\change-equipment-blufor-group-members.sqf";
        
        TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;
        
    };  

};
