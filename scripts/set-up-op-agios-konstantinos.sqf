
sleep 20;

_isReady = [player, "qjgztpnn1"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

kostas sideChat "Hello, Lieutenant, Kostas here.";
sleep 3;

_isReady = [player, "qjgztpnn2"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

kostas sideChat "That is good news! I'll send some men to hold the area.";
sleep 9;

_isReady = [player, "qjgztpnn3"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

kostas sideChat "I want you to set up a CP overlooking the Agios area. In the meantime, I'll have my men collect some of the stuff left behind in your wake, so to speak. I'll check in with you in a couple of hours, OK?";
sleep 10;

_isReady = [player, "qjgztpnn4"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

kostas sideChat "OK then. Kostas out.";
sleep 3;




TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS = createTrigger["EmptyDetector",getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS"];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS setTriggerArea[30,30,0,false];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS setTriggerActivation["WEST","PRESENT",false];
TRIGGER_SET_UP_OP_AGIOS_KONSTANTINOS setTriggerStatements["this AND TASK_SET_UP_OP_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED AND ((getPos player) distance (getMarkerPos 'MARKER_OP_AGIOS_KONSTANTINOS') < 15)","null = [] execVM 'scripts\clear-aa-magos-aa-amfissa-patrols-crash-site.sqf'",""]; 

TASK_SET_UP_OP_AGIOS_KONSTANTINOS = player createSimpleTask ["TASKID_SET_UP_OP_AGIOS_KONSTANTINOS"];
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setSimpleTaskDescription ["Set up a command post overlooking the area around <marker name='MARKER_AGIOS_KONSTANTINOS'>Agios Konstantinos</marker>.","Set up CP","Set up CP"];
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setSimpleTaskDestination (getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS");
player setCurrentTask TASK_SET_UP_OP_AGIOS_KONSTANTINOS;
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setTaskState "Assigned";
["TaskAssigned", ["","Set up CP"]] call BIS_fnc_showNotification;
TASK_SET_UP_OP_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED = true;






