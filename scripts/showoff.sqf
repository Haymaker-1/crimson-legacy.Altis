

_vector = velocity thehelicopter;
_a = _vector select 0;
_b = _vector select 1;
_speed = (_a^2+_b^2)^0.5;
_altitude = getPos thehelicopter select 2;

_cond = (_speed > 50) AND (_altitude < 15);

if (_cond) then 
{
    sleep (3+random 2);
    if (alive thehelicopter) then
	{
        _isReady = [THE_CO, "bpxqzvmm1"] execVM "scripts\unitradiospeak.sqf";
        waitUntil{sleep 1; scriptDone _isReady};

        _isReady = [THE_CO, "bpxqzvmm2"] execVM "scripts\unitradiospeak.sqf";
        waitUntil{sleep 1; scriptDone _isReady};
        
    };
};