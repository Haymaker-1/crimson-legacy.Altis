
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

[sf_teamleader,sf_marksman1,sf_rifleman1,sf_atman] joinSilent (group player);
(group player) selectLeader player;

sf_teamleader setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
sf_marksman1 setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
sf_rifleman1 setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
sf_atman setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");

{_x allowDamage false;} forEach (units (group player));



sleep 45;

[pilot] joinSilent (group player);
