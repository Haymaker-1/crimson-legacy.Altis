


_veh = _this select 0;
_duration = _this select 1;

if (isnil "_duration") then {
    _duration = 15;
};

_startTime = time;
_endTime = _startTime + _duration;

_velocityStart = velocity _veh;
_hSpeedStart = sqrt ((_velocityStart select 0) ^ 2 + (_velocityStart select 1) ^ 2);
_fuelLevel = fuel _veh;

while {(time < _endTime) OR (count crew _veh > 0)}  do {

    
    _durationFraction = (_endTime - time)/_duration;
    if (_durationFraction < 0) then {
        _durationFraction = 0;
        _veh setFuel 0;
    };
    _hSpeedAdvised = _durationFraction * _hSpeedStart;
    _dir = getDir _veh;
    
    _newVector = [_hSpeedAdvised * sin (_dir), _hSpeedAdvised * cos (_dir), 0];
    
    _veh setVelocity _newVector;
    
    sleep 0.01;
    
};

_veh lock 2;
_veh engineOn false;


