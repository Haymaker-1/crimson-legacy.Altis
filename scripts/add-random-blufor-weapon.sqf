

_character = _this select 0;


_playerWeapon = [[["EBR",0.6],["F2000",0.35],["Tavor",0.05]]] call HAYMAKER_fnc_selectWeightedRandom; 


if (_playerWeapon == "EBR") then {
    _character addMagazine "20Rnd_762x51_Mag";
    _character addMagazine "20Rnd_762x51_Mag";
    _character addMagazine "20Rnd_762x51_Mag";
    _character addMagazine "20Rnd_762x51_Mag";
    _character addMagazine "20Rnd_762x51_Mag";
    _character addMagazine "20Rnd_762x51_Mag";
    _character addMagazine "20Rnd_762x51_Mag";
    _character addWeapon "srifle_EBR_F";
    _character addPrimaryWeaponItem "muzzle_snds_B";
    _character addPrimaryWeaponItem "optic_ACO_grn";
};

if (_playerWeapon == "F2000") then {
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addWeapon "arifle_Mk20_plain_F";
    _character addPrimaryWeaponItem "muzzle_snds_M";
    _character addPrimaryWeaponItem "optic_ACO_grn";
};

if (_playerWeapon == "Tavor") then {
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addMagazine "30Rnd_556x45_Stanag";
    _character addWeapon "arifle_TRG21_F";
    _character addPrimaryWeaponItem "muzzle_snds_M";
    _character addPrimaryWeaponItem "optic_ACO_grn";
};