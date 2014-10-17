
sleep 10;

demoSpecialist assignAsDriver demoSpecialistVeh;

if ("DemoCharge_Remote_Mag" in (magazineCargo demoSpecialistVeh)) then {


    demoSpecialist sideChat "Hey! Don't forget your explosives. I can't wait too long here.";
    sleep 5;

    waitUntil{sleep 5; "DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects transformer) select 0)] OR (!alive transformer)};
    
    _then = daytime;
    _fiveMinutes = 5/60;
    _cond = nil;
    waitUntil {
        sleep 15;
        _now = daytime; 
        _cond = ((_now - _then) > _fiveMinutes) OR 
        !("DemoCharge_Remote_Mag" in (magazineCargo demoSpecialistVeh)) OR
        ((demoSpecialist distance MARID_KAVALA_1) < 500) OR
        ((demoSpecialist distance MARID_KAVALA_2) < 500);
        _cond
    };

    if ("DemoCharge_Remote_Mag" in (magazineCargo demoSpecialistVeh)) then {
        demoSpecialist sideChat "I'm sorry but I can't wait any longer. Good luck, my friend!";
    }
    else {
        demoSpecialist sideChat "I'm outta here! Good luck, my friend!";
    };
    
   
}
else {
    demoSpecialist sideChat "I'm outta here! Good luck, my friend!";
};    

_wp = demoSpecialistGroup addWaypoint [getMarkerPos "MARKER_NEGADES", 5];

[demoSpecialistGroup,5] setWaypointType "MOVE";
[demoSpecialistGroup,5] setWaypointSpeed "NORMAL";
[demoSpecialistGroup,5] setWaypointCompletionRadius 50;
[demoSpecialistGroup,5] setWaypointStatements ["true", "deleteVehicle demoSpecialist; deleteVehicle demoSpecialistVeh"];
