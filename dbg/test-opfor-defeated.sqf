

(38.0 * 3600) setOvercast 0.1;

skipTime 38.0;

null = [] execVM "dbg\spawn-patrols-kavala.sqf";

null = [player,true] execVM "dbg\make-invincible.sqf";

player setPos getMarkerPos "MARKER_MOTOR_POOL";

null = [] execVM "scripts\create-bases.sqf";

null = [false] execVM "scripts\assault-kavala.sqf";

null = [getMarkerPos "MARKER_MOTOR_POOL",1250] execVM "dbg\show-men.sqf";

["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_SHJ",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";




