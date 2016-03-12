
waitUntil {
    sleep 1;
    if ((fuel thehelicopter) == 0) exitWith {true};
    false
};

HAYMAKER_GLOBALS setVariable ["TRIGGER_LANDED_AT_REBEL_CAMP_FIRED", true];

null = [] execVM "scripts\conversation-with-kostas.sqf";

