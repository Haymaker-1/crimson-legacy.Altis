
private "_shedAgios";
private "_spawningComplete";




titleText ["", "BLACK FADED", 0];
0 fadeSound 0;
setDate [2035,1 + round(random 11),1 + round(random 27),18,35];

// WEST and GUER are friends
WEST setFriend [RESISTANCE, 1.0];
RESISTANCE setFriend [WEST, 1.0];

// WEST and EAST are enemies
WEST setFriend [EAST, 0.0];
EAST setFriend [WEST, 0.0];

// EAST and GUER are enemies
RESISTANCE setFriend [EAST, 0.0];
EAST setFriend [RESISTANCE, 0.0];

deactivateKey "missionCompletedKey";




// create light sources at christos'es
{
    private "_lightPos";
    private "_lightColor";
    private "_lightBrightness";
    _lightPos = _x;
    _lightColor = [1,0.5,0.5];
    _lightBrightness = 0.15;
    null = [_lightPos,_lightColor,_lightBrightness] execVM "scripts\create-light.sqf";
} forEach [[7474.46,16277.7,3.0],[7465.53,16288.6,3.0]];


// spawn purple lights at helipads and other POIs
{
	private "_lightPos";
	private "_lightColor";
	private "_lightBrightness";
	_lightPos = getMarkerPos _x;
	_lightColor = [0.5, 0.0, 1.0];
	_lightBrightness = 0.20;
	null = [_lightPos, _lightColor, _lightBrightness] execVM "scripts\create-light.sqf";
} forEach ["MARKER_KRYA_NERA_HELIPAD",
           "MARKER_SPAWN_HELICOPTER",
           "MARKER_SPAWN_HELICOPTER_2",
           "MARKER_LOAD_FUEL",
		   "MARKER_NABISCO_HELIPAD",
		   "MARKER_REBEL_CAMP_HELIPAD"];




bubbleSort = compile loadFile "functions\bubbleSort.sqf";
calcAddVolume = compile loadFile "functions\calcAddVolume.sqf";
calcBoundingBox = compile loadFile "functions\calcBoundingBox.sqf";
calcDirection = compile loadFile "functions\calcDirection.sqf";
calcDirectionWindrose = compile loadFile "functions\calcDirectionWindrose.sqf";
calcMeanPos = compile loadFile "functions\calcMeanPos.sqf";
calcWindingNumber = compile loadFile "functions\calcWindingNumber.sqf";
constructPerimeter = compile loadFile "functions\constructPerimeter.sqf";
datestr = compile loadFile "functions\datestr.sqf";
generateRandomPositionInPolygon = compile loadFile "functions\generateRandomPositionInPolygon.sqf";
getAddRatingValueExplosives = compile loadFile "functions\getAddRatingValueExplosives.sqf";
getBaseWeaponClass = compile loadFile "functions\getBaseWeaponClass.sqf";
getHitPointReport = compile loadFile "functions\getHitPointReport.sqf";
randomSelectionFromArray = compile loadFile "functions\randomSelectionFromArray.sqf";
selectWeightedRandom = compile loadFile "functions\selectWeightedRandom.sqf";
showMeWhatYouGot = compile loadFile "functions\showMeWhatYouGot.sqf";
strcmpn = compile loadFile "functions\strcmpn.sqf";



