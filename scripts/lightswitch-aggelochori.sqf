
private "_lightsDamageValue";
private "_lightsBackonAfter";
private "_perimeterBasename";
private "_perimeter";
private "_bbox";
private "_xLeft";
private "_xRight";
private "_yBottom";
private "_yTop";
private "_pos";
private "_radius";
private "_lamps";


_lightsDamageValue = _this select 0;
_lightsBackonAfter = _this select 1;

_perimeterBasename = "PERIMETER_GJV_LIGHTS_OFF";
_perimeter = [_perimeterBasename] call HAYMAKER_fnc_constructPerimeter;
_bbox = [_perimeter] call HAYMAKER_fnc_calcBoundingBox;
_xLeft = (_bbox select 0) select 0;
_xRight = (_bbox select 1) select 0;
_yBottom = (_bbox select 0) select 1;
_yTop = (_bbox select 1) select 1;

_pos = [_xLeft + 0.5 * (_xRight - _xLeft),_yBottom + 0.5 * (_yTop - _yBottom),0];

_radius = nil;
if ((_xRight - _xLeft)<(_yTop - _yBottom)) then {
    _radius = (0.5*(_yTop - _yBottom))*(2^0.5);
} else {
    _radius = (0.5*(_xRight - _xLeft))*(2^0.5);
};


_lamps = nearestObjects [_pos, ["Lamps_Base_F","Land_LampDecor_F","Land_PowerPoleWooden_L_F"], _radius];
_pos = nil;

{
    private "_pos";
    private "_windingNumber";

    _pos = getPos _x;
    _windingNumber = [_perimeter,_pos] call HAYMAKER_fnc_calcWindingNumber;
    if (_windingNumber != 0) then {
        _x setHit ["light_0_hitpoint", _lightsDamageValue];
        _x setHit ["light_1_hitpoint", _lightsDamageValue];
        _x setHit ["light_2_hitpoint", _lightsDamageValue];
        _x setHit ["light_3_hitpoint", _lightsDamageValue];
        _x setHit ["light_4_hitpoint", _lightsDamageValue];
        _x setHit ["light_5_hitpoint", _lightsDamageValue];
    };

} forEach _lamps;

if (_lightsBackonAfter>0) then {

    sleep _lightsBackonAfter;
    null = [0.00,0] execVM "scripts\lightswitch-aggelochori.sqf";

};
