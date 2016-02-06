
TASK_FIND_CRASH_SITE setTaskState "Succeeded";
["TaskSucceeded", ["","Find crash site"]] call BIS_fnc_showNotification;

sleep (15+random 5);
_isReady = [player, "xmocpdll1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [THE_CO, "xqxqpdkj1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "xmocpdll2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1; 
    if (scriptDone _isReady) exitWith {true};
    false
};

sleep (10+random 5);
if (count units group player >= 3) then {
    player groupChat "Does anyone have a clue how we find this guy?";
    sleep (6+random 2);
}
else {
    player groupChat "Do you have any idea how we find this guy?";
    sleep (6+random 2);
};


_speaker = nil;
{
    _x allowDamage false;
    if (alive _x) exitWith {_speaker = _x};
} forEach [sf0,sf1,sf2,sf3];

_speaker groupChat "We could go and ask Kostas, see what he knows.";
sleep (3+random 2);

player groupChat "I'm sorry, who is he? I don't think I know him.";
sleep (3+random 2);

_speaker groupChat "Kostas is the local resistance commander. He's got a base near here. Maybe his people have seen or heard something.";
sleep (6+random 2);

{
    _x allowDamage true;
} forEach [sf0,sf1,sf2,sf3];


["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
"MARKER_REBEL_CAMP" setMarkerType "mil_dot"; 
"MARKER_REBEL_CAMP" setMarkerText "REBEL CAMP"; 


player groupChat "Allright, let's pay him a visit. Back to the helicopter!";
sleep (2+random 2);



TASK_BACK_TO_HELICOPTER = player createSimpleTask ["Go back to the helicopter"];
TASK_BACK_TO_HELICOPTER setSimpleTaskDescription ["Go back to the helicopter.","Go back to the helicopter","Go back to the helicopter"];
TASK_BACK_TO_HELICOPTER setTaskState "Assigned";
["TaskAssigned", ["","Go back to the helicopter"]] call BIS_fnc_showNotification;
TASK_BACK_TO_HELICOPTER_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_BACK_TO_HELICOPTER;




waitUntil {
    sleep 1;
    _thecrew = crew thehelicopter;
    _theunits = units group player;
    _allAboard = true;

    {
        if !(_x in _thecrew) then {
            _allAboard = false;
        };
    } forEach _theunits;
    
    if (_allAboard) exitWith {true};
    false
};

["TaskSucceeded", ["","Go back to the helicopter"]] call BIS_fnc_showNotification;
TASK_BACK_TO_HELICOPTER setTaskState "Succeeded";

sleep 10 + random 2;


TASK_MEET_KOSTAS = player createSimpleTask ["Meet Kostas"];
TASK_MEET_KOSTAS setSimpleTaskDestination (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
TASK_MEET_KOSTAS setSimpleTaskDescription ["There's no sign of the pilot near the crash site. The special forces guys know the local resistance commander, Kostas. He has a <marker name='MARKER_REBEL_CAMP'>camp</marker> northwest of the crash site. We are meeting him to see if his people have seen or heard something.","Meet Kostas","Meet Kostas"];
TASK_MEET_KOSTAS setTaskState "Assigned";
["TaskAssigned", ["","Meet Kostas"]] call BIS_fnc_showNotification;
TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_MEET_KOSTAS;

TRIGGER_I_SMELL_FUEL = createTrigger["EmptyDetector",getMarkerPos "MARKER_REBEL_CAMP_HELIPAD"];
TRIGGER_I_SMELL_FUEL setTriggerArea[1000,1000,0,false];
TRIGGER_I_SMELL_FUEL triggerAttachVehicle [thehelicopter];
TRIGGER_I_SMELL_FUEL setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_I_SMELL_FUEL setTriggerStatements["this AND TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED AND player in crew thehelicopter AND (getPos thehelicopter select 2 > 2.0)","null = [] execVM 'scripts\conversation-smell-fuel.sqf'",""]; 

TRIGGER_LANDED_AT_REBEL_CAMP = createTrigger["EmptyDetector",getMarkerPos "MARKER_REBEL_CAMP_HELIPAD"];
TRIGGER_LANDED_AT_REBEL_CAMP setTriggerArea[15,15,0,false];
TRIGGER_LANDED_AT_REBEL_CAMP triggerAttachVehicle [thehelicopter];
TRIGGER_LANDED_AT_REBEL_CAMP setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_LANDED_AT_REBEL_CAMP setTriggerStatements["this AND TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED AND (((getPos thehelicopter) select 2) < 0.25)","null = [] execVM 'scripts\landed-at-rebel-camp.sqf'",""]; 







