
private "_chosen";
private "_dir";
private "_helipads";
private "_helipad";
private "_marker";
private "_pos";
private "_s";
private "_lightPos";
private "_lightColor";
private "_lightBrightness";

_s = "_helipads = " + loadFile "data\helipads-nabisco.sqf";
call compile _s;

_chosen = [_helipads] call HAYMAKER_fnc_selectWeightedRandom;

_pos = _chosen select 0;
_dir = _chosen select 1;

_marker = createMarker ["MARKER_NABISCO_HELIPAD",_pos];
"MARKER_NABISCO_HELIPAD" setMarkerDir _dir;

_helipad = createVehicle ["Land_HelipadSquare_F", _pos, [], 0, "CAN_COLLIDE"];
_helipad setDir _dir;

_lightPos = _pos;
_lightColor = [0.5, 0.0, 1.0];
_lightBrightness = 0.20;
null = [_lightPos, _lightColor, _lightBrightness] execVM "scripts\create-light.sqf";
