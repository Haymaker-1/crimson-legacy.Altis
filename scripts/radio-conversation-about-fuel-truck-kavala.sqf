
_isReady = [player, "lqauupuc1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "lqauupuc2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "ltmhcxwt1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "lqauupuc3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "ltmhcxwt2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

kavalaFuelTruck lock false;

waitUntil {
    sleep 5;
    if (player in crew kavalaFuelTruck) exitWith {true};
    false
};

kavalaFuelTruck allowDamage true;

null = [kavalaFuelTruck] execVM "scripts\monitor-kavala-fuel-truck-status.sqf";

_isReady = [player, "lqauupuc4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "ltmhcxwt3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};


TASK_STEAL_KAVALA_FUEL_TRUCK = player createSimpleTask ["TASKID_STEAL_KAVALA_FUEL_TRUCK"];
TASK_STEAL_KAVALA_FUEL_TRUCK setSimpleTaskDescription ["Steal the fuel truck from the Kavala motor pool and drive it to <marker name = 'MARKER_CHRISTOS_HOUSE'>Christos' house</marker> in Kore.","Steal fuel truck","Steal fuel truck"];
TASK_STEAL_KAVALA_FUEL_TRUCK setSimpleTaskDestination (getMarkerPos "MARKER_CHRISTOS_HOUSE");
TASK_STEAL_KAVALA_FUEL_TRUCK setTaskState "Assigned";
["TaskAssigned", ["","Steal fuel truck"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_STEAL_KAVALA_FUEL_TRUCK;
TASK_STEAL_KAVALA_FUEL_TRUCK_HAS_BEEN_ASSIGNED = true;




