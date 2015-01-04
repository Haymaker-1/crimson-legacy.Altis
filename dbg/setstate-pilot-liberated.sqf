
TRIGGER_LANDED_AT_REBEL_CAMP_FIRED = true;

OUTLIVED_HIS_USEFULNESS set [0,true];

null = [] execVM "scripts\spawn-pilot.sqf";
sleep 5;

pilot setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");

LITTLEBIRD_BROKEN = true;
null = [] execVM "scripts\break-helicopter.sqf";

skiptime 12.25;

thehelicopter setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
thehelicopter setDir (random 360);
player setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");

thehelicopter setFuel 0.0;

[sf0,sf1,sf2,sf3] joinSilent (group player);
(group player) selectLeader player;

sf0 setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
sf1 setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
sf2 setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
sf3 setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");

{_x allowDamage false;} forEach (units (group player));



sleep 45;

[pilot] joinSilent (group player);
