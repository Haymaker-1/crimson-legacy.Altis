
private "_wp";
private "_grp";




demoSpecialist disableAI "MOVE";
demoSpecialist disableAI "ANIM";
demoSpecialist playAction "Crouch";
sleep 4;
ied2 = createMine ["IEDUrbanBig_F",(getMarkerPos "MARKER_POWERPLANT_IED2"),[],0];
demoSpecialist playAction "Up";
demoSpecialist enableAI "ANIM";
demoSpecialist enableAI "MOVE";

_grp = group demoSpecialist;
_wp = _grp addWaypoint [getMarkerPos "MARKER_WP_DEMO_SPECIALISTS_DISEMBARK", 4];
[_grp,4] setWaypointType "MOVE";
[_grp,4] setWaypointSpeed "NORMAL";
[_grp,4] setWaypointStatements ["true", "null = [] execVM 'scripts\arm-ieds-powerplant.sqf'"];


waitUntil {
    sleep 1;
    if ((demoSpecialist distance ied2) > 35) exitWith {true};
    false
};
demoSpecialist sideChat "Be advised, there is an IED on the access road to the southeast of the power plant.";
"MARKER_POWERPLANT_IED2" setMarkerType "mil_warning";
