

// spawn pilot and guards

null = [] execVM "scripts\spawn-pilot.sqf";
_otherGroup = createGroup east;
"O_Soldier_TL_F" createUnit [(getMarkerPos "MARKER_SPAWN_PILOT"),_otherGroup,"_pos = getPos this; _pos set [2,2.0]; this setPos _pos;this removeWeapon 'NVGoggles_OPFOR';",0.5,"CORPORAL"];

null = [] execVM "scripts\spawn-fireteam1.sqf";
sleep 5;

if ((random 1.0) < 0.5) then {
    null = [] execVM "scripts\spawn-fireteam2.sqf";
    sleep 5;
};
null = [] execVM "scripts\spawn-fireteam3.sqf";
sleep 5;



_dx = ((getPos thehelicopter) select 0) - ((getPos kostas) select 0);
_dy = ((getPos thehelicopter) select 1) - ((getPos kostas) select 1);

kostas disableAI "MOVE";
kostas disableAI "ANIM";
kostas setVectorDir [_dx,_dy,0];
kostas action ["salute",kostas];
kostas sideChat "Welcome, friends!";
waitUntil {((getPos player) distance (getPos kostas)) < 4};
kostas enableAI "MOVE";
kostas enableAI "ANIM";


TASK_MEET_KOSTAS setTaskState "Succeeded";
["TaskSucceeded", ["","Meet Kostas"]] call BIS_fnc_showNotification;

// ask about our pilot
player sideChat "Hello sir. I was wondering if you have any information about a plane crash just south of here. The pilot is MIA.";
sleep (4+random 2);

// kostas hasnt heard anything because he hasnt had contact for a few days already
kostas sideChat "I'm sorry, I can't help you with that.";
sleep (4+random 2);

kostas sideChat "Christos may know more, he likes to hunt in that area.";
sleep (4+random 2);

player sideChat "How do we reach him?";
sleep (2+random 2);

kostas sideChat "He lives near Kore, just a short hop by helicopter.";
sleep (4+random 2);

player sideChat "Yeah, well... it seems our helicopter is out for the moment. It started losing fuel like crazy all of a sudden.";
sleep (5+random 2);

// but we brought radios
sf_teamleader groupChat "Perhaps we could use the new radios we brought?";
sleep (4+random 2);
OUTLIVED_HIS_USEFULNESS set [0,true];

player sideChat "Of course! I totally forgot about those. We brought you some radios.";

// unload radios

suitcase1 setPos (thehelicopter modelToWorld [-2,2.3,-1.4]);
suitcase2 setPos (thehelicopter modelToWorld [-2,2.0,-1.4]);
deleteVehicle suitcase3;
_posSuitcase3 = (thehelicopter modelToWorld [-4,4,-1.4]);
suitcase3 = createVehicle ["Land_SatellitePhone_F",_posSuitcase3,[],0,"NONE"];
suitcase3 setPos _posSuitcase3;
_dx2 = ((getPos thehelicopter) select 0) - (_posSuitcase3 select 0);
_dy2 = ((getPos thehelicopter) select 1) - (_posSuitcase3 select 1);
suitcase3 setVectorDir [_dx2,_dy2,0];
_posRadioFiddle = suitcase3 modelToWorld [0,-1,0];

SUITCASES_LOADED = false;

_wp = (group kostas) addWaypoint [_posRadioFiddle,0];
_wp setWaypointCompletionRadius 0;
 

sleep 7;

_dx3 = (_posSuitcase3 select 0) - (_posRadioFiddle select 0);
_dy3 = (_posSuitcase3 select 1) - (_posRadioFiddle select 1);

kostas setPos _posRadioFiddle;

kostas disableAI "MOVE";
kostas disableAI "ANIM";
kostas setVectorDir [_dx3,_dy3,0];
kostas playAction "SitDown";

// kostas gets on radio
sleep (1+random 2);

kostas sideChat "I'll try to raise Christos.";
sleep (2+random 2);

kostas sideChat "Christos, are you there?";
sleep (10+random 2);

christos globalChat "...Kostas, is that you?";
sleep (3+random 2);

kostas sideChat "Yes, some friends brought us radios!";
sleep (3+random 2);

christos globalChat "Great!";
sleep (2+random 2);

kostas sideChat "Listen, did you hear anything about a plane crash?";
sleep (5+random 2);

christos globalChat "Yeah, I saw the whole thing!";
sleep (2+random 2);

christos globalChat "I was out hunting rabbits, then all of a sudden this plane got shot out of the sky.";
sleep (7+random 2);

christos globalChat "Pilot made it out OK, but he was captured later by a CSAT patrol.";
sleep (5+random 2);

christos globalChat "They took him to where Sofia used to live. You remember her?";
sleep (5+random 2);

kostas sideChat "Yes, I remember.";
sleep (2+random 2);

