

if (SPAWN_RANDOM_PATROLS_ENABLED) then {

    _nPatrols = 1;

    _headgearArray = ["H_Beret_blk",
                      "H_Beret_grn",
                      "H_Beret_grn_SF",
                      "H_Shemag_khk",
                      "H_Shemag_tan",
                      "H_ShemagOpen_khk",
                      "H_ShemagOpen_tan",
                      "H_TurbanO_blk",
                      "H_Booniehat_indp",
                      "H_Cap_oli",
                      "H_Cap_blk_Raven",
                      "H_Cap_tan",
                      "H_Booniehat_khk",
                      "H_Booniehat_mcamo",
                      "H_Booniehat_grn",
                      "H_Booniehat_tan",
                      "H_Booniehat_dirty",
                      "H_Booniehat_dgtl"];


    for "_i" from (TOTAL_NUMBER_OF_RANDOM_PATROLS) to (TOTAL_NUMBER_OF_RANDOM_PATROLS + _nPatrols - 1) do 
    {

        _perimeter = ["MARKER_PERIMETER_LCJ_WAREHOUSE_AGIOS"] call HAYMAKER_fnc_constructPerimeter;
        _spawnPos = getMarkerPos "MARKER_LCJ_SPAWN";
        
        _iRandomPatrol = _i;

        _group = createGroup west;
        _soldier1 = "I_G_Soldier_TL_F" createUnit [_spawnPos,_group];
        _soldier2 = "I_G_Soldier_LAT_F" createUnit [_spawnPos,_group];
        _soldier3 = "I_G_Soldier_GL_F" createUnit [_spawnPos,_group];
        _soldier4 = "I_G_Soldier_AR_F" createUnit [_spawnPos,_group];

        {
            removeHeadGear _x;
            _headgear = _headgearArray call BIS_fnc_selectRandom;
            _x addHeadGear _headgear;
        } forEach units _group;    
        
        null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
        
        TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;
        
    };  

    {
        _spawnAnother = true;
        while {_spawnAnother} do {
            _veh = createVehicle ["I_G_Offroad_01_F", getMarkerPos "MARKER_SHED_AGIOS_SPAWN_TRUCK",[],50,"NONE"];
            _veh setDir random 360;
            _veh setFuel (0.05 + (random 0.03));
            sleep 2.0;
            if ((damage _veh) == 0.0) then {
                _spawnAnother = false;
            }
            else {
                deleteVehicle _veh;
            };
        };  

        
    } forEach ["car0","car1"];

};

