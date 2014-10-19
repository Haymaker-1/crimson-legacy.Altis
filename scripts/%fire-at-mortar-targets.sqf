

// file no longer used ? kavala-mortar-group-standby-for-firemission instead

MORTAR_TARGETS = [];

private "_targetAge";
private "_targetAgeMax";
private "_nShells";
private "_spread";
private "_pos";

_targetAgeMax = 5/60; // hours

while {true} do {

    _nShells = 3 + floor (random 2);
    
    {
        _targetAge = daytime - (_x select 0);
        
        if (_targetAge < _targetAgeMax) {
            _spread = (_targetAge/_targetAgeMax) * 200;
            
            for "_i" from 0 to _nShells do {
                
                _pos = [(_x select 1 select 0) - _spread/2 + random _spread, (_x select 1 select 1) - _spread/2 + random _spread, 20];
                
                mortarGunner doArtilleryFire [_pos,"8Rnd_82mm_Mo_Flare_white",1];  
                mortar1 addMagazine ["8Rnd_82mm_Mo_Flare_white",1];
                {
                    if (side _x == EAST) then {
                        (group _x) setBehaviour "COMBAT";
                    };
                } forEach (_pos nearObjects ["Man", 1000]);
            };
            sleep (30 + random 15);
        };
        
    } forEach MORTAR_TARGETS;
};
