
waitUntil {
    sleep 1;
    if ((fuel thehelicopter) == 0) exitWith {true};
    false
};

TRIGGER_LANDED_AT_REBEL_CAMP_FIRED = true;

null = [] execVM "scripts\conversation-with-kostas.sqf";

