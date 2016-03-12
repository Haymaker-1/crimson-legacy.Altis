

if (HAYMAKER_GLOBALS getVariable "SPAWN_RANDOM_PATROLS_ENABLED") then {

    private "_nPatrols";
    private "_headgearArray";
	private "_iFrom";
	private "_iTo";

    _nPatrols = 2;
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
        private "_group";
        private "_nUnits";

        _perimeter = ["MARKER_PERIMETER_REBEL_CAMP"] call HAYMAKER_fnc_constructPerimeter;
        _spawnPos = getMarkerPos "MARKER_REBEL_CAMP_SPAWN";

        _iRandomPatrol = _i;

        _group = createGroup west;
        "B_G_Soldier_TL_F" createUnit [_spawnPos,_group];
        _nUnits = 2 + round (random 3);
        for "_iUnit" from 0 to (_nUnits - 1) do {
            private "_fighterType";
            _fighterType = ["B_G_Soldier_lite_F",
                            "B_G_medic_F",
                            "B_G_Soldier_A_F",
                            "B_G_Soldier_LAT_F",
                            "B_G_Soldier_AR_F"] call BIS_fnc_selectRandom;

            _fighterType createUnit [_spawnPos,_group];
        };

        {
            private "_headgear";
            removeHeadGear _x;
            _headgear = _headgearArray call BIS_fnc_selectRandom;
            _x addHeadGear _headgear;
            _x allowDamage false;
        } forEach (units _group);

        null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\set-as-random-patrol.sqf";

        HAYMAKER_GLOBALS setVariable ["TOTAL_NUMBER_OF_RANDOM_PATROLS", _i + 1];

    };
};
