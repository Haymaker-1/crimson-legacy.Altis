
private "_theUnit";
private "_theRange";
private "_targets";
private "_target";

_theUnit = _this select 0;
_theRange = _this select 1;

while {alive _theUnit AND LOOKOUT_FOR_MORTAR_TARGETS} do {
    _targets = _theUnit nearTargets _theRange;
    {
        if (_x select 2 == WEST) then {
            _target = _x;
            {   
                if (_x == _target select 4) then {
                    if (_forEachIndex >= count MORTAR_TARGETS) then {
                        MORTAR_TARGETS resize (_forEachIndex + 1);
                    };
                    MORTAR_TARGETS set [_forEachIndex,[daytime,_target select 0]];
                };
            } forEach (units group player);
        };
    } forEach _targets;
    sleep 15;
};
