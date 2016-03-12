

if (SPAWN_RANDOM_PATROLS_ENABLED) then {

    private "_nPatrols";
    private "_headgearArray";
    private "_iFrom";
    private "_iTo";

    _nPatrols = 1;
    _iFrom = HAYMAKER_GLOBALS getVariable "TOTAL_NUMBER_OF_RANDOM_PATROLS";
    _iTo = _iFrom + _nPatrols - 1;

    _headgearArray = ["H_Beret_blk",
                      "H_Beret_grn",
                      "H_Beret_grn_SF",
                      "H_Shemag_khk",
                      "H_Shemag_tan",
                      "H_ShemagOpen_khk",
                      "H_ShemagOpen_tan",
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

    for "_i" from _iFrom to _iTo do {

        private "_perimeter";
        private "_spawnPos";
        private "_iRandomPatrol";
        private "_n";

        _perimeter = ["MARKER_PERIMETER_EVI_AA_AMFISSA"] call HAYMAKER_fnc_constructPerimeter;
        _spawnPos = getMarkerPos "MARKER_SPAWN_EVI";

        _iRandomPatrol = _i;

        GROUP_AA_AMFISSA = createGroup east;
        _n = 3 + round (random 2);
        for "_iSoldier" from 1 to _n do {
            "O_Soldier_GL_F" createUnit [_spawnPos,GROUP_AA_AMFISSA];
        };

        {
            private "_headgear";
            removeHeadGear _x;
            _headgear = _headgearArray call BIS_fnc_selectRandom;
            _x addHeadGear _headgear;
            _x removeWeapon "NVGoggles_OPFOR";
            _x removePrimaryWeaponItem "optic_ACO_grn";
        } forEach units GROUP_AA_AMFISSA;

        null = [_perimeter,GROUP_AA_AMFISSA,_iRandomPatrol] execVM "scripts\set-as-random-patrol.sqf";

        HAYMAKER_GLOBALS setVariable ["TOTAL_NUMBER_OF_RANDOM_PATROLS", _i + 1];

    };
};