_spawningComplete = [] execVM "scripts\spawn-global-object.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;
// engineer disabled for the moment (issue #32)
HAYMAKER_GLOBALS setVariable ["TEAM_PROB",
    [
         [[0,"B_Soldier_M_F",     "marksman"],    0.20],
         [[1,"B_soldier_repair_F","engineer"],    0.00],
         [[2,"B_medic_F",         "medic"],       0.20],
         [[3,"B_soldier_AR_F",    "autorifleman"],0.20],
         [[4,"B_Soldier_F",       "rifleman"],    0.20],
         [[5,"B_Soldier_GL_F",    "grenadier"],   0.20]
    ]
];
HAYMAKER_GLOBALS setVariable ["NEED_HELO", true];
HAYMAKER_GLOBALS setVariable ["TASK_LOAD_FUEL_HAS_BEEN_ASSIGNED", false];
HAYMAKER_GLOBALS setVariable ["TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED", false];
HAYMAKER_GLOBALS setVariable ["TRIGGER_LANDED_AT_REBEL_CAMP_FIRED", false];
HAYMAKER_GLOBALS setVariable ["CONVOY_HAS_REACHED_LAKKA", false];
HAYMAKER_GLOBALS setVariable ["CONVOY_HAS_REACHED_KORE", false];
HAYMAKER_GLOBALS setVariable ["TOTAL_NUMBER_OF_RANDOM_PATROLS", 0];
HAYMAKER_GLOBALS setVariable ["AGIOS_KONSTANTINOS_IS_CLEAR", false];
HAYMAKER_GLOBALS setVariable ["NEGADES_IS_CLEAR", false];
HAYMAKER_GLOBALS setVariable ["PILOT_EGRESS_WAS_SUCCESSFUL", false];
HAYMAKER_GLOBALS setVariable ["CRASH_SITE_IS_CLEAR", false];
HAYMAKER_GLOBALS setVariable ["AA_MAGOS_IS_CLEAR", false];
HAYMAKER_GLOBALS setVariable ["AA_AMFISSA_IS_CLEAR", false];
HAYMAKER_GLOBALS setVariable ["ENDMISSION_REASON_THROWN", false];
HAYMAKER_GLOBALS setVariable ["TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED", false];
HAYMAKER_GLOBALS setVariable ["TASK_ESCORT_PILOT_HAS_BEEN_ASSIGNED", false];
HAYMAKER_GLOBALS setVariable ["TASK_SEIZE_POWER_PLANT_HAS_BEEN_ASSIGNED", false];
HAYMAKER_GLOBALS setVariable ["EVERYBODY_IS_DONE_TALKING", true];
HAYMAKER_GLOBALS setVariable ["TASK_MEET_AT_QUARRY_HAS_BEEN_ASSIGNED", false];
HAYMAKER_GLOBALS setVariable ["LOOKOUT_FOR_MORTAR_TARGETS", true];
HAYMAKER_GLOBALS setVariable ["SPAWN_RANDOM_PATROLS_ENABLED", true];
HAYMAKER_GLOBALS setVariable ["WEATHER_IS_CONTROLLED", false];
HAYMAKER_GLOBALS setVariable ["VOICE_PITCH", [[THE_CO, 0.92], [player, 1.02]]];
HAYMAKER_GLOBALS setVariable ["VOICE_VOLUME", [[THE_CO, 2.0], [player, 0.9]]];
HAYMAKER_GLOBALS setVariable ["SPEECH_AUDIBLE_DISTANCE", 40];
HAYMAKER_GLOBALS setVariable ["MISSION_TOP_LEVEL_DIRECTORY", [(str missionConfigFile), 0, -15] call BIS_fnc_trimString];
HAYMAKER_GLOBALS setVariable ["BLUFOR_ARIFLE_OF_CHOICE", [[["f2000",0.50],["tavor",0.50]]] call HAYMAKER_fnc_selectWeightedRandom];
HAYMAKER_GLOBALS setVariable ["SHOW_CHAPTER_TITLES", getNumber (missionConfigFile >> "myMissionConfig" >> "mySetup" >> "SHOW_CHAPTER_TITLES") == 1];

["MARKER_PERIMETER_KRYA_NERA_KMJ",25,"ColorWEST",0.70] execVM "scripts\floodfill-perimeter.sqf";
(group THE_CO) setGroupId ["Delta Actual","GroupColor4"];
(group kostas) setGroupId ["Kostas","GroupColor4"];
(group christos) setGroupId ["Christos","GroupColor4"];



RANDOM_PATROL_GROUP_HAS_ARRIVED = [];
STOP_RANDOM_PATROL_GROUP = [];
RANDOM_PATROL_GROUP_LAST_KNOWN_POS = [];

RANDOM_PATROL_GROUP_HAS_ARRIVED resize 100;
STOP_RANDOM_PATROL_GROUP resize 100;
RANDOM_PATROL_GROUP_LAST_KNOWN_POS resize 100;

{
    RANDOM_PATROL_GROUP_HAS_ARRIVED set [_forEachIndex,[grpNull,false]];
    STOP_RANDOM_PATROL_GROUP set [_forEachIndex,false];
    RANDOM_PATROL_GROUP_LAST_KNOWN_POS set [_forEachIndex,locationNull];
} forEach RANDOM_PATROL_GROUP_HAS_ARRIVED;




null = [] execVM "scripts\monitor-if-random-patrol-units-are-moving.sqf";
null = [] execVM "scripts\spawn-helicopter.sqf";
null = [] execVM "scripts\spawn-helipad-nabisco.sqf";
_spawningComplete = [] execVM "scripts\spawn-fireteams-krya-nera.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteams-airbase.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteams-krya-nera-airport.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteams-rebel-camp.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteam-aa-magos.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteam-aa-amfissa.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-kostas-borrowed-men.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-sfteam.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;


null = [(group THE_CO)] execVM "scripts\change-equipment-blufor-group-members.sqf";
null = [(group SUITCASE_CARRIER_MAN)] execVM "scripts\change-equipment-blufor-group-members.sqf";


null = [] execVM "scripts\set-fuel-stations-empty.sqf";
null = [] execVM "scripts\enabletracking.sqf";
null = [] execVM "scripts\restore-health.sqf";

null = [] execVM "scripts\aa-magos-died.sqf";
null = [] execVM "scripts\aa-amfissa-died.sqf";
null = [] execVM "scripts\aa-pyrsos-died.sqf";
null = [] execVM "scripts\aa-galati-died.sqf";
null = [] execVM "scripts\aa-ifestonia-1-and-2-died.sqf";
null = [] execVM "scripts\aa-frini-died.sqf";


_shedAgios = createvehicle ["Land_Shed_Big_F",[4047.0,17665.4,-0.91],[],0,"NONE"];
_shedAgios setDir 44.5;



(getMarkerPos "MARKER_HELIPORT" nearestObject 1240642) setDamage 1;
(getMarkerPos "MARKER_HELIPORT" nearestObject 1240643) setDamage 1;

null = [] execVM "scripts\savegames.sqf";
