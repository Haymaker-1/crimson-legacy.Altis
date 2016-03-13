
private "_man";
private "_group";
private "_iRandomPatrol";


_man = _this select 0;

_group = (group _man);
_iRandomPatrol = -1;
{
    if (_x select 0 == _group) then {
        _iRandomPatrol = _forEachIndex;
    };
} forEach RANDOM_PATROL_GROUP_HAS_ARRIVED;


// return:
_iRandomPatrol
