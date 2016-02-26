// get fuel station locations first using 'recordFuelStationLocations.sqf'

private "_s";
private "_pos";

_s = loadFile "data\fuelstation-feed-objects.sqf";
_s = "FUEL_STATION_FEED_LOCATIONS=" + _s;

call compile _s;

{
    _pos = _x;
    _pos set [2,0];
    (_pos nearestObject "Land_fs_feed_F") setFuelCargo 0.0;
} forEach FUEL_STATION_FEED_LOCATIONS;
