
private "_host";
private "_caller";
private "_id";

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_host removeAction _id;

GPS_TRACKING_IS_ON = !GPS_TRACKING_IS_ON;

if (GPS_TRACKING_IS_ON) then {
    _caller addAction ["Disable GPS tracking","scripts\toggle-gpstracking.sqf",nil,0,false];
} else {
    _caller addAction ["Enable GPS tracking","scripts\toggle-gpstracking.sqf",nil,0,false];
};

