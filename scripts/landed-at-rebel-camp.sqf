
waitUntil {sleep 1; (fuel thehelicopter) == 0};

TRIGGER_LANDED_AT_REBEL_CAMP_FIRED = true;

null = [] execVM "scripts\conversation-with-kostas.sqf";

