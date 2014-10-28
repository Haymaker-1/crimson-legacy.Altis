
// WEST and GUER are friends
WEST setFriend [RESISTANCE, 1.0];
RESISTANCE setFriend [WEST, 1.0];

// WEST and EAST are enemies
WEST setFriend [EAST, 0.0];
EAST setFriend [WEST, 0.0];

// WEST and GUER are enemies
RESISTANCE setFriend [EAST, 0.0];
EAST setFriend [RESISTANCE, 0.0];



0 fadeSound 0;

null = [] execVM "scripts\setFuelStationsEmpty.sqf";

["MARKER_PERIMETER_KRYA_NERA_KMJ",25,"ColorWEST",0.70] execVM "scripts\floodfill-perimeter.sqf";


(group player) setGroupId ["Delta One","GroupColor4"];
(group THE_CO) setGroupId ["Delta Actual","GroupColor4"];
(group kostas) setGroupId ["Kostas","GroupColor4"];
(group christos) setGroupId ["Christos","GroupColor4"];


NEED_HELO = true;
TRIGGER_LANDED_AT_REBEL_CAMP_FIRED = false;
CONVOY_HAS_REACHED_LAKKA = false;
CONVOY_HAS_REACHED_KORE = false;
TOTAL_NUMBER_OF_RANDOM_PATROLS = 0;
AGIOS_KONSTANTINOS_IS_CLEAR = false;
NEGADES_IS_CLEAR = false;
PILOT_EGRESS_WAS_SUCCESSFUL = false;
CRASH_SITE_IS_CLEAR = false;
AA_MAGOS_IS_CLEAR = false;
AA_AMFISSA_IS_CLEAR = false;
AA_PYRSOS_IS_CLEAR = false;
AA_GALATI_IS_CLEAR = false;
AA_IFESTONIA_IS_CLEAR = false;
AA_FRINI_IS_CLEAR = false;
CRASH_SITE_POPULATED = false;
SPAWNING_ENABLED = true;
ENDMISSION_REASON_THROWN = false;
SPAWN_AGIOS_DONE = false;
TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED = false;
TASK_ESCORT_PILOT_HAS_BEEN_ASSIGNED = false;
IED1_HAS_BEEN_ACTIVATED = false;
IED2_HAS_BEEN_ACTIVATED = false;
TASK_SEIZE_POWER_PLANT_HAS_BEEN_ASSIGNED = false;
EVERYBODY_IS_DONE_TALKING = true;
TASK_MEET_AT_QUARRY_HAS_BEEN_ASSIGNED = false;

GPS_TRACKING_IS_ON = getNumber (missionConfigFile >> "myMissionConfig" >> "mySetup" >> "GPS_TRACKING_ENABLED") == 1;
player addAction ["Disable GPS tracking","scripts\toggle-gpstracking.sqf",nil,0,false];

RANDOM_PATROL_GROUP_HAS_ARRIVED = [];
RANDOM_PATROL_GROUP_HAS_ARRIVED resize 100;
{
    RANDOM_PATROL_GROUP_HAS_ARRIVED set [_forEachIndex,false];
} forEach RANDOM_PATROL_GROUP_HAS_ARRIVED;

calcDirection = compile loadFile "functions\calcDirection.sqf";
calcDirectionWindrose = compile loadFile "functions\calcDirectionWindrose.sqf";
calcMeanPos = compile loadFile "functions\calcMeanPos.sqf";
constructPerimeter = compile loadFile "functions\constructPerimeter.sqf";
calcWindingNumber = compile loadFile "functions\calcWindingNumber.sqf";
calcBoundingBox = compile loadFile "functions\calcBoundingBox.sqf";
generateRandomPositionInPolygon = compile loadFile "functions\generateRandomPositionInPolygon.sqf";
bubbleSort = compile loadFile "functions\bubbleSort.sqf";
randomSelectionFromArray = compile loadFile "functions\randomSelectionFromArray.sqf";
strcmpn = compile loadFile "functions\strcmpn.sqf";
getAddRatingValueExplosives = compile loadFile "functions\getAddRatingValueExplosives.sqf";
getHitPointReport = compile loadFile "functions\getHitPointReport.sqf";



null = [] execVM "scripts\endmission-team-member-died.sqf";
null = [] execVM "scripts\endmission-pilot-died.sqf";
null = [] execVM "scripts\endmission-helicopter-damaged.sqf";
null = [] execVM "scripts\endmission-helicopter-out-of-fuel.sqf";
null = [] execVM "scripts\endmission-helicopter-rebelcamp.sqf";
null = [] execVM "scripts\endmission-player-died.sqf";

null = [] execVM "scripts\spawn-helicopter.sqf";

null = [] execVM "scripts\spawn-fireteams-krya-nera.sqf";
null = [] execVM "scripts\spawn-fireteams-airbase.sqf";
null = [] execVM "scripts\spawn-fireteams-krya-nera-airport.sqf";
null = [] execVM "scripts\spawn-fireteams-rebel-camp.sqf";
null = [] execVM "scripts\spawn-fireteam-aa-magos.sqf";
null = [] execVM "scripts\spawn-fireteam-aa-amfissa.sqf";
null = [] execVM "scripts\spawn-kostas-borrowed-men.sqf";

null = [] execVM "scripts\enabletracking.sqf";
null = [] execVM "scripts\restore-health.sqf";

null = [] execVM "scripts\aa-magos-died.sqf";
null = [] execVM "scripts\aa-amfissa-died.sqf";
null = [] execVM "scripts\aa-pyrsos-died.sqf";
null = [] execVM "scripts\aa-galati-died.sqf";
null = [] execVM "scripts\aa-ifestonia-1-and-2-died.sqf";
null = [] execVM "scripts\aa-frini-died.sqf";


shedAgios = createvehicle ["Land_Shed_Big_F",[4047.0,17665.4,-0.91],[],0,"NONE"];
shedAgios setDir 44.5;

{
    _lightPos = _x;
    _lightColor = [1,0.5,0.5];
    _lightBrightness = 0.15;
    
    null = [_lightPos,_lightColor,_lightBrightness] execVM "scripts\create-light.sqf";
} forEach [[7474.46,16277.7,3.0],[7465.53,16288.6,3.0]];



(getMarkerPos "MARKER_HELIPORT" nearestObject 1240642) setDamage 1;
(getMarkerPos "MARKER_HELIPORT" nearestObject 1240643) setDamage 1;


SHOW_CHAPTER_TITLES = getNumber (missionConfigFile >> "myMissionConfig" >> "mySetup" >> "SHOW_CHAPTER_TITLES") == 1;

player createDiarySubject ["techNotes","Technical notes"];

player createDiaryRecord ["techNotes",["Version control","Go to https://github.com/Haymaker-1/crimson-legacy.Altis/ for the mission source files."]];



null = [] execVM "scripts\savegames.sqf";
