private ["_pos1x","_pos1y","_pos2x","_pos2y","_dx","_dy","_meanPos"];

_pos1x = (_this select 0) select 0;
_pos1y = (_this select 0) select 1;
_pos2x = (_this select 1) select 0;
_pos2y = (_this select 1) select 1;

_dx = _pos2x - _pos1x;
_dy = _pos2y - _pos1y;

_meanPos = [_pos1x + (_dx/2),_pos1y + (_dy/2)];
_meanPos

