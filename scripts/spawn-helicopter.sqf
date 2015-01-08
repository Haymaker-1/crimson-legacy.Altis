
_nMinutes = 6.0;

_prob = [["littlebird",0.5],
         ["hellcat",0.5]];
         
         
// force littlebird:         
_heloType = [_prob,0] call HAYMAKER_fnc_selectWeightedRandom;

if (_heloType == "littlebird") then
{

    // littlebird
    thehelicopter = createVehicle ["B_Heli_Light_01_F",(getMarkerPos "MARKER_SPAWN_HELICOPTER"),[],0,"NONE"];
    
    thehelicopter lockCargo [0, true];
    thehelicopter lockCargo [1, true];
    
    helicopterFuelCapacity = 242; // liters ?
    helicopterFuelConsumptionRate = 0.0368; // nTanks per minute?
    
    
};

if (_heloType == "hellcat") then {

    // hellcat
    thehelicopter = createVehicle ["I_Heli_light_03_unarmed_F",(getMarkerPos "MARKER_SPAWN_HELICOPTER"),[],0,"NONE"];

    helicopterFuelCapacity = 1000; // liters ?
    helicopterFuelConsumptionRate = 0.01; // nTanks per minute?
    
};
thehelicopter lock 2;
thehelicopter setDir random 360;

clearWeaponCargo thehelicopter;
clearItemCargo thehelicopter;
clearMagazineCargo thehelicopter;

_usesNLitersPerSecond = (helicopterFuelConsumptionRate * helicopterFuelCapacity)/60;

thehelicopter setFuel (_nMinutes * 60 * _usesNLitersPerSecond)/helicopterFuelCapacity;

FUEL_LOSS_RATE_WHEN_BROKEN = 2.68; // liters per second

TRIGGER_BREAK_IT_BUY_IT triggerAttachVehicle [thehelicopter];



waitUntil{sleep 5;TASK_LOAD_FUEL_HAS_BEEN_ASSIGNED};

thehelicopter lock 0;

