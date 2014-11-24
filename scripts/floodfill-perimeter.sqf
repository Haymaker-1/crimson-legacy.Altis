

// [_markerBasename,_resolution,_fillcolor,_markerAlpha] execVM "scripts\floodfill-perimeter.sqf"


_markerBasename = _this select 0;
_resolution = _this select 1;
_fillcolor = _this select 2;
_markerAlpha = _this select 3;

_perimeter = [_markerBasename] call HAYMAKER_fnc_constructPerimeter;

_bbox = [_perimeter] call HAYMAKER_fnc_calcBoundingBox;

_xLeft = (_bbox select 0) select 0;
_xRight = (_bbox select 1) select 0;
_yBottom = (_bbox select 0) select 1;
_yTop = (_bbox select 1) select 1;

_dx = _xRight - _xLeft;
_dy = _yTop - _yBottom;


_nx = round(_dx/_resolution);
_ny = round(_dy/_resolution);


for "_ix" from 0 to (_nx - 1) do 
{
    for "_iy" from 0 to (_ny - 1) do 
    {
        _pos = [_xLeft + (_ix + 0.5) * _resolution,_yBottom + (_iy + 0.5) * _resolution];
        _windingNumber = [_perimeter,_pos] call HAYMAKER_fnc_calcWindingNumber;
        _isInside = false;
        if (_windingNumber != 0) then 
        {
            _isInside = true;
        };
        if (_isInside) then 
        {
            //player globalChat format ["DEBUG (%1):%2,%3",time,_ix,_iy];
            _markerName = format ["AREA_%1_%2_%3",_markerBasename,_ix,_iy];
            _marker = createMarker [_markerName,_pos];
            _markerName setMarkerShape "RECTANGLE";
            _markerName setMarkerSize [_resolution/2,_resolution/2];
            _markerName setMarkerColor _fillcolor;
            _markerName setMarkerAlpha _markerAlpha;
            
        };
    };  
};



