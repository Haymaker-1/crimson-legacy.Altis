
if (SPAWN_RANDOM_PATROLS_ENABLED) then {


    _marker = createMarker ["MARKER_OPFOR_BASE_NEGADES", [4927.61,16404.2,-0.25] ];
    _marker = createMarker ["MARKER_OPFOR_BASE_AGIOS", [4213.22,17385.7,-0.25] ];

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

    _opforGroupBaseNegades = createGroup EAST;
    _opforGroupBaseAgios = createGroup EAST;

    _groupData = [ ["MARKER_OPFOR_BASE_NEGADES",_opforGroupBaseNegades],
                   ["MARKER_OPFOR_BASE_AGIOS",_opforGroupBaseAgios]];

    _fighterTypes = ["O_Soldier_TL_F",
                     "O_Soldier_GL_F",
                     "O_Soldier_AR_F",
                     "O_Soldier_LAT_F",
                     "O_Soldier_lite_F",
                     "O_medic_F",
                     "O_Soldier_A_F"];

    {
        _basePos = getMarkerPos (_x select 0);

        _spawnPos = _basePos;
        _spawnPos set [1,((_basePos select 1) + (random 20))];
        
        _group = _x select 1;
        
        _nUnits = 3 + (random 2);
        for "_iUnit" from 0 to _nUnits do {

            _fighterType = _fighterTypes call BIS_fnc_selectRandom;
            _soldier = _fighterType createUnit [_spawnPos,_group,"",0.5,"PRIVATE"];
            
        };
        
        {
            _x removePrimaryWeaponItem "optic_ACO_grn";
            removeHeadGear _x;
            _x removeWeapon "NVGoggles_OPFOR";
            _x addHeadGear (_headgearArray call BIS_fnc_selectRandom);
        } forEach units _group;
        
    } forEach _groupData;


    _perimeter4 = ["MARKER_PERIMETER_KFR"] call HAYMAKER_fnc_constructPerimeter;
    [_perimeter4,_opforGroupBaseNegades,TOTAL_NUMBER_OF_RANDOM_PATROLS] execVM "scripts\setAsRandomPatrol.sqf";

    _perimeter5 = ["MARKER_PERIMETER_FWB"] call HAYMAKER_fnc_constructPerimeter;
    [_perimeter5,_opforGroupBaseAgios,TOTAL_NUMBER_OF_RANDOM_PATROLS+1] execVM "scripts\setAsRandomPatrol.sqf";
    
        
    TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 2;

};
