

["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";

OUTLIVED_HIS_USEFULNESS set [0,true];


null = [] execVM "scripts\set-up-op-agios-konstantinos.sqf";


sleep 5;

player setPos getMarkerPos "MARKER_DBG_RESUME_STATE_6";
[sf_teamleader,sf_marksman1,sf_rifleman1,sf_atman] joinSilent (group player);
(group player) selectLeader player;
{_x setPos getPos player} forEach units group player;
{_x allowDamage false;} forEach (units (group player));


CRASH_SITE_IS_CLEAR = true;

AA_MAGOS setDamage 1;
//AA_MAGOS_IS_CLEAR = true;

AA_AMFISSA setDamage 1;
//AA_AMFISSA_IS_CLEAR = true;