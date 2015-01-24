

demoSpecialist disableAI "MOVE";
demoSpecialist disableAI "ANIM";
demoSpecialist playAction "Crouch";
sleep 4;
ied2 = createMine ["IEDUrbanBig_F",(getMarkerPos "MARKER_POWERPLANT_IED2"),[],0];
demoSpecialist enableAI "MOVE"; 
demoSpecialist enableAI "ANIM";



_wp = demoSpecialistGroup addWaypoint [getMarkerPos "MARKER_WP_DEMO_SPECIALISTS_DISEMBARK", 4];

[demoSpecialistGroup,4] setWaypointType "MOVE";
[demoSpecialistGroup,4] setWaypointSpeed "NORMAL";

[demoSpecialistGroup,4] setWaypointStatements ["true", "null = [] execVM 'scripts\arm-ieds-powerplant.sqf'"];


waitUntil {
    sleep 1; 
    if ((demoSpecialist distance ied2) > 35) exitWith {true};
    false
};
demoSpecialist sideChat "Be advised, there is an IED on the access road to the southeast of the power plant.";
"MARKER_POWERPLANT_IED2" setMarkerType "mil_warning";
IED2_HAS_BEEN_ACTIVATED = true;
