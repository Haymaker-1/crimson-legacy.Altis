

private "_wp";
private "_grp";

demoSpecialist disableAI "MOVE";
demoSpecialist disableAI "ANIM";
demoSpecialist playAction "Crouch";
sleep 4;
ied1 = createMine ["IEDUrbanBig_F",(getMarkerPos "MARKER_POWERPLANT_IED1"),[],0];
demoSpecialist playAction "Up";
demoSpecialist enableAI "ANIM";
demoSpecialist enableAI "MOVE";


_grp = group demoSpecialist;
_wp = _grp addWaypoint [getMarkerPos "MARKER_POWERPLANT_IED2", 3];
[_grp,3] setWaypointType "MOVE";
[_grp,3] setWaypointSpeed "NORMAL";
[_grp,3] setWaypointStatements ["true", "null = [] execVM 'scripts\place-ied2-near-powerplant.sqf'"];

waitUntil {
    sleep 1;
    if ((demoSpecialist distance ied1) > 35) exitWith {true};
    false
};
demoSpecialist sideChat "Be advised, I just put an IED on the south side of the bridge.";
"MARKER_POWERPLANT_IED1" setMarkerType "mil_warning";
IED1_HAS_BEEN_ACTIVATED = true;
