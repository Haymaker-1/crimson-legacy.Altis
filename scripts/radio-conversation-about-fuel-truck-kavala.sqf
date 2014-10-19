
player sideChat "Wow, a fuel truck!";

sleep 5;

player sideChat "Delta One for Kostas, come in.";

sleep 4;

kostas sideChat "Go ahead, One.";

sleep 4;

player sideChat "There's a fuel truck in the motor pool. I say again, I've located a fuel truck in the motor pool!";

sleep 12;

kostas sideChat "That's huge! But does it have any fuel in it?";

sleep 4;

kavalaFuelTruck lock false;

waitUntil {sleep 5;player in crew kavalaFuelTruck;};

kavalaFuelTruck allowDamage true;

null = [kavalaFuelTruck] execVM "scripts\monitor-kavala-fuel-truck-status.sqf";

player sideChat "It is full! I'm gonna try sneak this baby out of here.";

sleep 5;

kostas sideChat "OK, we can hide the truck at Christos' house in Kore. I'll notify him immediately.";



TASK_STEAL_KAVALA_FUEL_TRUCK = player createSimpleTask ["TASKID_STEAL_KAVALA_FUEL_TRUCK"];
TASK_STEAL_KAVALA_FUEL_TRUCK setSimpleTaskDescription ["Steal the fuel truck from the Kavala motor pool and drive it to <marker name = 'MARKER_CHRISTOS_HOUSE'>Christos' house</marker> in Kore.","Steal fuel truck","Steal fuel truck"];
TASK_STEAL_KAVALA_FUEL_TRUCK setSimpleTaskDestination (getMarkerPos "MARKER_CHRISTOS_HOUSE");
TASK_STEAL_KAVALA_FUEL_TRUCK setTaskState "Assigned";
["TaskAssigned", ["","Steal fuel truck"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_STEAL_KAVALA_FUEL_TRUCK;
TASK_STEAL_KAVALA_FUEL_TRUCK_HAS_BEEN_ASSIGNED = true;




