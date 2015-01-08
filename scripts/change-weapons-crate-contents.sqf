

_crate = _this select 0;

clearItemCargo _crate;
clearMagazineCargo _crate;
clearWeaponCargo _crate;



_crate addMagazineCargo ["30Rnd_556x45_STANAG",round (random 20)];
_crate addMagazineCargo ["30Rnd_556x45_STANAG_tracer_green",round (random 20)];
_crate addMagazineCargo ["20Rnd_762x51_Mag",round (random 10)];
_crate addMagazineCargo ["9Rnd_45ACP_Mag",round (random 6)];
_crate addMagazineCargo ["1Rnd_HE_Grenade_shell",round (random 10)];
_crate addMagazineCargo ["HandGrenade",round (random 10)];
_crate addMagazineCargo ["MiniGrenade",round (random 10)];

