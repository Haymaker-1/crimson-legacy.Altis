// get fuel station locations first using 'recordFuelStationLocations.sqf'

diag_log format ["starting %1", __FILE__];

private "_s";
private "_pos";
private "_locations";

_s = "_locations = " + loadFile "data\fuelstation-feed-objects.sqf";
call compile _s;

{
    _pos = _x;
    _pos set [2,0];
    (_pos nearestObject "Land_fs_feed_F") setFuelCargo 0.0;
} forEach _locations;


diag_log format ["%1: done", __FILE__];
