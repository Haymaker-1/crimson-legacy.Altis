
sleep (5+random 5);

null = [] execVM "scripts\spawn-fireteam-crash-site.sqf";

thewipeout = createVehicle ["B_Plane_CAS_01_F",(getMarkerPos "MARKER_SPAWN_DOOMED_PLANE"),[],0,"FLYING"];
thewipeout setPos [getPos thewipeout select 0,getPos thewipeout select 1,250]; 
thewipeout setDamage 1;
thewipeout setDir 45;
thewipeout setVelocity [(vectorDir thewipeout select 0)*(0 + random 100),(vectorDir thewipeout select 1)*(0 + random 100),(vectorDir thewipeout select 2)*0];

null = [] spawn {
    _doWait = true;
    while {_doWait} do
    {

        _altWipeout = (getPos thewipeout) select 2;
        _doWait = _altWipeout > 2.0;
        if (!_doWait) then
        {
            sleep 10;
            _craterWipeout = createVehicle ["CraterLong",getPos thewipeout,[],0,"CAN_COLLIDE"];
            _craterWipeout setDir (getDir thewipeout);
        };
        sleep 5;
    };
};

   
THE_CO sideChat "All units, be advised, we have a pilot down.";
sleep (2+random 2);
   
THE_CO sideChat "I say again, we have a pilot down.";
sleep (2+random 2);
   
THE_CO sideChat "Standby for update.";
sleep (1+random 2); 

sleep (8);

THE_CO sideChat "Delta One, come in.";
sleep (1+random 2); 

player sideChat "This is One, over.";
sleep (1+random 2); 

THE_CO sideChat "Are you at Nabisco yet?";
sleep (1+random 2); 

player sideChat "Couple of minutes out.";
sleep (1+random 2); 

THE_CO sideChat "One of our Wipeouts just went down. We are still figuring out where exactly.";
sleep (3+random 2); 

THE_CO sideChat "Standby at Nabisco until further notice.";
sleep (3+random 2); 

player sideChat "Roger that.";
sleep (1+random 2); 

THE_CO sideChat "Delta Actual, out.";
sleep (1+random 2); 

player removeSimpleTask TASK_DELIVER_RADIOS; 

TASK_WAIT_AT_NABISCO = player createSimpleTask ["Wait at Nabisco"];
TASK_WAIT_AT_NABISCO setSimpleTaskDestination (getMarkerPos "MARKER_NABISCO_HELIPAD");
TASK_WAIT_AT_NABISCO setSimpleTaskDescription ["We just got news that one of our planes went down. The CO ordered me to stand by at Nabisco until they have more information about the pilot's whereabouts.","Wait at Nabisco","Wait at Nabisco"];
TASK_WAIT_AT_NABISCO setTaskState "Assigned";
["TaskAssigned", ["","Wait at Nabisco"]] call BIS_fnc_showNotification;
TASK_WAIT_AT_NABISCO_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_WAIT_AT_NABISCO;



waitUntil {sleep 1; (taskState TASK_WAIT_AT_NABISCO) == "Succeeded"};

sleep (30+random 10);

THE_CO sideChat "Delta One, come in, over.";
sleep (2+random 2); 

player sideChat "Go ahead, Actual.";
sleep (2+random 2); 

"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerType "mil_dot"; 
"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerText "DISTRESS SIGNAL"; 

THE_CO sideChat "We see a distress signal north of Kore. Looks like the pilot made it out in time.";

sleep (4+random 2); 

player sideChat "Glad to hear it, sir. What do we do now?";
sleep (3+random 2); 

THE_CO sideChat "We need to get in there on the double before CSAT forces show up.";
sleep (5+random 2); 

THE_CO sideChat "I'm assigning the Special Forces team from Camp Nabisco to you. Take them to the crash site and see if you can get eyes on the pilot.";
sleep (5+random 2); 

[sf_teamleader,sf_marksman1,sf_rifleman1,sf_atman] joinSilent (group player);
(group player) selectLeader player;

null = [] spawn {
    waitUntil{
        sleep 5;
        sf_teamleader in crew thehelicopter;
    };
    sf_teamleader allowDamage true;
};
null = [] spawn {
    waitUntil{
        sleep 5;
        sf_marksman1 in crew thehelicopter;
    };
    sf_marksman1 allowDamage true;
};
null = [] spawn {
    waitUntil{
        sleep 5;
        sf_rifleman1 in crew thehelicopter;
    };
    sf_rifleman1 allowDamage true;
};
null = [] spawn {
    waitUntil{
        sleep 5;
        sf_atman in crew thehelicopter;
    };
    sf_atman allowDamage true;
};

TASK_FIND_CRASH_SITE = player createSimpleTask ["Find crash site"];
TASK_FIND_CRASH_SITE setSimpleTaskDescription ["The pilot enabled his <marker name='MARKER_PILOT_DISTRESS_SIGNAL'>distress signal</marker>. The captain has given me command of Nabisco's SF team. We need to find the crash site before CSAT forces get there and take our guy captive.","Find crash site","Find crash site"];
TASK_FIND_CRASH_SITE setTaskState "Assigned";
["TaskAssigned", ["","Find crash site"]] call BIS_fnc_showNotification;
TASK_FIND_CRASH_SITE_HAS_BEEN_ASSIGNED = true;
player setCurrentTask TASK_FIND_CRASH_SITE;

TRIGGER_WATCH_FOR_SMOKE = createTrigger["EmptyDetector",getPos thehelicopter];
TRIGGER_WATCH_FOR_SMOKE setTriggerArea[150,150,0,false];
TRIGGER_WATCH_FOR_SMOKE triggerAttachVehicle [player];
TRIGGER_WATCH_FOR_SMOKE setTriggerActivation["VEHICLE","NOT PRESENT",false];
TRIGGER_WATCH_FOR_SMOKE setTriggerStatements["this", "sleep (random 5); player groupChat 'Everybody, keep your eyes peeled for smoke!';",""]; 

TRIGGER_I_SEE_SMOKE = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_I_SEE_SMOKE setTriggerArea[3000,3000,0,false];
TRIGGER_I_SEE_SMOKE triggerAttachVehicle [player];
TRIGGER_I_SEE_SMOKE setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_I_SEE_SMOKE setTriggerStatements["this AND ((getPos thehelicopter select 2) > 30)","sleep (random 5); player groupChat format ['I see smoke to our %1!',([getPos player, getPos thewipeout] call HAYMAKER_fnc_calcDirectionWindrose)];",""]; 

TRIGGER_CRASH_SITE_FOUND = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_CRASH_SITE_FOUND setTriggerArea[250,250,0,false];
TRIGGER_CRASH_SITE_FOUND triggerAttachVehicle [player];
TRIGGER_CRASH_SITE_FOUND setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CRASH_SITE_FOUND setTriggerStatements["this","null = [] execVM 'scripts\radio-conversation-crash-site-found.sqf'",""]; 



