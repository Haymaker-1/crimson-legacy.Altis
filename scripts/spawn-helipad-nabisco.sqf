

private "_chosen";
private "_dir";
private "_helipads";
private "_helipad";
private "_marker";
private "_pos";
private "_s";
private "_chemlight";


_s = "_helipads = " + loadFile "data\helipads-nabisco.sqf";
call compile _s;

_chosen = [_helipads] call HAYMAKER_fnc_selectWeightedRandom;

_pos = _chosen select 0;
_dir = _chosen select 1;

_marker = createMarker ["MARKER_NABISCO_HELIPAD",_pos];

_chemlight = createVehicle ["chemlight_yellow", _pos, [], 7.0, "CAN_COLLIDE"];
_helipad = createVehicle ["Land_HelipadSquare_F", _pos, [], 0, "CAN_COLLIDE"];
_helipad setDir _dir;

