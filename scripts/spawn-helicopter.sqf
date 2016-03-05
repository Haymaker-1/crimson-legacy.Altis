
diag_log format ["starting %1", _thisScript];

private "_nMinutes";
private "_usesNLitersPerSecond";

_nMinutes = 6.0;

thehelicopter = createVehicle ["B_Heli_Light_01_F",(getMarkerPos "MARKER_SPAWN_HELICOPTER"),[],0,"NONE"];

thehelicopter lockCargo [0, true];
thehelicopter lockCargo [1, true];

helicopterFuelCapacity = 242; // liters ?
helicopterFuelConsumptionRate = 0.0368; // nTanks per minute?

thehelicopter lock 2;
thehelicopter setDir random 360;

clearWeaponCargo thehelicopter;
clearItemCargo thehelicopter;
clearMagazineCargo thehelicopter;

_usesNLitersPerSecond = (helicopterFuelConsumptionRate * helicopterFuelCapacity) / 60;

thehelicopter setFuel (_nMinutes * 60 * _usesNLitersPerSecond) / helicopterFuelCapacity;

FUEL_LOSS_RATE_WHEN_BROKEN = 2.68; // liters per second

TRIGGER_BREAK_IT_BUY_IT triggerAttachVehicle [thehelicopter];

waitUntil{
    sleep 5;
    if (TASK_LOAD_FUEL_HAS_BEEN_ASSIGNED) exitWith {true};
    false
};


thehelicopter lock 0;

// add helicopter-based end conditions:
null = [] execVM "scripts\endmission-helicopter-damaged.sqf";
null = [] execVM "scripts\endmission-helicopter-out-of-fuel.sqf";
null = [] execVM "scripts\endmission-helicopter-rebelcamp.sqf";


diag_log format ["%1: done", _thisScript];
