


null = [] spawn {
    
    waitUntil {
        sleep 1;
        if (!(player in crew thehelicopter)) exitWith {true};
        false
    };
    thehelicopter setFuel 0.00;

};


null = [] spawn {
    
    waitUntil {
        sleep 1;
        if (((getPos thehelicopter select 2) < 0.1)) exitWith {true};
        false
    };
    sleep random 3;
    thehelicopter setFuel 0.00;

};



null = [] spawn {
    
    _nTitanLongMagsRemaining = 0;
    _maximumAltitude = 17 + random 20;
    
    while {fuel thehelicopter > 0.00} do {
    
        if ((getPos thehelicopter select 2) < _maximumAltitude) then {
            
            AA_MAGOS setAmmo ["missiles_titan",0];
        } 
        else {
  
            AA_MAGOS setAmmo ["missiles_titan",4];
            
        };

        sleep 1.00;
        
    };
    
    // add titans
    AA_MAGOS setAmmo ["missiles_titan",4];
    
};




sleep (random 2);

_aliveGroupUnits = [];

{
    if (alive _x) then 
    {   
        _aliveGroupUnits = _aliveGroupUnits + [_x];
    };
} forEach (units (group player));

_randomSpeaker = _aliveGroupUnits select (floor (random (count _aliveGroupUnits)));

if ((count _aliveGroupUnits) == 1) then 
{
    _randomSpeaker groupChat "I smell fuel. That can't be good.";
};

if ((count _aliveGroupUnits) == 2) then 
{
    _randomSpeaker groupChat "Do you smell fuel?";
} 
else 
{
    _randomSpeaker groupChat "Does anyone else smell fuel?";
};

sleep (random 4);

LITTLEBIRD_BROKEN = true;
playSound "fuelrateAlarm";
null = [] execVM "scripts\break-helicopter.sqf";

sleep 4;

player groupChat "O shit, we're losing fuel!";

sleep 4;

sf0 groupChat "We can make it to the rebel camp!";

sleep 5;

sf0 groupChat "Just make sure to stay close to the ground to avoid the AA locking on to us.";










