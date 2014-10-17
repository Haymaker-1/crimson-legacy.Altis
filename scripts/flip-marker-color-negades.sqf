
_basenameArr = toArray("AREA_MARKER_PERIMETER_KLD_NEGADES");
_n = count _basenameArr;

{

    _arr = toArray(_x);
    _arr resize _n;
    
    _stringsAreEqual = true;
    
    for "_i" from 0 to _n-1 do 
    {
        if ((_arr select _i) != (_basenameArr select _i)) then
        {
            _stringsAreEqual = false;
        };
    };
    
    if (_stringsAreEqual) then 
    {
        _x setMarkerColor "ColorGUER";
    };

} forEach allMapMarkers;

