

_veh = _this select 0;

_cond = true;

_wheels = ["HitLFWheel", "HitRFWheel","HitLF2Wheel", "HitLMWheel", "HitRF2Wheel", "HitRMWheel"];

_condDone = false;
_radius = 1950+random 100;

while {_cond} do {

    // verify that truck works
    _nWheelsDamaged = 0; 
    {
        if (_veh getHitPointDamage _x == 1.0) then {
            _nWheelsDamaged = _nWheelsDamaged + 1; 
        };
    } forEach _wheels;
    

    _truckIsMobile = canMove _veh AND (_nWheelsDamaged == 0);

    
    if (!_truckIsMobile) then {
    
        _vehHasStopped = [_veh] execVM "scripts\bring-vehicle-to-a-stop.sqf";
        (assignedDriver kavalaFuelTruck) sideChat "Aw, crap!";
        sleep 3;
        waitUntil { scriptDone _vehHasStopped};
        null = [] execVM "scripts\walk-to-quarry.sqf";
        _condDone = true;
    } else {

        if ((getMarkerPos "MARKER_CHRISTOS_HOUSE" distance getPos kavalaFuelTruck) < _radius) then {
            null = [] execVM "scripts\drive-fuel-truck-to-christos-house.sqf";
            _condDone = true;
        };
    };

    _cond = _truckIsMobile AND !_condDone;
    
    sleep 1;
    
};

