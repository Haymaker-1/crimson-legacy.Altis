
private "_attackOnFoot";
private "_isReady";
private "_radius";
private "_marker";
private "_trig";


_attackOnFoot = _this select 0;

sleep random 10;
TASK_MEET_AT_QUARRY setTaskState "Succeeded";
["TaskSucceeded", ["","Move to staging area"]] call BIS_fnc_showNotification;

_isReady = [player, "nzftunfr1"] execVM "scripts\unitspeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

sleep 7;

_isReady = [kostas, "vhvrxuvu1"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};


if (_attackOnFoot) then {
    _isReady = [kostas, "vhvrxuvu2"] execVM "scripts\unitradiospeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
}
else {
    _isReady = [kostas, "vhvrxuvu3"] execVM "scripts\unitradiospeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
};

null = [] execVM "scripts\spawn-casplane.sqf";

_isReady = [kostas, "vhvrxuvu4"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "vhvrxuvu5"] execVM "scripts\unitradiospeak.sqf";
waitUntil {
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_radius = 100;

"MARKER_ALPHA_SECTOR_KAVALA" setMarkerShape "ELLIPSE";
"MARKER_ALPHA_SECTOR_KAVALA" setMarkerSize [_radius,_radius];
"MARKER_ALPHA_SECTOR_KAVALA" setMarkerAlpha 0.5;
"MARKER_ALPHA_SECTOR_KAVALA" setMarkerColor "ColorWEST";
"MARKER_ALPHA_SECTOR_KAVALA" setMarkerBrush "SolidBorder";

_marker = createMarker ["MARKER_ALPHA_SECTOR_KAVALA_TEXT", getMarkerPos "MARKER_ALPHA_SECTOR_KAVALA" ];
"MARKER_ALPHA_SECTOR_KAVALA_TEXT" setMarkerShape "ICON";
"MARKER_ALPHA_SECTOR_KAVALA_TEXT" setMarkerColor "ColorBlack";
"MARKER_ALPHA_SECTOR_KAVALA_TEXT" setMarkerText "ALPHA SECTOR";
"MARKER_ALPHA_SECTOR_KAVALA_TEXT" setMarkerType "mil_dot";



"MARKER_BRAVO_SECTOR_KAVALA" setMarkerShape "ELLIPSE";
"MARKER_BRAVO_SECTOR_KAVALA" setMarkerSize [_radius,_radius];
"MARKER_BRAVO_SECTOR_KAVALA" setMarkerAlpha 0.5;
"MARKER_BRAVO_SECTOR_KAVALA" setMarkerColor "ColorWEST";
"MARKER_BRAVO_SECTOR_KAVALA" setMarkerBrush "SolidBorder";

_marker = createMarker ["MARKER_BRAVO_SECTOR_KAVALA_TEXT", getMarkerPos "MARKER_BRAVO_SECTOR_KAVALA" ];
"MARKER_BRAVO_SECTOR_KAVALA_TEXT" setMarkerShape "ICON";
"MARKER_BRAVO_SECTOR_KAVALA_TEXT" setMarkerColor "ColorBlack";
"MARKER_BRAVO_SECTOR_KAVALA_TEXT" setMarkerText "BRAVO SECTOR";
"MARKER_BRAVO_SECTOR_KAVALA_TEXT" setMarkerType "mil_dot";



"MARKER_CHARLIE_SECTOR_KAVALA" setMarkerShape "ELLIPSE";
"MARKER_CHARLIE_SECTOR_KAVALA" setMarkerSize [_radius,_radius];
"MARKER_CHARLIE_SECTOR_KAVALA" setMarkerAlpha 0.5;
"MARKER_CHARLIE_SECTOR_KAVALA" setMarkerColor "ColorWEST";
"MARKER_CHARLIE_SECTOR_KAVALA" setMarkerBrush "SolidBorder";

_marker = createMarker ["MARKER_CHARLIE_SECTOR_KAVALA_TEXT", getMarkerPos "MARKER_CHARLIE_SECTOR_KAVALA" ];
"MARKER_CHARLIE_SECTOR_KAVALA_TEXT" setMarkerShape "ICON";
"MARKER_CHARLIE_SECTOR_KAVALA_TEXT" setMarkerColor "ColorBlack";
"MARKER_CHARLIE_SECTOR_KAVALA_TEXT" setMarkerText "CHARLIE SECTOR";
"MARKER_CHARLIE_SECTOR_KAVALA_TEXT" setMarkerType "mil_dot";


"MARKER_DELTA_SECTOR_KAVALA" setMarkerShape "ELLIPSE";
"MARKER_DELTA_SECTOR_KAVALA" setMarkerSize [_radius,_radius];
"MARKER_DELTA_SECTOR_KAVALA" setMarkerAlpha 0.5;
"MARKER_DELTA_SECTOR_KAVALA" setMarkerColor "ColorWEST";
"MARKER_DELTA_SECTOR_KAVALA" setMarkerBrush "SolidBorder";

_marker = createMarker ["MARKER_DELTA_SECTOR_KAVALA_TEXT", getMarkerPos "MARKER_DELTA_SECTOR_KAVALA" ];
"MARKER_DELTA_SECTOR_KAVALA_TEXT" setMarkerShape "ICON";
"MARKER_DELTA_SECTOR_KAVALA_TEXT" setMarkerColor "ColorBlack";
"MARKER_DELTA_SECTOR_KAVALA_TEXT" setMarkerText "DELTA SECTOR";
"MARKER_DELTA_SECTOR_KAVALA_TEXT" setMarkerType "mil_dot";


_trig = createTrigger["EmptyDetector",getPos player];
_trig setTriggerArea[5,5,0,false];
_trig setTriggerActivation["ALPHA","PRESENT",false];
_trig setTriggerStatements["this", "_isReady = [player, 'nzftunfr2'] execVM 'scripts\unitspeak.sqf';waitUntil{ sleep 1; if (scriptDone _isReady) exitWith {true}; false};_wp = kavalaRifleSquadAlpha addWaypoint [getMarkerPos 'MARKER_ALPHA_SECTOR_KAVALA', 0];_wp setWaypointType 'SAD';", ""];
_trig = nil;


_trig = createTrigger["EmptyDetector",getPos player];
_trig setTriggerArea[5,5,0,false];
_trig setTriggerActivation["BRAVO","PRESENT",false];
_trig setTriggerStatements["this", "_isReady = [player, 'nzftunfr3'] execVM 'scripts\unitspeak.sqf';waitUntil{sleep 1; if (scriptDone _isReady) exitWith {true}; false};_wp = kavalaRifleSquadBravo addWaypoint [getMarkerPos 'MARKER_BRAVO_SECTOR_KAVALA', 0];_wp setWaypointType 'SAD';", ""];
_trig = nil;

_trig = createTrigger["EmptyDetector",getPos player];
_trig setTriggerArea[5,5,0,false];
_trig setTriggerActivation["CHARLIE","PRESENT",false];
_trig setTriggerStatements["this", "_isReady = [player, 'nzftunfr4'] execVM 'scripts\unitspeak.sqf';waitUntil{ sleep 1; if (scriptDone _isReady) exitWith {true}; false};_wp = kavalaRifleSquadCharlie addWaypoint [getMarkerPos 'MARKER_CHARLIE_SECTOR_KAVALA', 0];_wp setWaypointType 'SAD';", ""];
_trig = nil;

_trig = createTrigger["EmptyDetector",getPos player];
_trig setTriggerArea[5,5,0,false];
_trig setTriggerActivation["DELTA","PRESENT",false];
_trig setTriggerStatements["this", "_isReady = [player, 'nzftunfr5'] execVM 'scripts\unitspeak.sqf';waitUntil{sleep 1; if (scriptDone _isReady) exitWith {true}; false};_wp = kavalaRifleSquadDelta addWaypoint [getMarkerPos 'MARKER_DELTA_SECTOR_KAVALA', 0];_wp setWaypointType 'SAD';", ""];
_trig = nil;

TASK_ASSAULT_KAVALA = player createSimpleTask ["TASKID_ASSAULT_KAVALA"];

if (_attackOnFoot) then {
    TASK_ASSAULT_KAVALA setSimpleTaskDescription ["Assault Kavala together with four rifle squads Alpha through Delta. Use your radio to control when each squad moves into position.","Assault Kavala","Assault Kavala"];
}
else {
    TASK_ASSAULT_KAVALA setSimpleTaskDescription ["Assault Kavala using the Striders together with four rifle squads Alpha through Delta. Use your radio to control when each squad moves into position.","Assault Kavala","Assault Kavala"];
};
TASK_ASSAULT_KAVALA setTaskState "Assigned";
["TaskAssigned", ["","Assault Kavala"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_ASSAULT_KAVALA;
TASK_ASSAULT_KAVALA_HAS_BEEN_ASSIGNED = true;

{
    _x allowDamage true;
} forEach (units mortarGroup);


null = [] execVM "scripts\count-remaining-units-kavala.sqf";



if (SHOW_CHAPTER_TITLES) then {
    null = ["House to house"] execVM "scripts\show-chapter-title.sqf";
};
sleep 10;
TIME_LAST_SAVEGAME = time;
saveGame;
