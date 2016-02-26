

private "_basenameStr";
private "_theColor";
private "_basenameArr";
private "_n";

_basenameStr = _this select 0;
_theColor = _this select 1;


_basenameArr = toArray(_basenameStr);
_n = count _basenameArr;

{

    private "_arr";
    private "_stringsAreEqual";

    _arr = toArray(_x);
    _arr resize _n;

    _stringsAreEqual = true;

    for "_i" from 0 to _n-1 do {
        if ((_arr select _i) != (_basenameArr select _i)) then {
            _stringsAreEqual = false;
        };
    };

    if (_stringsAreEqual) then {
        _x setMarkerColor _theColor;
    };

} forEach allMapMarkers;
