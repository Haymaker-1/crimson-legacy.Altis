
_nPatrols = 3;

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

    _perimeter = ["MARKER_PERIMETER_AIRBASE"] call HAYMAKER_fnc_constructPerimeter;
    _spawnPos = getMarkerPos "MARKER_AIRBASE_SPAWN";
    
    _iRandomPatrol = _i;

    _group = createGroup east;    
    "O_Soldier_TL_F" createUnit [_spawnPos,_group];
    "O_Soldier_GL_F" createUnit [_spawnPos,_group];
    "O_Soldier_AR_F" createUnit [_spawnPos,_group];

    for "_j" from 0 to 3 do
    {
        _fighterType = [[["O_Soldier_lite_F",0.35],
                        ["O_medic_F",0.2],
                        ["O_Soldier_A_F",0.2],
                        ["O_Soldier_LAT_F",0.2],
                        ["O_Soldier_M_F",0.05]]] call HAYMAKER_fnc_selectWeightedRandom;

        if (random 1.0 < 0.25) then
        {
            _fighterType createUnit [_spawnPos,_group];
        };
    };
   
    {
        removeHeadGear _x;
        _headgear = _headgearArray call BIS_fnc_selectRandom;
        _x addHeadGear _headgear;
        _x removeWeapon "NVGoggles_OPFOR";
        _x removePrimaryWeaponItem "optic_ACO_grn";
    } forEach units _group;

    null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
    
    TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;
    
};  

