

// null = [] execVM "dbg\setstate-5.sqf"

LITTLEBIRD_BROKEN = true;
null = [] execVM "scripts\break-helicopter.sqf";

skiptime 13.0;

thehelicopter setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
thehelicopter setDir (random 360);
thehelicopter engineOn false;
thehelicopter setFuel 0.05;

[sf_teamleader,sf_marksman1,sf_rifleman1,sf_atman] joinSilent (group player);
(group player) selectLeader player;

{_x allowDamage true;} forEach (units (group player));

//(group player) setCombatMode "RED";
//(group player) setCombatBehaviour "SAFE";

"MARKER_FUEL_TRUCK" setMarkerType "mil_dot";

_aaAlphaValue = 0.35;

"MARKER_OPFOR_AA_FRINI" setMarkerShape "ELLIPSE"; 
"MARKER_OPFOR_AA_FRINI" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_FRINI" setMarkerAlpha _aaAlphaValue; 

"MARKER_OPFOR_AA_IFESTONIA" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_IFESTONIA" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_IFESTONIA" setMarkerAlpha _aaAlphaValue; 

"MARKER_OPFOR_AA_GALATI" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_GALATI" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_GALATI" setMarkerAlpha _aaAlphaValue; 

"MARKER_OPFOR_AA_PYRSOS" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_PYRSOS" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_PYRSOS" setMarkerAlpha _aaAlphaValue; 

"MARKER_OPFOR_AA_AMFISSA" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_AMFISSA" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_AMFISSA" setMarkerAlpha _aaAlphaValue; 

"MARKER_OPFOR_AA_MAGOS" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_MAGOS" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_MAGOS" setMarkerAlpha _aaAlphaValue; 

["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";

"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerType "mil_dot"; 
"MARKER_PILOT_DISTRESS_SIGNAL" setMarkerText "DISTRESS SIGNAL"; 


_spawningComplete = [] execVM "scripts\spawn-fireteam-crash-site.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;


["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";

OUTLIVED_HIS_USEFULNESS set [0,true];

"MARKER_REBEL_CAMP" setMarkerType "mil_dot"; 
"MARKER_REBEL_CAMP" setMarkerText "REBEL CAMP"; 


["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";

"MARKER_EGRESS_ALPHA" setMarkerType "mil_dot";


{
    _x setPos getMarkerPos "MARKER_RESUME_5";
} forEach units group player;

TASK_CLEAR_NEGADES_HAS_BEEN_ASSIGNED = true;
TASK_CLEAR_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED = true;

waitUntil{sleep 5;AGIOS_KONSTANTINOS_IS_CLEAR AND NEGADES_IS_CLEAR};

_spawningComplete = [] execVM "scripts\spawn-blufor-fireteams-agios-konstantinos.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-blufor-fireteams-negades.sqf";
waitUntil{sleep 0.5;scriptDone _spawningComplete};
_spawningComplete = nil;

null = [] execVM "scripts\set-up-op-agios-konstantinos.sqf";



