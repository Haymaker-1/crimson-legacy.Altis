


if (HAYMAKER_GLOBALS getVariable "SPAWN_RANDOM_PATROLS_ENABLED") then {

    private "_nPatrols";
    private "_headgearArray";
    private "_iFrom";
    private "_iTo";

    _nPatrols = 1 + round (random 1);
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
        private "_soldier";

        _perimeter = ["MARKER_PERIMETER_GOS_POWER_PLANT"] call HAYMAKER_fnc_constructPerimeter;
        _spawnPos = getMarkerPos "GOS_SPAWN";

        _iRandomPatrol = _i;

        _group = createGroup east;
        _soldier = "O_Soldier_TL_F" createUnit [_spawnPos,_group];
        _soldier = "O_Soldier_GL_F" createUnit [_spawnPos,_group];
        _soldier = "O_Soldier_AR_F" createUnit [_spawnPos,_group];

        for "_j" from 0 to 3 do {
            private "_fighterType";
            _fighterType = [[["O_Soldier_lite_F",0.35],
                            ["O_medic_F",0.2],
                            ["O_Soldier_A_F",0.2],
                            ["O_Soldier_LAT_F",0.2],
                            ["O_Soldier_M_F",0.05]]] call HAYMAKER_fnc_selectWeightedRandom;

            if (random 1.0 < 0.25) then {
                _soldier = _fighterType createUnit [_spawnPos,_group];
            };
        };

        {
            private "_headgear";
            removeHeadGear _x;
            _headgear = _headgearArray call BIS_fnc_selectRandom;
            _x addHeadGear _headgear;
            if (typeOf _x != "O_Soldier_TL_F") then {
                _x removeWeapon "NVGoggles_OPFOR";
            };
            _x removePrimaryWeaponItem "optic_ACO_grn";
        } forEach units _group;

        null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\set-as-random-patrol.sqf";

        HAYMAKER_GLOBALS setVariable ["TOTAL_NUMBER_OF_RANDOM_PATROLS", _i + 1];
    };

    TASK_SEIZE_POWER_PLANT = player createSimpleTask ["TASKID_SEIZE_POWER_PLANT"];
    TASK_SEIZE_POWER_PLANT setSimpleTaskDescription ["Seize the power plant and rig the <marker name='MARKER_POWER_PLANT'>transformer</marker> with explosives.","Seize power plant","Seize power plant"];
    TASK_SEIZE_POWER_PLANT setSimpleTaskDestination (getMarkerPos "MARKER_POWER_PLANT");
    TASK_SEIZE_POWER_PLANT setTaskState "Assigned";
    ["TaskAssigned", ["","Seize power plant"]] call BIS_fnc_showNotification;
    player setCurrentTask TASK_SEIZE_POWER_PLANT;
	// FIXME don't really need TASK_SEIZE_POWER_PLANT_HAS_BEEN_ASSIGNED it seems
    HAYMAKER_GLOBALS setVariable ["TASK_SEIZE_POWER_PLANT_HAS_BEEN_ASSIGNED", true];

    POWER_PLANT_CLEARED = false;
    POWER_PLANT_SEIZED = false;
    POWER_PLANT_CAN_PLACE_EXPLOSIVES = false;

    TRIGGER_POWER_PLANT_CLEARED = createTrigger["EmptyDetector",getMarkerPos "MARKER_POWER_PLANT"];
    TRIGGER_POWER_PLANT_CLEARED setTriggerArea[600,600,0,false];
    TRIGGER_POWER_PLANT_CLEARED setTriggerActivation["EAST","NOT PRESENT",false];
    TRIGGER_POWER_PLANT_CLEARED setTriggerStatements["this AND HAYMAKER_GLOBALS getVariable 'TASK_SEIZE_POWER_PLANT_HAS_BEEN_ASSIGNED'","null = [] execVM 'scripts\power-plant-seized.sqf'",""];


    TRIGGER_POWER_PLANT_SEIZED = createTrigger["EmptyDetector",[4222.93,15045,0]];
    TRIGGER_POWER_PLANT_SEIZED setTriggerArea[40,70,-85.7435,false];
    TRIGGER_POWER_PLANT_SEIZED triggerAttachVehicle [player];
    TRIGGER_POWER_PLANT_SEIZED setTriggerActivation["VEHICLE","PRESENT",true];
    TRIGGER_POWER_PLANT_SEIZED setTriggerStatements["this AND HAYMAKER_GLOBALS getVariable 'TASK_SEIZE_POWER_PLANT_HAS_BEEN_ASSIGNED' AND POWER_PLANT_CLEARED","null = [] spawn {sleep 10 + random 20;POWER_PLANT_SEIZED = true;}",""];
};
