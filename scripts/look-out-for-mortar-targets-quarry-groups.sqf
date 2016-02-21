
private "_theUnit";
private "_theRange";
private "_targets";
private "_target";
private "_targetSide";
private "_spotterSide";
private "_unit";
private "_group";
private "_index";

_theUnit = _this select 0;
_theRange = _this select 1;

_spotterSide = side _theUnit;

while {alive _theUnit AND LOOKOUT_FOR_MORTAR_TARGETS} do {
    _targets = _theUnit nearTargets _theRange;
    {
        _target = _x;
        _targetSide = _target select 2;
        if (_targetSide != _spotterSide && _targetSide != CIVILIAN ) then {
            _index = 0;
            {
                _group = _x;
                {
                    _unit = _x;
                    _index = _index + 1;
                    if (_unit == _target select 4) then {
                        if (_index >= count MORTAR_TARGETS) then {
                            MORTAR_TARGETS resize (_index + 1);
                        };
                        MORTAR_TARGETS set [_index,[daytime,_target select 0]];
                    };
                } forEach (units _group);
            } forEach [group player, kavalaRifleSquadAlpha, kavalaRifleSquadBravo,kavalaRifleSquadCharlie, kavalaRifleSquadDelta];
        };
    } forEach _targets;
    sleep 15;
};
