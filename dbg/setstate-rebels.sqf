
TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED = true;
TRIGGER_LANDED_AT_REBEL_CAMP_FIRED = true;





LITTLEBIRD_BROKEN = true;
null = [] execVM "scripts\break-helicopter.sqf";

skiptime 11.5;

thehelicopter setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
thehelicopter setDir (random 360);
player setPos (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD");
player assignAsDriver thehelicopter;
player moveInDriver thehelicopter;
thehelicopter engineOn false;
thehelicopter setFuel 0.05;

[sf0,sf1,sf2,sf3] joinSilent (group player);
(group player) selectLeader player;

sf0 moveInCargo [thehelicopter,2];
sf1 moveInCargo [thehelicopter,3];
sf2 moveInCargo [thehelicopter,4];
sf3 moveInCargo [thehelicopter,5];

{_x allowDamage true;} forEach (units (group player));


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

["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";

OUTLIVED_HIS_USEFULNESS set [0,true];

"MARKER_REBEL_CAMP" setMarkerType "mil_dot"; 
"MARKER_REBEL_CAMP" setMarkerText "REBEL CAMP"; 





null = [] execVM "scripts\landed-at-rebel-camp.sqf";

