
private "_pos1x";
private "_pos1y";
private "_pos2x";
private "_pos2y";
private "_dx";
private "_dy";
private "_degrees";
private "_ix";
private "_dir";


_pos1x = (_this select 0) select 0;
_pos1y = (_this select 0) select 1;
_pos2x = (_this select 1) select 0;
_pos2y = (_this select 1) select 1;

_dx = _pos2x - _pos1x;
_dy = _pos2y - _pos1y;

_degrees = (360 + (_dx atan2 _dy)) % 360;

_ix = round (_degrees / 45);

_dir = switch (_ix) do {
    case 0: { "north" };
    case 1: { "northeast" };
    case 2: { "east" };
    case 3: { "southeast" };
    case 4: { "south" };
    case 5: { "southwest" };
    case 6: { "west" };
    case 7: { "northwest" };
    case 8: { "north" };
    default { hint format ["_ix = %1", _ix] };
};

_dir
