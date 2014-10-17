

_fuelLossRate = FUEL_LOSS_RATE_WHEN_BROKEN * 3600 / helicopterFuelCapacity;  // number of full tanks per hour

_lastTimeArray = date;
_lastDayTime = daytime;

while {LITTLEBIRD_BROKEN} do 
{
    _currentTimeArray = date;
    _currentDayTime = daytime;
    
    _nHoursDifference = ((_currentTimeArray select 0) - (_lastTimeArray select 0)) * 365 * 24 + 
                        ((_currentTimeArray select 1) - (_lastTimeArray select 1)) * 30.5 * 24 + 
                        ((_currentTimeArray select 2) - (_lastTimeArray select 2)) * 24 + 
                        (_currentDayTime - _lastDayTime);
    
    if (_nHoursDifference > 0) then {
    
        _proposedFuelLevel = (fuel thehelicopter) - _fuelLossRate * _nHoursDifference;
        if (_proposedFuelLevel <0) then
        {
            _proposedFuelLevel = 0;
        };
        thehelicopter setFuel _proposedFuelLevel;
        
        _lastTimeArray = _currentTimeArray;
        _lastDayTime = _currentDayTime;
    };
    
    sleep 0.25;
}