

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
    
    
// paste into a file 'fuelstation-feed-objects.sqf'
    