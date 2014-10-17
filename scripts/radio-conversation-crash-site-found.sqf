player sideChat "Delta Actual, come in, over.";
sleep (2+random 2);
THE_CO sideChat "Go ahead, Delta One.";
sleep (2+random 2);

TASK_FIND_CRASH_SITE setTaskState "Succeeded";
["TaskSucceeded", ["","Find crash site"]] call BIS_fnc_showNotification;

player sideChat "Captain, we found the crash site.";
sleep (3+random 2);
THE_CO sideChat "Check the vicinity of the wreck. Do you see the pilot?";
sleep (7+random 2);
player sideChat "Wait one.";
sleep (2+random 2);

deleteVehicle TRIGGER_I_SEE_SMOKE;

TRIGGER_CRASH_SITE_NO_PILOT = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_CRASH_SITE_NO_PILOT setTriggerArea[50,50,0,false];
TRIGGER_CRASH_SITE_NO_PILOT triggerAttachVehicle [player];
TRIGGER_CRASH_SITE_NO_PILOT setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CRASH_SITE_NO_PILOT setTriggerStatements["this AND !(player in crew thehelicopter)","null = [] execVM 'scripts\radio-conversation-pilot-not-here.sqf'",""]; 
