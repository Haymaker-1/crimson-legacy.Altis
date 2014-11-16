

_marker = createMarker ["MARKER_OPFOR_BASE_KAVALA_1", [3500.28,13632.7,-0.25] ];
_marker = createMarker ["MARKER_OPFOR_BASE_KAVALA_2", [3870.47,13476.1,-0.25] ];
_marker = createMarker ["MARKER_OPFOR_BASE_KAVALA_3", [3894.33,12692.1,-0.25] ];
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

_opforGroupBaseKavala1 = createGroup EAST;
_opforGroupBaseKavala2 = createGroup EAST;
_opforGroupBaseKavala3 = createGroup EAST;
_opforGroupBaseNegades = createGroup EAST;
_opforGroupBaseAgios = createGroup EAST;

_groupData = [["MARKER_OPFOR_BASE_KAVALA_1",_opforGroupBaseKavala1],
              ["MARKER_OPFOR_BASE_KAVALA_2",_opforGroupBaseKavala2],
              ["MARKER_OPFOR_BASE_KAVALA_3",_opforGroupBaseKavala3],
              ["MARKER_OPFOR_BASE_NEGADES",_opforGroupBaseNegades],
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
    _spawnPos set [1,((_basePos select 1) - 10 + (random 20))];
    _group = _x select 1;
    
    _nUnits = 3 + (random 4);
    for "_iUnit" from 0 to _nUnits do {

        _fighterType = _fighterTypes call BIS_fnc_selectRandom;
        _soldier = _fighterType createUnit [_spawnPos,_group,"",0.5,"PRIVATE"];
        
    };
    
} forEach _groupData;


_perimeter1 = ["MARKER_PERIMETER_FJE_BASE_1"] call HAYMAKER_fnc_constructPerimeter;
_spawningComplete = [_perimeter1,_opforGroupBaseKavala1,TOTAL_NUMBER_OF_RANDOM_PATROLS] execVM "scripts\setAsRandomPatrol.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;


_perimeter2 = ["MARKER_PERIMETER_WBU_BASE_2"] call HAYMAKER_fnc_constructPerimeter;
_spawningComplete = [_perimeter2,_opforGroupBaseKavala2,TOTAL_NUMBER_OF_RANDOM_PATROLS+1] execVM "scripts\setAsRandomPatrol.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

_perimeter3 = ["MARKER_PERIMETER_GHS_BASE_3"] call HAYMAKER_fnc_constructPerimeter;
_spawningComplete = [_perimeter3,_opforGroupBaseKavala3,TOTAL_NUMBER_OF_RANDOM_PATROLS+2] execVM "scripts\setAsRandomPatrol.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;
    
TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 3;