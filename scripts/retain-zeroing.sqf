
private "_weapons";
private "_optics";
private "_distances";
private "_curWeapon";
private "_curOptics";
private "_curDistance";

_weapons = [];
_optics = [];
_distances = [];

_curWeapon = nil;
_curOptics = nil;
_curDistance = nil;


while {true} do {

    _curWeapon = currentWeapon player;
    _curDistance = currentZeroing player;

    {
        private "_weapon";
        _weapon = _x select 0;
        if (_weapon == _curWeapon) then {
            _curOptics = _x select 3;
        };
    } forEach WeaponsItems player;

    if !(_curWeapon in _weapons) then {
        private "_n";
        _n = count _weapons;

        _weapons resize _n + 1;
        _optics resize _n + 1;
        _distances resize _n + 1;

        _weapons set [_n,_curWeapon];
        _optics set [_n,_curOptics];
        _distances set [_n,_curDistance];
    };
};
