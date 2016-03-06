
private "_pilotGroup";
private "_pos";


_pilotGroup = createGroup west;
pilot = _pilotGroup createUnit ["B_Pilot_F", getMarkerPos "MARKER_SPAWN_PILOT", [], 0, "NONE"];

pilot disableAI "MOVE";
pilot disableAI "ANIM";
_pos = getPos pilot;
_pos set [2,2.0];
pilot setPos _pos;
pilot setDir 205;
pilot playAction "SitDown";
pilot setCaptive true;
removeBackpack pilot;
removeAllWeapons pilot;
removeHeadgear pilot;
{
    pilot unassignItem _x;
    pilot removeItem _x;
} forEach assignedItems pilot;


null = [] execVM "scripts\endmission-pilot-died.sqf";

TRIGGER_ADDACTION_FREE_PILOT = createTrigger["EmptyDetector",getPos pilot];
TRIGGER_ADDACTION_FREE_PILOT setTriggerArea[2,2,0,false];
TRIGGER_ADDACTION_FREE_PILOT triggerAttachVehicle [player];
TRIGGER_ADDACTION_FREE_PILOT setTriggerActivation["VEHICLE","PRESENT",true];
TRIGGER_ADDACTION_FREE_PILOT setTriggerStatements["this","null = [] execVM 'scripts\addaction-free-pilot.sqf';","null = [] execVM 'scripts\removeaction-free-pilot.sqf';"];

TRIGGER_ADDACTION_FREE_PILOT attachTo [pilot];
