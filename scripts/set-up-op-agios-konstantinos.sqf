
sleep 20;

_isReady = [player, "qjgztpnn1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "tlmntqjb1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "qjgztpnn2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "tlmntqjb2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "qjgztpnn3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "tlmntqjb3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "qjgztpnn4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "tlmntqjb4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};



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






