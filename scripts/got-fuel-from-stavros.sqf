TASK_LOAD_FUEL setTaskState "Succeeded";
["TaskSucceeded", ["","Refuel"]] call BIS_fnc_showNotification; 
sleep (10+random 10); 

_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_KRYA_NERA_HELIPAD"];
_trig setTriggerArea[2500,2500,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND TASK_PICK_UP_RADIOS_HAS_BEEN_ASSIGNED AND ((getPos thehelicopter) distance (getMarkerPos 'MARKER_KRYA_NERA_HELIPAD') < 2500)","null = [] execVM 'scripts\radio-conversation-when-returning-from-athira.sqf';",""]; 



TASK_PICK_UP_RADIOS =  player createSimpleTask ["TASKID_PICK_UP_RADIOS"];          
TASK_PICK_UP_RADIOS setSimpleTaskDescription ["Pick up the radios at OP Krya Nera.","Pick up radios","Pick up radios"];
TASK_PICK_UP_RADIOS setSimpleTaskDestination (getMarkerPos "MARKER_KRYA_NERA_HELIPAD");           
player setCurrentTask TASK_PICK_UP_RADIOS;           
TASK_PICK_UP_RADIOS setTaskState "Assigned";  

["TaskAssigned", ["","Pick up radios"]] call BIS_fnc_showNotification; 
TASK_PICK_UP_RADIOS_HAS_BEEN_ASSIGNED = true;  

sleep (4 + random 3);                                  

TASK_DELIVER_RADIOS =  player createSimpleTask ["TASKID_DELIVER_RADIOS"];          
TASK_DELIVER_RADIOS setSimpleTaskDescription ["Deliver the radios to Camp Nabisco.","Deliver radios","Deliver radios"]; 
TASK_DELIVER_RADIOS setSimpleTaskDestination (getMarkerPos "MARKER_NABISCO_HELIPAD");           
TASK_DELIVER_RADIOS setTaskState "Created";  

["TaskCreated", ["","Deliver radios"]] call BIS_fnc_showNotification; 
TASK_DELIVER_RADIOS_HAS_BEEN_ASSIGNED = true;

_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_CAMP_NABISCO"];
_trig setTriggerArea[3500,3500,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND SUITCASES_LOADED AND TASK_DELIVER_RADIOS_HAS_BEEN_ASSIGNED","null = [] execVM 'scripts\spawn-and-crash-wipeout.sqf';",""]; 

