sleep 3; 
suitcase1 setPos [0,0,-100]; 
suitcase2 setPos [1,0,-100]; 
suitcase3 setPos [0,1,-100]; 
SUITCASES_LOADED = true;  

_isReady = [THE_CO, "ozjytbcl1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

TASK_PICK_UP_RADIOS setTaskState "Succeeded"; 
["TaskSucceeded", ["","Pick up radios"]] call BIS_fnc_showNotification; 
TASK_DELIVER_RADIOS setTaskState "Assigned";  
["TaskAssigned", ["","Deliver radios"]] call BIS_fnc_showNotification; 
player setCurrentTask TASK_DELIVER_RADIOS;