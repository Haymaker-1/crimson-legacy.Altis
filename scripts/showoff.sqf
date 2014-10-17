

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
        THE_CO sideChat "You break it, you buy it, son.";
		sleep (1+random 1);
		THE_CO sideChat "Now go show off your flying skills somewhere else.";
    };
};