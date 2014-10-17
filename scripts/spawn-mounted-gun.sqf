

_thePos = _this select 0;
_theDir = _this select 1;
_theWeapon = _this select 2;

_staticWeapon = createVehicle[_theWeapon,_thePos,[],0,"NONE"];
_staticWeapon setPosATL _thePos; 
_staticWeapon setDir _theDir; 

_theGroup = createGroup east;    
"O_Soldier_TL_F" createUnit [_thePos,_theGroup];
_gunner = (units _theGroup select 0);
_gunner moveInGunner _staticWeapon; 


if (_theWeapon == "O_HMG_01_high_F") then {

    _staticWeapon removeMagazine "500Rnd_127x99_mag"; 
    _staticWeapon removeMagazine "500Rnd_127x99_mag";
    _staticWeapon removeMagazine "500Rnd_127x99_mag";

    _staticWeapon addMagazine "500Rnd_127x99_mag_Tracer_green";
    _staticWeapon addMagazine "500Rnd_127x99_mag_Tracer_green";
    _staticWeapon addMagazine "500Rnd_127x99_mag_Tracer_green";
    _staticWeapon addMagazine "500Rnd_127x99_mag_Tracer_green";
    
};



