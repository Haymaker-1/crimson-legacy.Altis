
hintSilent "dbg7";

["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_REBEL_CAMP",50,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_KLD_NEGADES",100,"ColorGUER",0.70] execVM "scripts\floodfill-perimeter.sqf";
["MARKER_PERIMETER_FKS_KAVALA",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";

//OUTLIVED_HIS_USEFULNESS set [0,true];


//null = [] execVM "scripts\set-up-op-agios-konstantinos.sqf";

AA_MAGOS setDamage 1;
AA_AMFISSA_ setDamage 1;
MARID_KAVALA_1 setDamage 1;
MARID_KAVALA_2 setDamage 1;


CRASH_SITE_IS_CLEAR = true;
AA_MAGOS_IS_CLEAR = true;
AA_AMFISSA_IS_CLEAR = true;

[sf0,sf1,sf2,sf3] joinSilent (group player);
(group player) selectLeader player;
{_x setPos getPos player} forEach units group player;
{_x allowDamage false;} forEach (units (group player));



null = [] execVM "scripts\populate-motor-pool-kavala.sqf";
null = [] execVM "scripts\spawn-fireteams-kavala.sqf";
null = [] execVM "scripts\spawn-kavala-marids.sqf";
null = [] execVM "scripts\spawn-kavala-mortar-group.sqf";
null = [] execVM "scripts\spawn-kavala-static-defenses.sqf";

sleep 20;
waitUntil{!isnil "kavalaFuelTruck"};
player hideObject true;
player moveInDriver kavalaFuelTruck;

sleep 10;

kavalaFuelTruck setPos getMarkerPos "MARKER_CHRISTOS_HOUSE";
player hideObject false;


_vehiclesMotorpool = nearestObjects [(getMarkerPos "MARKER_MOTOR_POOL"),["Car","Tank"],_radius];
{
    _x setDamage 1;
} forEach _vehiclesMotorpool;

waitUntil{player in crew krya_nera_strider};
skiptime 0.3;

sf0 moveInCommander krya_nera_strider;
sf1 moveInCargo krya_nera_strider;
sf2 moveInCargo krya_nera_strider;
sf3 moveInCargo krya_nera_strider_gmg;


krya_nera_strider setPos getMarkerPos "MARKER_STRIDER_1_RESUME";
krya_nera_strider_gmg setPos getMarkerPos "MARKER_STRIDER_2_RESUME";
krya_nera_strider_hmg setPos getMarkerPos "MARKER_STRIDER_3_RESUME";


null = [player,500] execVM "dbg\show-men.sqf";

sleep 20;
saveGame;

{
    _x allowDamage false;
} forEach unit group player;


player addWeapon "NVGoggles_OPFOR";




