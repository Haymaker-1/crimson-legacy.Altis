
POWER_PLANT_CLEARED = true;

waitUntil{sleep 5;POWER_PLANT_SEIZED};

deleteVehicle TRIGGER_POWER_PLANT_CLEARED;
deleteVehicle TRIGGER_POWER_PLANT_SEIZED;


_isReady = [player, "zdgzzloy1"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

kostas sideChat "Go ahead, One.";

sleep 4;

_isReady = [player, "zdgzzloy2"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

kostas sideChat "Good work, I'll make the call. He'll be there in a couple of minutes. He promised to bring you explosives as well, so check his truck while he's preparing the ambush.";

sleep 8;

kostas sideChat "Did you manage to rig the transformer?";

sleep 5;

if ('DemoCharge_Remote_Mag' in magazines player) then {
    _isReady = [player, "zdgzzloy3"] execVM "scripts\unitspeak.sqf";
    waitUntil{sleep 1; scriptDone _isReady};

}
else {
    _isReady = [player, "zdgzzloy4"] execVM "scripts\unitspeak.sqf";
    waitUntil{sleep 1; scriptDone _isReady};
};


kostas sideChat "Roger that. Kostas out.";

null = [] execVM "scripts\spawn-negades-demo-specialist.sqf";

sleep 10;

POWER_PLANT_CAN_PLACE_EXPLOSIVES = true;


// GUER specialist moves in
_wp = demoSpecialistGroup addWaypoint [getMarkerPos "MARKER_WP_DEMO_SPECIALISTS_DISEMBARK", 1];
[demoSpecialistGroup,1] setWaypointType "MOVE";
[demoSpecialistGroup,1] setWaypointCompletionRadius 50;
[demoSpecialistGroup,1] setWaypointSpeed "LIMITED";
[demoSpecialistGroup,1] setWaypointBehaviour "CARELESS";
[demoSpecialistGroup,1] setWaypointStatements ["true", "null = [] execVM 'scripts\add-waypoints-demo-specialist.sqf'"];
demoSpecialistGroup setCurrentWaypoint [demoSpecialistGroup, 1];

waitUntil{sleep 5; "DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects transformer) select 0)]};


TASK_SEIZE_POWER_PLANT setTaskState "Succeeded";
["TaskSucceeded", ["","Seize power plant"]] call BIS_fnc_showNotification;


