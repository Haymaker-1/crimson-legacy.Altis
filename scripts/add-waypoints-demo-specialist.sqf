
demoSpecialist leaveVehicle demoSpecialistVeh;

waitUntil {
    sleep 1;
    if (!(demoSpecialist in crew demoSpecialistVeh)) exitWith {true};
    false
};

_wp = demoSpecialistGroup addWaypoint [getMarkerPos "MARKER_POWERPLANT_IED1", 2];

[demoSpecialistGroup,2] setWaypointType "MOVE";
[demoSpecialistGroup,2] setWaypointSpeed "NORMAL";

[demoSpecialistGroup,2] setWaypointStatements ["true", "null = [] execVM 'scripts\place-ied1-near-powerplant.sqf'"];
