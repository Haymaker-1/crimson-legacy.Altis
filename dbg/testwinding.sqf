
_markerBaseStr = "MARKER_PERIMETER_FKS_KAVALA_";
_centerPos = getMarkerPos "MARKER_PERIMETER_FKS_KAVALA_8";
_radius = 1000;
_nMarkers = 1000;




_perimeter = [_markerBaseStr] call HAYMAKER_fnc_constructPerimeter;
_iMarker = 0;



while {_iMarker<_nMarkers} do {

    _pos = [(_centerPos select 0) - _radius/2 + random _radius,
            (_centerPos select 1) - _radius/2 + random _radius,
            (_centerPos select 2)];

    _markerName = format["MARKER_TEST_WINDING_%1",_iMarker];
    _marker = createMarker[_markerName,_pos];
    _markerName setMarkerType "mil_dot";
    _markerName setMarkerSize [0.5,0.5];
    
    _windingNumber = [_perimeter,_pos] call HAYMAKER_fnc_calcWindingNumber;

    if (_windingNumber == 0) then {
        _markerName setMarkerColor "ColorRed";
    }
    else {
        _markerName setMarkerColor "ColorGreen";
    };
    
    _iMarker = _iMarker + 1;
    player sideChat format ["%1",_iMarker];
};

_nChar = 0;
{
    _str = _markerBaseStr;
    _isEq = [_str,_x,count toArray _str] call HAYMAKER_fnc_strcmpn;
    if (_isEq) then {
        _nChar = _nChar + 1;
        player sideChat format ["%1:%2",_nChar,_x];
    };
} forEach allMapMarkers;
