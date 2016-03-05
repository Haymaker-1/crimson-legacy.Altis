
private "_group";
private "_iMember";
private "_selectedUnits";
private "_arifle";
private "_arifleGL";
private "_headGearArray";

_group = _this select 0;
_iMember = _this select 1;

_selectedUnits = nil;

if (isnil "_iMember") then {
    _selectedUnits = units _group;
} else {
    _selectedUnits = [(units _group) select _iMember];
};



_arifle = nil;
_arifleGL = nil;
if (BLUFOR_ARIFLE_OF_CHOICE == "f2000") then {
    _arifle = "arifle_Mk20_plain_F";
    _arifleGL = "arifle_Mk20_GL_plain_F";
};

if (BLUFOR_ARIFLE_OF_CHOICE == "tavor") then {
    _arifle = "arifle_TRG21_F";
    _arifleGL = "arifle_TRG21_GL_F";
};


_headGearArray =  ["H_Shemag_khk",
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

{

    private "_fighterType";
    private "_uniform";
    private "_vest";
    private "_backpack";

    _fighterType = typeOf _x;

    removeAllWeapons _x;
    removeAllItems _x;
    removeAllAssignedItems _x;
    removeHeadgear _x;
    removeBackpack _x;
    removeVest _x;
    removeUniform _x;

    _uniform = ["U_B_CombatUniform_mcam",
                "U_B_CombatUniform_mcam_tshirt",
                "U_B_CombatUniform_mcam_vest"] call BIS_fnc_selectRandom;

    _vest = ["V_TacVest_oli",
             "V_TacVest_oli",
             "V_Chestrig_oli",
             "V_Chestrig_blk",
             "V_PlateCarrier1_rgr",
             "V_BandollierB_oli",
             "V_HarnessO_brn"] call BIS_fnc_selectRandom;

    _backpack = ["B_AssaultPack_rgr"] call BIS_fnc_selectRandom;

    _x addUniform _uniform;
    _x addVest _vest;
    _x addItem "ItemGPS";
    _x assignItem "ItemGPS";
    _x addItem "ItemMap";
    _x assignItem "ItemMap";
    _x addItem "ItemRadio";
    _x assignItem "ItemRadio";
    _x addItem "ItemWatch";
    _x assignItem "ItemWatch";
    _x addItem "ItemCompass";
    _x assignItem "ItemCompass";
    _x addItem "FirstAidKit";
    _x addItem "FirstAidKit";
    _x addItem "FirstAidKit";
    _x addMagazine "9Rnd_45ACP_Mag";
    _x addMagazine "9Rnd_45ACP_Mag";
    _x addWeapon "hgun_ACPC2_F";

    if (_fighterType == "B_Soldier_TL_F") then {

        private "_tmpArray";

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addWeapon "RangeFinder";

        _tmpArray = _headGearArray + ["H_beret_blk","H_beret_grn","H_beret_grn_SF"];
        _x addHeadGear (_tmpArray call BIS_fnc_selectRandom);

    };

    if (_fighterType == "B_Officer_F") then {

        private "_tmpArray";

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addWeapon "RangeFinder";

        _tmpArray = ["H_beret_blk","H_beret_grn","H_beret_grn_SF"];
        _x addHeadGear (_tmpArray call BIS_fnc_selectRandom);

    };


    if (_fighterType == "B_Soldier_GL_F") then {

        removeVest _x;
        _x addVest (["V_HarnessOGL_brn","V_HarnessOGL_gry"] call BIS_fnc_selectRandom);

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifleGL;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addMagazine "1Rnd_HE_Grenade_shell";
        _x addMagazine "1Rnd_HE_Grenade_shell";
        _x addMagazine "1Rnd_HE_Grenade_shell";
        _x addMagazine "1Rnd_HE_Grenade_shell";
        _x addMagazine "1Rnd_HE_Grenade_shell";
        _x addMagazine "1Rnd_HE_Grenade_shell";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);

    };

    if (_fighterType == "B_soldier_AR_F") then {

        _x addBackpack _backpack;
        _x addMagazine "150Rnd_762x54_Box_Tracer";
        _x addWeapon "LMG_Zafir_F";
        _x addMagazine "150Rnd_762x54_Box_Tracer";
        _x addMagazine "150Rnd_762x54_Box_Tracer";
        _x addMagazine "150Rnd_762x54_Box_Tracer";
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);

    };


    if (_fighterType == "B_medic_F") then {

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addBackpack "B_AssaultPack_rgr_Medic";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);

    };


    if (_fighterType == "B_Soldier_F") then {

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);

    };

    if (_fighterType == "B_Soldier_LAT_F") then {

        _x addBackpack _backpack;
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);
        _x addMagazine "NLAW_F";
        _x addWeapon "launch_NLAW_F";

    };

    if (_fighterType == "B_Soldier_A_F") then {

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);
        _x addBackpack "B_AssaultPack_rgr";
        (unitBackpack _x) addMagazineCargo ["30Rnd_556x45_Stanag",7];
        (unitBackpack _x) addMagazineCargo ["150Rnd_762x51_Box",3];

    };

    if (_fighterType == "B_Soldier_M_F") then {

        _x addMagazine "20Rnd_762x51_Mag";
        _x addMagazine "20Rnd_762x51_Mag";
        _x addMagazine "20Rnd_762x51_Mag";
        _x addMagazine "20Rnd_762x51_Mag";
        _x addMagazine "20Rnd_762x51_Mag";
        _x addMagazine "20Rnd_762x51_Mag";
        _x addMagazine "20Rnd_762x51_Mag";
        _x addWeapon "srifle_EBR_SOS_F";
        _x addItem "optic_ACO_grn";
        _x addWeapon "RangeFinder";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);

    };


    if (_fighterType == "B_soldier_repair_F") then {

        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _x addWeapon _arifle;
        _x addPrimaryWeaponItem "optic_ACO_grn";
        _x addPrimaryWeaponItem "acc_flashlight";
        _x addBackpack "B_AssaultPack_rgr_Repair";
        _x addHeadGear (_headGearArray call BIS_fnc_selectRandom);

    };

    _x selectWeapon (primaryWeapon _x);

} forEach _selectedUnits;
