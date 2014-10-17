
private ["_pos1x","_pos1y","_pos2x","_pos2y","_dx","_dy","_degrees"];


_pos1x = (_this select 0) select 0;
_pos1y = (_this select 0) select 1;
_pos2x = (_this select 1) select 0;
_pos2y = (_this select 1) select 1;

_dx = _pos2x - _pos1x;
_dy = _pos2y - _pos1y;

_degrees = (360 + (_dx atan2 _dy))%360;

_degrees