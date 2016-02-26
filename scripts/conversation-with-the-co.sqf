
private "_isReady";
private "_trig";

player createDiarySubject ["varTranscript","Conversation"];

TASK_REPORT_IN_AT_KRYA_NERA setTaskState "Succeeded";
["TaskSucceeded", ["","Report in"]] call BIS_fnc_showNotification;


_isReady = [THE_CO, "ydbdmwwk1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "feroeowf1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

["MARKER_PERIMETER_LNN_NABISCO",100,"ColorWEST",0.70] execVM "scripts\floodfill-perimeter.sqf";

"MARKER_CAMP_NABISCO" setMarkerType "mil_dot";

_isReady = [THE_CO, "ydbdmwwk5"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk6"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "feroeowf2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk7"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

["MARKER_PERIMETER_KRYA_NERA_AIRPORT_FTS",25,"ColorWEST",0.70] execVM "scripts\floodfill-perimeter.sqf";
"MARKER_HELIPORT" setMarkerType "mil_dot";

_isReady = [THE_CO, "ydbdmwwk8"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk9"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk10"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk11"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "feroeowf3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ydbdmwwk12"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

{
    _x lock 0;
} forEach (getMarkerPos "MARKER_OP_KRYA_NERA" nearObjects ["Car",30]);



_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_DESTINATION_TASK_WAIT_FOR_FUEL"];
_trig setTriggerArea[15,20,56.4208,true];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND TASK_GO_TO_THE_AIRPORT_HAS_BEEN_ASSIGNED","null = [] execVM 'scripts\radio-conversation-about-fuel-truck.sqf';",""];
_trig = nil;


TASK_GO_TO_THE_AIRPORT = player createSimpleTask ["TASKID_GO_TO_THE_AIRPORT"];
TASK_GO_TO_THE_AIRPORT setSimpleTaskDescription ["Go to the heliport SW of Krya Nera and wait for the CO's contact to deliver the fuel.","Go to the airport","Go to the airport"];
TASK_GO_TO_THE_AIRPORT setSimpleTaskDestination (getMarkerPos "MARKER_DESTINATION_TASK_WAIT_FOR_FUEL");
player setCurrentTask TASK_GO_TO_THE_AIRPORT;
TASK_GO_TO_THE_AIRPORT setTaskState "Assigned";
["TaskAssigned", ["","Go to the airport"]] call BIS_fnc_showNotification;
TASK_GO_TO_THE_AIRPORT_HAS_BEEN_ASSIGNED = true;
