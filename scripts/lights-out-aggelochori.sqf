

private "_damageValue";


_damageValue = _this select 0;

LIGHTS_AGGELOCHORI_SHOULD_BE_OFF = true;

null = [_damageValue,0.00] execVM "scripts\lightswitch-aggelochori.sqf";

null = [] execVM "scripts\monitor-light-status-kavala.sqf";


{
    _x setBehaviour "COMBAT";
} forEach [MARID_KAVALA_1_GROUP, MARID_KAVALA_2_GROUP];


sleep (4*60 + random 60);

MARID_KAVALA_1_GROUP addWaypoint [getMarkerPos "MARKER_MARID_KAVALA_1_WP_1",1];
[MARID_KAVALA_1_GROUP,1] setWaypointType "MOVE";
[MARID_KAVALA_1_GROUP,1] setWaypointSpeed "LIMITED";

MARID_KAVALA_1_GROUP addWaypoint [getMarkerPos "MARKER_MARID_KAVALA_1_WP_2",2];
[MARID_KAVALA_1_GROUP,2] setWaypointType "MOVE";
[MARID_KAVALA_1_GROUP,2] setWaypointSpeed "LIMITED";

MARID_KAVALA_2_GROUP addWaypoint [getMarkerPos "MARKER_MARID_KAVALA_2_WP_1",1];
[MARID_KAVALA_2_GROUP,1] setWaypointType "MOVE";
[MARID_KAVALA_2_GROUP,1] setWaypointSpeed "LIMITED";

MARID_KAVALA_2_GROUP addWaypoint [getMarkerPos "MARKER_MARID_KAVALA_2_WP_2",2];
[MARID_KAVALA_2_GROUP,2] setWaypointType "MOVE";
[MARID_KAVALA_2_GROUP,2] setWaypointSpeed "LIMITED";

MARID_KAVALA_2_GROUP addWaypoint [getMarkerPos "MARKER_MARID_KAVALA_2_WP_3",3];
[MARID_KAVALA_2_GROUP,3] setWaypointType "MOVE";
[MARID_KAVALA_2_GROUP,3] setWaypointSpeed "LIMITED";
