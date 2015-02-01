

demoSpecialist disableAI "MOVE";
demoSpecialist disableAI "ANIM";
demoSpecialist playAction "Crouch";
sleep 4;
ied1 = createMine ["IEDUrbanBig_F",(getMarkerPos "MARKER_POWERPLANT_IED1"),[],0];
demoSpecialist enableAI "MOVE"; 
demoSpecialist enableAI "ANIM";



_wp = demoSpecialistGroup addWaypoint [getMarkerPos "MARKER_POWERPLANT_IED2", 3];

[demoSpecialistGroup,3] setWaypointType "MOVE";
[demoSpecialistGroup,3] setWaypointSpeed "NORMAL";

[demoSpecialistGroup,3] setWaypointStatements ["true", "null = [] execVM 'scripts\place-ied2-near-powerplant.sqf'"];


waitUntil {
    sleep 1;
    if ((demoSpecialist distance ied1) > 35) exitWith {true};
    false
};
demoSpecialist sideChat "Be advised, I just put an IED on the south side of the bridge.";
"MARKER_POWERPLANT_IED1" setMarkerType "mil_warning";
IED1_HAS_BEEN_ACTIVATED = true;
