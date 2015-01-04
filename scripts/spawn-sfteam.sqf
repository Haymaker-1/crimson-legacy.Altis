
_group = createGroup WEST;
_nUnitsSF = 4;



sfTeamProb = [
         [[0,"B_Soldier_M_F",     "marksman"],    0.15],
         [[1,"B_soldier_repair_F","engineer"],    0.15],
         [[2,"B_medic_F",         "medic"],       0.15],
         [[3,"B_soldier_AR_F",    "autorifleman"],0.15],
         [[4,"B_Soldier_F",       "rifleman"],    0.25],
         [[5,"B_Soldier_GL_F",    "grenadier"],   0.15]
        ];

_arifleOfChoice = [[["f2000",0.67],["tavor",0.33]]] call HAYMAKER_fnc_selectWeightedRandom;

_arifle = nil;
_arifleGL = nil;
if (_arifleOfChoice == "f2000") then {
    _arifle = "arifle_Mk20_plain_F";
    _arifleGL = "arifle_Mk20_GL_plain_F";

};
if (_arifleOfChoice == "tavor") then {
    _arifle = "arifle_TRG21_F";
    _arifleGL = "arifle_TRG21_GL_F";
};



for "_iUnitSF" from 0 to (_nUnitsSF - 1) do {

    _fighterType = nil;
    if (_iUnitSF == 0) then {
        _fighterType = "B_Soldier_TL_F";  // teamleader
    }
    else {

        // FIXME for some reason the call to selectWeightedRandom only works
        // as intended when the scope of the input variable 'sfTeamProb' is global
        
        _tmp = [sfTeamProb] call HAYMAKER_fnc_selectWeightedRandom;

        _fighterTypeIdx = _tmp select 0;    
        _fighterType = _tmp select 1;
        sfTeamProb set [_fighterTypeIdx,[_tmp,0.00]];    
        
    };

    _fighterType createUnit [getMarkerPos "MARKER_NABISCO_HELIPAD", _group];
    
    sleep 5;
    
    _character = units _group select _iUnitSF;
    
    removeAllWeapons _character;  
    removeAllItems _character;  
    removeAllAssignedItems _character;  
    removeHeadgear _character;  
    removeBackpack _character;  
    removeVest _character;  
    removeUniform _character;    
    _character addUniform "U_B_SpecopsUniform_sgg";
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
    _character addMagazine "9Rnd_45ACP_Mag";
    _character addMagazine "9Rnd_45ACP_Mag";
    _character addWeapon "hgun_ACPC2_F";
    _character addHeadGear (["H_Shemag_khk",
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
                             "H_Booniehat_dgtl"  ] call BIS_fnc_selectRandom);

    _character allowDamage false;

    
    if (_fighterType == "B_Soldier_TL_F") then {

        _character addVest "V_TacVest_oli";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addWeapon _arifle;
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addPrimaryWeaponItem "optic_ACO_grn";
        _character addPrimaryWeaponItem "muzzle_snds_M";
        _character addWeapon "RangeFinder";
    
    };

   
    if (_fighterType == "B_Soldier_M_F") then {
        
        _character addVest "V_Chestrig_blk";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addMagazine "20Rnd_762x51_Mag";
        _character addWeapon "srifle_EBR_SOS_F";
        _character addPrimaryWeaponItem "muzzle_snds_B";
        _character addItem "optic_ACO_grn";
        _character addWeapon "RangeFinder";

    };


    if (_fighterType == "B_soldier_repair_F") then {

        _character addVest "V_TacVest_oli";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addWeapon _arifle;
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addPrimaryWeaponItem "optic_ACO_grn";
        _character addPrimaryWeaponItem "muzzle_snds_M";
        _character addBackpack "B_AssaultPack_rgr_Repair";
    
    };


    if (_fighterType == "B_medic_F") then {

        _character addVest "V_TacVest_oli";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addWeapon _arifle;
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addPrimaryWeaponItem "optic_ACO_grn";
        _character addPrimaryWeaponItem "muzzle_snds_M";
        _character addBackpack "B_AssaultPack_rgr_Medic";
        
    };


    if (_fighterType == "B_soldier_AR_F") then {
    
        _character addVest "V_TacVest_blk";
        _character addMagazine "200Rnd_65x39_cased_Box";
        _character addMagazine "200Rnd_65x39_cased_Box";
        _character addMagazine "200Rnd_65x39_cased_Box";
        _character addWeapon "LMG_Mk200_F";
        _character addPrimaryWeaponItem "optic_ACO_grn";
        
    };


    if (_fighterType == "B_Soldier_F") then {
    
        _character addVest "V_TacVest_oli";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addWeapon _arifle;
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addPrimaryWeaponItem "optic_ACO_grn";
        _character addPrimaryWeaponItem "muzzle_snds_M";

    };

    if (_fighterType == "B_Soldier_GL_F") then {

        _character addVest "V_HarnessOGL_brn";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addMagazine "30Rnd_556x45_Stanag";
        _character addWeapon _arifleGL;
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addMagazine "30Rnd_556x45_Stanag_Tracer_green";
        _character addPrimaryWeaponItem "optic_ACO_grn";
        _character addPrimaryWeaponItem "muzzle_snds_M";
        _character addMagazine "1Rnd_HE_Grenade_shell";
        _character addMagazine "1Rnd_HE_Grenade_shell";
        _character addMagazine "1Rnd_HE_Grenade_shell";
        _character addMagazine "1Rnd_HE_Grenade_shell";
        _character addMagazine "1Rnd_HE_Grenade_shell";
        _character addMagazine "1Rnd_HE_Grenade_shell";
    
    };
    
    _character selectWeapon (primaryWeapon _character);
    
};


(units _group select 0) setRank "SERGEANT";
_group selectLeader (units _group select 0); 


    
_perimeter = ["MARKER_PERIMETER_LNN_NABISCO"] call HAYMAKER_fnc_constructPerimeter;
_iRandomPatrol = TOTAL_NUMBER_OF_RANDOM_PATROLS;
null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;

sf0 = units _group select 0;
sf1 = units _group select 1;
sf2 = units _group select 2;
sf3 = units _group select 3;


// destroy global var sfTeamProb
sfTeamProb = nil;




