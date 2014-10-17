pilotGroup = createGroup west;
"B_Pilot_F" createUnit [(getMarkerPos "MARKER_SPAWN_PILOT"),pilotGroup,"pilot = this;this disableAI 'MOVE';this disableAI 'ANIM';_pos = getPos this; _pos set [2,2.0]; this setPos _pos;this setDir 205;this playAction 'SitDown'; this setCaptive true; removeBackpack this;removeAllWeapons this; removeHeadgear this",0.5,"LIEUTENANT"];  




TRIGGER_ADDACTION_FREE_PILOT = createTrigger["EmptyDetector",getPos pilot];
TRIGGER_ADDACTION_FREE_PILOT setTriggerArea[2,2,0,false];
TRIGGER_ADDACTION_FREE_PILOT triggerAttachVehicle [player];
TRIGGER_ADDACTION_FREE_PILOT setTriggerActivation["VEHICLE","PRESENT",true];
TRIGGER_ADDACTION_FREE_PILOT setTriggerStatements["this","null = [] execVM 'scripts\addaction-free-pilot.sqf';","null = [] execVM 'scripts\removeaction-free-pilot.sqf';"]; 

TRIGGER_ADDACTION_FREE_PILOT attachTo [pilot];