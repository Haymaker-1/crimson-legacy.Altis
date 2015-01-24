
skiptime 14;

["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";

//OUTLIVED_HIS_USEFULNESS set [0,true];




sleep 5;

player setPos getMarkerPos "MARKER_DBG_RESUME_STATE_6";
[sf0,sf1,sf2,sf3] joinSilent (group player);
(group player) selectLeader player;

// {_x setPos getPos player} forEach units group player;
// {_x allowDamage false;} forEach (units (group player));


CRASH_SITE_IS_CLEAR = true;
AGIOS_KONSTANTINOS_IS_CLEAR = true;
NEGADES_IS_CLEAR = true;


AA_MAGOS setDamage 1;
{
    _x setDamage 1;
} forEach ((getMarkerPos "MARKER_OPFOR_AA_MAGOS") nearEntities ["Man",350]);

AA_AMFISSA setDamage 1;
{
    _x setDamage 1;
} forEach ((getMarkerPos "MARKER_OPFOR_AA_AMFISSA") nearEntities ["Man",350]);


_spawningComplete = [] execVM "scripts\spawn-blufor-fireteams-agios-konstantinos.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-blufor-fireteams-negades.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

null = [] execVM "scripts\set-up-op-agios-konstantinos.sqf";
