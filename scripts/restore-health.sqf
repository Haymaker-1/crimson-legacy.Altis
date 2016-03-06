


private "_restore_health_rate";
private "_lastDateTime";
private "_factors";


_restore_health_rate = 1/4; // one health restore takes 4 hours

_lastDateTime = [date select 0,date select 1,date select 2,dayTime];

_factors = [365*24, 30.5*24, 24, 1];


while {alive player} do {
    private "_currentDateTime";
    private "_damage";
    private "_nHoursDifference";

    _currentDateTime = [date select 0,date select 1,date select 2,dayTime];

    _damage = damage player;

    _nHoursDifference = 0;

    for "_i" from 0 to 3 do {
        private "_a";
        private "_b";
        private "_c";

        _a = _currentDateTime select _i;
        _b = _lastDateTime select _i;
        _c = _factors select _i;
        _nHoursDifference = _nHoursDifference + (_a - _b) *_c;
    };

    if (_nHoursDifference > 0 ) then {

        private "_proposedDamage";

        _proposedDamage = _damage - _restore_health_rate * _nHoursDifference;

        if (_proposedDamage < 0) then {
            _proposedDamage = 0;
        };

        player setDamage _proposedDamage;
    };

    _lastDateTime = _currentDateTime;

    sleep 10;
};