kostas sideChat "OK, thanks Christos.";
sleep (3+random 2);

christos globalChat "Bye!";
sleep (2+random 2);

// kostas gets info from a hunter; hunter identifies location where the pilot is kept and number of guards

kostas enableAI "MOVE";
kostas enableAI "ANIM";
deleteVehicle christos;

// borrow some of kostas' men
sleep (2+random 2);
kostas sideChat "So it looks like the pilot is being held just west of Syrta.";
sleep (3+random 2);
kostas sideChat "I'll mark Sofia's house on your map.";
"MARKER_CAPTURED_PILOT_LOCATION" setMarkerType "mil_dot";
sleep (3+random 2);

kostas sideChat "Feel free to use the ATVs or the truck if you want.";
sleep (5+random 2);
player sideChat "Thanks, that'd be great.";


{
    _x lock 0;
} forEach (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD" nearObjects ["B_G_Offroad_01_F", 100]);
{
    _x lock 0;
} forEach (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD" nearObjects ["B_G_Quadbike_01_F", 100]);  


TASK_FREE_PILOT = player createSimpleTask ["TASKID_FREE_PILOT"];
TASK_FREE_PILOT setSimpleTaskDescription ["We received information that the pilot is being held at a house just west of Syrta. We should go to the house as quickly as possible to free the pilot before CSAT relocate him to a more secure location.","Free the pilot","Free the pilot"];
player setCurrentTask TASK_FREE_PILOT;
TASK_FREE_PILOT setTaskState "Assigned";
["TaskAssigned", ["","Free the pilot"]] call BIS_fnc_showNotification;
TASK_FREE_PILOT_HAS_BEEN_ASSIGNED = true;

TRIGGER_STATUS_UPDATE = createTrigger["EmptyDetector",getMarkerPos "MARKER_REBEL_CAMP_HELIPAD"];
TRIGGER_STATUS_UPDATE setTriggerArea[150,150,0,false];
TRIGGER_STATUS_UPDATE triggerAttachVehicle [player];
TRIGGER_STATUS_UPDATE setTriggerActivation["VEHICLE","NOT PRESENT",false];
TRIGGER_STATUS_UPDATE setTriggerStatements["this", "null = [] execVM 'scripts\spawn-convoy.sqf';null = [] execVM 'scripts\radio-conversation-status-update.sqf'",""]; 

// spotter near Gravia airport notifies kostas of an enemy convoy leaving in westerly direction


waitUntil{sleep 5;CONVOY_HAS_REACHED_LAKKA};

waitUntil {sleep 5;EVERYBODY_IS_DONE_TALKING};
EVERYBODY_IS_DONE_TALKING = false;


kostas sideChat "Ehm...hello?";
sleep (3+random 3);

player sideChat "Hi there, Kostas. What's up?";
sleep (4+random 2);

kostas sideChat "I just got word from a spotter near the airport that a convoy has left Gravia Airbase heading west. Thought you'd like to know.";
sleep (5+random 2);

player sideChat "Yeah, I half expected that they would send somebody.";
sleep (4+random 2);

kostas sideChat "I'll ask Christos to be on the lookout. If they are coming this way, they'll probably pass by him.";
sleep (3+random 3);

player sideChat "Thanks for the update. Delta One, out.";
sleep (4+random 3);

EVERYBODY_IS_DONE_TALKING = true;



waitUntil{sleep 5;CONVOY_HAS_REACHED_KORE};



if (CAN_ASSIGN_DESTROY_CONVOY_VEHICLES) then {

    waitUntil {sleep 5;EVERYBODY_IS_DONE_TALKING};
    EVERYBODY_IS_DONE_TALKING = false;

    kostas sideChat "Kostas here. Christos just called me to say that the convoy is passing through Kore at the moment. There are three vehicles in the convoy. One truck and two MRAPs.";
    sleep (15 + random 3);

    kostas sideChat "This is a great opportunity! If there is any chance at all you can ambush the convoy and destroy their vehicles, that would be good for us. But be careful!";
    sleep (8 + random 3);

    kostas sideChat "Eh...Kostas out.";
    sleep (2+random 2);

    player sideChat "Roger your last. Thanks, Kostas.";
    sleep (6+random 3);

    EVERYBODY_IS_DONE_TALKING = true;


    TASK_DESTROY_CONVOY_VEHICLES = player createSimpleTask ["TASKID_DESTROY_CONVOY_VEHICLES"];
    TASK_DESTROY_CONVOY_VEHICLES setSimpleTaskDescription ["A convoy of three vehicles is coming to secure the pilot. Mounting a surprise attack and destroying the convoy vehicles would help our cause. Tempting as it is, this objective is only secondary to getting the pilot back safely.","Destroy vehicles","Destroy vehicles"];
    TASK_DESTROY_CONVOY_VEHICLES setTaskState "Created";
    ["TaskCreated", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
    TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED = true;

};



