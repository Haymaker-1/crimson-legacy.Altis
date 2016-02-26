private "_veh";
private "_cond";
private "_wheels";
private "_condDone";
private "_radius";


_veh = _this select 0;

_cond = true;

_wheels = ["HitLFWheel", "HitRFWheel","HitLF2Wheel", "HitLMWheel", "HitRF2Wheel", "HitRMWheel"];

_condDone = false;
_radius = 1950+random 100;

while {_cond} do {

    private "_nWheelsDamaged";
    private "_truckIsMobile";
    // verify that truck works
    _nWheelsDamaged = 0;
    {
        if (_veh getHitPointDamage _x == 1.0) then {
            _nWheelsDamaged = _nWheelsDamaged + 1;
        };
    } forEach _wheels;


    _truckIsMobile = canMove _veh AND (_nWheelsDamaged == 0);


    if (!_truckIsMobile) then {

        private "_vehHasStopped";

        _vehHasStopped = [_veh] execVM "scripts\bring-vehicle-to-a-stop.sqf";
        (assignedDriver kavalaFuelTruck) sideChat "Aw, crap!";
        sleep 3;
        waitUntil {
            sleep 2;
            if (scriptDone _vehHasStopped) exitWith {true};
            false
        };
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
