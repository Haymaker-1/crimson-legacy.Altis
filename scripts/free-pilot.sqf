pilot enableAI "MOVE";
pilot enableAI "ANIM";
pilot setCaptive false;
[pilot] joinSilent (group player);
TASK_FREE_PILOT setTaskState "Succeeded";
["TaskSucceeded", ["","Free the pilot"]] call BIS_fnc_showNotification;

player removeAction ACTION_FREE_PILOT;
deleteVehicle TRIGGER_ADDACTION_FREE_PILOT;

sleep (10+ random 4);

TASK_MOVE_PILOT_TO_REBEL_CAMP = player createSimpleTask ["TASKID_MOVE_PILOT_TO_REBEL_CAMP"];
TASK_MOVE_PILOT_TO_REBEL_CAMP setSimpleTaskDescription ["Make sure the pilot makes it back safely to the rebel camp.","Return to rebel camp","Return to rebel camp"];
TASK_MOVE_PILOT_TO_REBEL_CAMP setTaskState "Created";
["TaskCreated", ["","Return to rebel camp"]] call BIS_fnc_showNotification;
TASK_MOVE_PILOT_TO_REBEL_CAMP_HAS_BEEN_ASSIGNED = true;


TRIGGER_PILOT_REACHED_REBEL_CAMP = createTrigger["EmptyDetector",getMarkerPos "MARKER_REBEL_CAMP_HELIPAD"];
TRIGGER_PILOT_REACHED_REBEL_CAMP setTriggerArea[25,25,0,false];
TRIGGER_PILOT_REACHED_REBEL_CAMP triggerAttachVehicle [player];
TRIGGER_PILOT_REACHED_REBEL_CAMP setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_PILOT_REACHED_REBEL_CAMP setTriggerStatements["this AND TASK_MOVE_PILOT_TO_REBEL_CAMP_HAS_BEEN_ASSIGNED AND (((getPos player) distance (getPos pilot))<50)","null = [] execVM 'scripts\pilot-has-reached-rebel-camp.sqf';",""]; 

