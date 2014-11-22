

player sideChat "Delta Actual, come in, over.";
sleep (2+random 2);


_isReady = [THE_CO, "rxbbzszc1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "Captain, we are near the crash site.";
sleep (3+random 2);

_isReady = [THE_CO, "rxbbzszc2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "Wait one.";
sleep (2+random 2);

deleteVehicle TRIGGER_I_SEE_SMOKE;

TRIGGER_CRASH_SITE_NO_PILOT = createTrigger["EmptyDetector",getPos thewipeout];
TRIGGER_CRASH_SITE_NO_PILOT setTriggerArea[50,50,0,false];
TRIGGER_CRASH_SITE_NO_PILOT triggerAttachVehicle [player];
TRIGGER_CRASH_SITE_NO_PILOT setTriggerActivation["VEHICLE","PRESENT",false];
TRIGGER_CRASH_SITE_NO_PILOT setTriggerStatements["this AND !(player in crew thehelicopter)","null = [] execVM 'scripts\radio-conversation-pilot-not-here.sqf'",""]; 
