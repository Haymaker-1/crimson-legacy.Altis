
private "_wp";
private "_grp";
private "_veh";

_veh = assignedVehicle demoSpecialist;
_grp = group demoSpecialist;

[demoSpecialist] orderGetIn false;

waitUntil {
    sleep 1;
    if (!(demoSpecialist in crew _veh)) exitWith {true};
    false
};

_wp = _grp addWaypoint [getMarkerPos "MARKER_POWERPLANT_IED1", 2];

[_grp,2] setWaypointType "MOVE";
[_grp,2] setWaypointSpeed "NORMAL";

[_grp,2] setWaypointStatements ["true", "null = [] execVM 'scripts\place-ied1-near-powerplant.sqf'"];
