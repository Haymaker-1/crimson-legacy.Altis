
TASK_FIND_CRASH_SITE setTaskState "Succeeded";
["TaskSucceeded", ["","Find crash site"]] call BIS_fnc_showNotification;

sleep (15+random 5);
player sideChat "The pilot is not here, sir.";
sleep (2+random 2);
THE_CO sideChat "Dammit! Keep looking!";
sleep (2+random 2);
player sideChat "Roger. One, out.";
sleep (2+random 2);

sleep (10+random 5);
player groupChat "Does anyone have a clue how we find this guy?";
sleep (6+random 2);

if (alive sf_rifleman1) then 
{
    sf_rifleman1 groupChat "Ehm...not really. Sorry sir.";
    sleep (4+random 2);
};

sf_teamleader groupChat "We could go and ask Kostas, see what he knows.";
sleep (3+random 2);

player groupChat "I'm sorry, who is he? I don't think I know him.";
sleep (3+random 2);

_dir = [getPos sf_teamleader,getMarkerPos "MARKER_REBEL_CAMP_HELIPAD"] call HAYMAKER_fnc_calcDirectionWindrose;

sf_teamleader groupChat "Kostas is the local resistance commander. He's got a base "+_dir+" of here. Maybe his people have seen or heard something.";
sleep (6+random 2);

["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
"MARKER_REBEL_CAMP" setMarkerType "mil_dot"; 
"MARKER_REBEL_CAMP" setMarkerText "REBEL CAMP"; 


player groupChat "Allright, let's pay him a visit. Back to the helicopter!";
sleep (2+random 2);

waitUntil {player in crew thehelicopter};


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







