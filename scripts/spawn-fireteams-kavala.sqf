waitUntil{sleep 5; SPAWNING_ENABLED;};
SPAWNING_ENABLED = !SPAWNING_ENABLED;

_nPatrols = 25;

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
                  "H_Booniehat_dgtl",
                  "H_Bandmask_blk"];


for "_i" from (TOTAL_NUMBER_OF_RANDOM_PATROLS) to (TOTAL_NUMBER_OF_RANDOM_PATROLS + _nPatrols - 1) do 
{

    _perimeter = ["MARKER_PERIMETER_FKS_KAVALA"] call HAYMAKER_fnc_constructPerimeter;
    _marker = ["GJV_SPAWN_1","GJV_SPAWN_2","GJV_SPAWN_3","GJV_SPAWN_4","GJV_SPAWN_5","GJV_SPAWN_6","GJV_SPAWN_7","GJV_SPAWN_8"] call BIS_fnc_selectRandom;
    _spawnPos = getMarkerPos _marker;
    
    _iRandomPatrol = _i;

    _group = createGroup east;
    _soldier = "O_Soldier_TL_F" createUnit [_spawnPos,_group,"null = [this,300] execVM 'scripts\look-out-for-mortar-targets.sqf';", 0.5,"SERGEANT"];
    _soldier = "O_Soldier_GL_F" createUnit [_spawnPos,_group,"null = [this,300] execVM 'scripts\look-out-for-mortar-targets.sqf';", 0.5,"PRIVATE"];
    _soldier = "O_Soldier_AR_F" createUnit [_spawnPos,_group,"null = [this,300] execVM 'scripts\look-out-for-mortar-targets.sqf';", 0.5,"PRIVATE"];
    if (random 1.0 < 0.5) then {
        _soldier = "O_Soldier_LAT_F" createUnit [_spawnPos,_group,"null = [this,300] execVM 'scripts\look-out-for-mortar-targets.sqf';", 0.5,"PRIVATE"];
    };

    for "_j" from 0 to 3 do
    {
        _fighterType = ["O_Soldier_lite_F",
                        "O_medic_F",
                        "O_Soldier_A_F"] call BIS_fnc_selectRandom;

        if (random 1.0 < 0.25) then
        {
            _soldier = _fighterType createUnit [_spawnPos,_group,"null = [this,300] execVM 'scripts\look-out-for-mortar-targets.sqf';", 0.5,"PRIVATE"];
        };
    };
    
    {
        removeHeadGear _x;
        _headgear = _headgearArray call BIS_fnc_selectRandom;
        _x addHeadGear _headgear;
        if ((typeOf _x) != "O_Soldier_TL_F") then {
            _x removeWeapon "NVGoggles_OPFOR";
        };
    } forEach units _group;     
    
    null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
    
    TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;
    
};  

SPAWNING_ENABLED = !SPAWNING_ENABLED;
