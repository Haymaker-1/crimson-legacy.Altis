
_character = _this select 0;
_makeInvincible = _this select 1;

if (isnil "_makeInvincible") then {
    _makeInvincible = true;
};

while {alive _character} do {

    _character allowDamage (!_makeInvincible);
    _character enableFatigue (!_makeInvincible);

    if (_makeInvincible) then {
        _character setDamage 0;
        _character setFatigue 0;
    };

    sleep 60;

};