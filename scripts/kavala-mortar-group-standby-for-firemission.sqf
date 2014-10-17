

MORTAR_TARGETS = [];

private "_targetAge";
private "_targetAgeMax";
private "_nShells";
private "_spread";
private "_pos";
private "_iShell";

_targetAgeMax = 5*60; // seconds

while {true} do {

    {
        if (!isNil "_x") then {
        
            _targetAge = time - (_x select 0);
            
            if (_targetAge < _targetAgeMax) then {
                _spread = 50 + (_targetAge/_targetAgeMax) * 200;
                _nShells = 5 + random 2;
                for "_iShell" from 0 to (_nShells - 1) do {
                    
                    _pos = [(_x select 1 select 0) - _spread/2 + random _spread, (_x select 1 select 1) - _spread/2 + random _spread, 20];
                    
                    mortarGunner doArtilleryFire [_pos,"8Rnd_82mm_Mo_Flare_white",1];  
                    mortar1 addMagazine ["8Rnd_82mm_Mo_Flare_white",1];
                    sleep 2;
                };
            };
        };
    } forEach MORTAR_TARGETS;
    sleep 30 + random 30;
};
