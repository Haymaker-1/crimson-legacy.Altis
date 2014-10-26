
private "_theUnit";
private "_theRange";
private "_targets";
private "_target";

_theUnit = _this select 0;
_theRange = _this select 1;

while {alive _theUnit} do {

    _targets = _theUnit nearTargets _theRange;
    
    {
        _target = _x;
        if (_target select 2 == WEST) then {
            {
                _group = _x;
                {   
                    _unit =_x;
                    if (_unit == _target select 4) then {
                        if (_forEachIndex >= count MORTAR_TARGETS) then {
                            MORTAR_TARGETS resize (_forEachIndex + 1 + 5);
                        };
                        MORTAR_TARGETS set [_forEachIndex + 5,[daytime,_target select 0]];
                    };
                } forEach (units _group);
            } forEach [kavalaRifleSquadAlpha,kavalaRifleSquadBravo,kavalaRifleSquadCharlie,kavalaRifleSquadDelta];
        };
    } forEach _targets;
    
    
    sleep 15;
    
};
