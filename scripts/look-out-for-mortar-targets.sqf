
private "_spotterUnit";
private "_spottingRange";
private "_spotterSide";
private "_targets";
private "_target";
private "_targetPos";
private "_targetSide";
private "_targetUnit";
private "_unit";

_spotterUnit = _this select 0;
_spottingRange = _this select 1;

_spotterSide = side _spotterUnit;

while {alive _spotterUnit AND LOOKOUT_FOR_MORTAR_TARGETS} do {
    _targets = _spotterUnit nearTargets _spottingRange;
    {
        _target = _x;
        _targetPos  = _target select 0;
        _targetSide = _target select 2;
        _targetUnit = _target select 4;
        if (_targetSide != _spotterSide && _targetSide != CIVILIAN ) then {
            {
                _unit = _x;
                if (_unit == _targetUnit) then {
                    if (_forEachIndex >= count MORTAR_TARGETS) then {
                        MORTAR_TARGETS resize (_forEachIndex + 1);
                    };
                    MORTAR_TARGETS set [_forEachIndex,[daytime,_targetPos]];
                };
            } forEach (units group player);
        };
    } forEach _targets;
    sleep 15;
};
