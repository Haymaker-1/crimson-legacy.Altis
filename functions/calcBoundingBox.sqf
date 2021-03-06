
private "_perimeter";
private "_n";
private "_minx";
private "_maxx";
private "_miny";
private "_maxy";
private "_bbox";

_perimeter = _this select 0;
_n = count _perimeter;

_minx = _perimeter select 0 select 0;
_maxx = _minx;
_miny = _perimeter select 0 select 1;
_maxy = _miny;


for "_i" from 0 to (_n - 1) do {

    private "_thisx";
    private "_thisy";

    _thisx = _perimeter select _i select 0;
    _thisy = _perimeter select _i select 1;

    if (_thisx < _minx) then {
        _minx = _thisx;
    };
    if (_thisx > _maxx) then {
        _maxx = _thisx;
    };
    if (_thisy < _miny) then {
        _miny = _thisy;
    };
    if (_thisy > _maxy) then {
        _maxy = _thisy;
    };
};


_bbox = [[_minx, _miny], [_maxx, _maxy]];

_bbox
