

private "_pos";
private "_approximateMapSize";
private "_listOfObjects";
private "_fuelStationIDs";
private "_i";




_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_approximateMapSize = 50000;

_listOfObjects = nearestObjects [_pos,["Land_fs_feed_F"],_approximateMapSize];

_fuelStationIDs = [];
_fuelStationIDs resize 100;
_i = 0;
{
    _fuelStationIDs set [_i,getPos _x];
    _i = _i + 1;
} forEach _listOfObjects;

_fuelStationIDs resize _i;

copyToClipboard (str (_fuelStationIDs));
// paste into file 'fuelstation-feed-objects.sqf'
