

private "_arr";
private "_n";
private "_swapped";
private "_j";
private "_idx";
private "_out";


_arr = _this select 0;

_n = count _arr;
_swapped = true;
_j = 1;

_idx = [];
_idx resize _n;
for "_i" from 0 to (_n - 1) do {
    _idx set [_i, _i];
};

while {_swapped} do {

    _swapped = false;
    _j = _j + 1;

    for "_i" from 0 to (_n - _j) do {
        if (_arr select _i > _arr select (_i + 1)) then {
            private "_tmp";
            _tmp = _arr select _i;
            _arr set [_i, _arr select (_i + 1)];
            _arr set [_i + 1, _tmp];

            _tmp = _idx select _i;
            _idx set [_i, _idx select (_i + 1)];
            _idx set [_i + 1,_tmp];

            _swapped = true;
        };
    };
};

_out = [_arr, _idx];

_out
