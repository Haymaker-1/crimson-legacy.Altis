
_nBombsLeft = casplane ammo "Bomb_04_Plane_CAS_01_F";

while {(alive casplane) AND (_nBombsLeft > 0) } do {
    


    _nBombsLeftNow = casplane ammo "Bomb_04_Plane_CAS_01_F";
    
    if ((_nBombsLeftNow < _nBombsLeft) AND (alive casplane)) then {
    
        (assignedDriver casplane) sideChat (["Bomb away!","Projectile en route.","Bomb released.", "Projectile in the air."] call BIS_fnc_selectRandom);
        _nBombsLeft = _nBombsLeftNow;
        
    };

    sleep 0.5;
};

if (alive casplane) then{

    (assignedDriver casplane) sideChat (["No more bombs.","Out of bombs."] call BIS_fnc_selectRandom);

};