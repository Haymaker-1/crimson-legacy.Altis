

private "_s";
private "_pos";
private "_dir";
private "_hellcatCanLand";
private "_marker";

_s = loadFile "data\helipads-nabisco.sqf";
_s = "NABISCO_HELIPADS = " + _s;

call compile _s;

_pos = nil;
_dir = nil;
_hellcatCanLand = false;
while {!_hellcatCanLand} do {

    private "_chosen";
    _chosen = [NABISCO_HELIPADS] call HAYMAKER_fnc_selectWeightedRandom;

    _pos = _chosen select 0;
    _dir = _chosen select 1;
    _hellcatCanLand = _chosen select 2;

};

_marker = createMarker ["MARKER_NABISCO_HELIPAD",_pos];

"chemlight_yellow" createVehicle _pos;
"Land_HelipadSquare_F" createVehicle _pos;

