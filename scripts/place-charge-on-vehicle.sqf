

private "_veh";
private "_nMinutesBoom";
private "_placementOffset";
private "_placementVectorDir";
private "_placementVectorUp";
private "_trig";
private "_bomb";
private "_dateOfPlacement";
private "_addSeconds";
private "_ticking";
private "_boom";

_veh = _this select 0;
_nMinutesBoom = _this select 1;
_placementOffset = _this select 2;
_placementVectorDir = _this select 3;
_placementVectorUp = _this select 4;

player removeAction ACTION_ATTACH_EXPLOSIVES;
_trig = nearestObject [_veh,"EmptyDetector"];
detach _trig;
deleteVehicle _trig;

player removeMagazine "DemoCharge_Remote_Mag";



_bomb = createVehicle ["DemoCharge_Remote_Ammo" ,getPos player,[],0,"NONE"];
_bomb attachTo [_veh,_placementOffset];
_bomb setVectorUp _placementVectorUp;
_bomb setVectorDir _placementVectorDir;

_dateOfPlacement = dateToNumber date;
_addSeconds = (daytime * 3600) % 60;


_ticking = true;

while {_ticking} do {
    private "_dateNow";
    private "_nMinutes";

    sleep 1;

    _dateNow = dateToNumber date;

    _nMinutes = (_dateNow - _dateOfPlacement) * 365 * 24 * 60 + 1;

    if (_nMinutes>=_nMinutesBoom) then {
        private "_secondsHand";
        _secondsHand = (daytime * 3600) % 60;
        if (_secondsHand>=_addSeconds) then {
            _ticking = false;
        };
    };
};

_veh allowDamage true;

_boom = createVehicle ["Bo_Mk82" ,getPos _bomb,[],0,"NONE"];
_boom = createVehicle ["Bo_Mk82" ,getPos _bomb,[],0,"NONE"];

{
    if (side _x == EAST) then {
        (group _x) setBehaviour "COMBAT";
    };
} forEach (getPos _bomb nearObjects ["Man", 1000]);

{
    {
        if (side _x == EAST) then {
            (group _x) setBehaviour "COMBAT";
        };
    } forEach (crew _x);
} forEach (getPos _bomb nearEntities [["Car","Tank"], 1000]);


if (!alive _veh) then {
    private "_vehicleType";
    private "_addRatingValue";
    _vehicleType = typeOf _veh;
    _addRatingValue = [_vehicleType] call HAYMAKER_fnc_addRatingValue;
    player addRating _addRatingValue;
};

sleep 1;
deleteVehicle _bomb;
