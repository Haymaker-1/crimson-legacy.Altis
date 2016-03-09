
private "_wp";
private "_grp";
private "_veh";

sleep 10;
_veh = assignedVehicle demoSpecialist;
[demoSpecialist] orderGetIn true;

if ("DemoCharge_Remote_Mag" in (magazineCargo _veh)) then {

    private "_then";
    private "_fiveMinutes";
    private "_cond";

    demoSpecialist sideChat "Hey! Don't forget your explosives. I can't wait too long here.";
    sleep 5;

    waitUntil{
        sleep 5;
        if ("DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects transformer) select 0)] OR (!alive transformer)) exitWith {true};
        false
    };

    _then = daytime;
    _fiveMinutes = 5/60;
    _cond = nil;
    waitUntil {

        private "_now";
        sleep 15;
        _now = daytime;
        _cond = ((_now - _then) > _fiveMinutes) OR
        !("DemoCharge_Remote_Mag" in (magazineCargo _veh)) OR
        ((demoSpecialist distance MARID_KAVALA_1) < 500) OR
        ((demoSpecialist distance MARID_KAVALA_2) < 500);
        if (_cond) exitWith {true};
        false
    };

    if ("DemoCharge_Remote_Mag" in (magazineCargo _veh)) then {
        demoSpecialist sideChat "I'm sorry but I can't wait any longer. Good luck, my friend!";
    }
    else {
        demoSpecialist sideChat "I'm outta here! Good luck, my friend!";
    };


}
else {
    demoSpecialist sideChat "I'm outta here! Good luck, my friend!";
};

_grp = group demoSpecialist;
_wp = _grp addWaypoint [getMarkerPos "MARKER_NEGADES", 5];
[_grp,5] setWaypointType "MOVE";
[_grp,5] setWaypointSpeed "NORMAL";
[_grp,5] setWaypointCompletionRadius 50;
[_grp,5] setWaypointStatements ["true", "deleteVehicle (assignedVehicle demoSpecialist); deleteVehicle demoSpecialist;"];
