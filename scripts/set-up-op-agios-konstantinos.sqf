
sleep 20 + random 30;

player sideChat "Kostas, this is Delta One, come in please.";
sleep 5+random 5;

kostas sideChat "Hello, Lieutenant, Kostas here.";
sleep 3+random 3;

player sideChat "Agios Konstantinos and Negades are now under our control, sir.";
sleep 6 + random 3;

kostas sideChat "That is good news! I'll send some men to hold the area.";
sleep 9 + random 3;

player sideChat "What's next, sir?";
sleep 4 + random 2;

kostas sideChat "I want you to set up a CP overlooking the Agios area. In the meantime, I'll have my men collect some of the stuff left behind in your wake, so to speak. I'll check in with you in a couple of hours, OK?";
sleep 10 + random 3;

player sideChat "Sounds good to me, sir."; 
sleep 4 + random 3;

kostas sideChat "OK then. Kostas out.";
sleep 3 + random 2;




TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS = createTrigger["EmptyDetector",getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS"];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS setTriggerArea[30,30,0,false];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS triggerAttachVehicle [player];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS setTriggerStatements["this AND TASK_SET_UP_OP_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED","null = [] execVM 'scripts\clear-aa-magos-aa-amfissa-patrols-crash-site.sqf'",""]; 

TASK_SET_UP_OP_AGIOS_KONSTANTINOS = player createSimpleTask ["TASKID_SET_UP_OP_AGIOS_KONSTANTINOS"];
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setSimpleTaskDescription ["Set up a command post overlooking the area around <marker name='MARKER_AGIOS_KONSTANTINOS'>Agios Konstantinos</marker>.","Set up CP","Set up CP"];
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setSimpleTaskDestination (getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS");
player setCurrentTask TASK_SET_UP_OP_AGIOS_KONSTANTINOS;
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setTaskState "Assigned";
["TaskAssigned", ["","Set up CP"]] call BIS_fnc_showNotification;
TASK_SET_UP_OP_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED = true;






