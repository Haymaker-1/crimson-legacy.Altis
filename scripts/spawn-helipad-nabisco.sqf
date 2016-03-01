

private "_chosen";
private "_dir";
private "_helipads";
private "_marker";
private "_pos";
private "_s";


_s = "_helipads = " + loadFile "data\helipads-nabisco.sqf";
call compile _s;

_chosen = [_helipads] call HAYMAKER_fnc_selectWeightedRandom;

_pos = _chosen select 0;
_dir = _chosen select 1;

_marker = createMarker ["MARKER_NABISCO_HELIPAD",_pos];

"chemlight_yellow" createVehicle _pos;
"Land_HelipadSquare_F" createVehicle _pos;
