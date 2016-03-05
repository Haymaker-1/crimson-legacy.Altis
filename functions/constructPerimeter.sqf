

private "_perimeterBasename";
private "_n";
private "_perimeter";
private "_nElems";

_perimeterBasename = _this select 0;
_n = count (toArray _perimeterBasename);
_perimeter = [];

{
	private "_a";
	private "_str";
    _a = toArray _x;
    _a resize _n;
    _str = toString (_a);
    
    if (_str == _perimeterBasename) then {
		private "_nElems";
        _nElems = count _perimeter;
        _perimeter resize (_nElems + 1);
        _perimeter set [_nElems, _x];
    };
} forEach allMapMarkers;

_nElems = count _perimeter;
for "_i" from 0 to (_nElems - 1) do {
    _perimeter set [_i, getMarkerPos (_perimeter select _i)];
};

// close the polygon:
_perimeter resize (_nElems + 1);
_perimeter set [_nElems, _perimeter select 0];

// return:
_perimeter

