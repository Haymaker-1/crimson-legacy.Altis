
private ["_perimeter","_bbox","_xLeft","_xRight","_yBottom","_yTop","_dx","_dy","_pos","_isInside","_windingNumber"];


_perimeter = _this select 0;

_bbox = [_perimeter] call HAYMAKER_fnc_calcBoundingBox;

_xLeft = (_bbox select 0) select 0;
_xRight = (_bbox select 1) select 0;
_yBottom = (_bbox select 0) select 1;
_yTop = (_bbox select 1) select 1;

_dx = _xRight - _xLeft;
_dy = _yTop - _yBottom;

_pos = [0,0]; // to avoid scope issues
_isInside = false;


while {!_isInside} do
{
    _pos = [_xLeft + (random _dx),_yBottom + (random _dy)];
    _windingNumber = [_perimeter,_pos] call HAYMAKER_fnc_calcWindingNumber;
    if (_windingNumber != 0) then 
    {
        _isInside = true;
    };
};

_pos resize 3;
_pos set [2,0];

// return 
_pos


