

private "_trig";

TASK_MEET_STRIDERS setTaskState "Succeeded";
["TaskSucceeded", ["","Hook up with Striders"]] call BIS_fnc_showNotification;

(crew krya_nera_strider_gmg) joinSilent group player;
(crew krya_nera_strider_hmg) joinSilent group player;

TASK_MEET_AT_QUARRY = player createSimpleTask ["TASKID_MEET_AT_QUARRY"];
TASK_MEET_AT_QUARRY setSimpleTaskDescription ["Lead the convoy of Striders through the hills east of Kavala, and meet up with the rifle squads that are already present at the <marker name='MARKER_STAGING_AREA_QUARRY'>staging area</marker>.","Move to staging area","Move to staging area"];
TASK_MEET_AT_QUARRY setSimpleTaskDestination (getMarkerPos "MARKER_STAGING_AREA_QUARRY");
TASK_MEET_AT_QUARRY setTaskState "Assigned";
["TaskAssigned", ["","Move to staging area"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_MEET_AT_QUARRY;
HAYMAKER_GLOBALS setVariable ["TASK_MEET_AT_QUARRY_HAS_BEEN_ASSIGNED", true];


_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_STAGING_AREA_QUARRY"];
_trig setTriggerArea[111,111,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND HAYMAKER_GLOBALS getVariable 'TASK_MEET_AT_QUARRY_HAS_BEEN_ASSIGNED'","null = [false] execVM 'scripts\assault-kavala.sqf';",""];
_trig = nil;
