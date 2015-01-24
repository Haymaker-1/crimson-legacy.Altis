
_character = _this select 0;

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
                  

removeAllWeapons _character;
removeAllItems _character;
removeAllAssignedItems _character;
removeHeadgear _character;
removeBackpack _character;
removeVest _character;
removeUniform _character;
_character addUniform "U_B_SpecopsUniform_sgg";
_character addWeapon "RangeFinder";
_character assignItem "RangeFinder";
_character addItem "ItemGPS";
_character assignItem "ItemGPS";
_character addItem "ItemMap";
_character assignItem "ItemMap";
_character addItem "ItemRadio";
_character assignItem "ItemRadio";
_character addItem "ItemWatch";
_character assignItem "ItemWatch";
_character addItem "ItemCompass";
_character assignItem "ItemCompass";
_character addItem "FirstAidKit";
_character addItem "FirstAidKit";
_character addItem "FirstAidKit";
_character addVest "V_Chestrig_blk";

null = [_character] execVM "scripts\add-random-blufor-weapon.sqf";

_character addMagazine "9Rnd_45ACP_Mag";
_character addMagazine "9Rnd_45ACP_Mag";
_character addWeapon "hgun_ACPC2_F";

removeHeadGear _character;
_headgear = _headgearArray call BIS_fnc_selectRandom;
_character addHeadGear _headgear;


waitUntil {
    sleep 0.1;
    if (primaryWeapon _character != "") exitWith {true};
    false
};

_character selectWeapon (primaryWeapon _character);


null = [] spawn {
    sleep 8;
    TASK_REPORT_IN_AT_KRYA_NERA = player createSimpleTask ["TASKID_REPORT_IN_AT_KRYA_NERA"];
    TASK_REPORT_IN_AT_KRYA_NERA setSimpleTaskDescription ["Report to your commanding officer at <marker name='MARKER_OP_KRYA_NERA'>OP Krya Nera</marker>.","Report in","Report in"];
    TASK_REPORT_IN_AT_KRYA_NERA setSimpleTaskDestination (getMarkerPos "MARKER_COMMANDING_OFFICER");
    player setCurrentTask TASK_REPORT_IN_AT_KRYA_NERA;
    TASK_REPORT_IN_AT_KRYA_NERA setTaskState "Assigned";
};

5 fadeSound 1;
null = [] spawn {
    sleep 3;
    titleText ["", "BLACK IN", 5];
}; 
null = [] spawn {
    sleep 10;
    ["TaskAssigned", ["","Report in"]] call BIS_fnc_showNotification;
};