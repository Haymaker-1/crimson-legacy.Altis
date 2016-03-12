

private "_radius";
private "_vehiclesMotorpool";
private "_actualScore";
private "_perfectScore";
private "_perimeter";
private "_isReady";
private "_voiceSampleId";
private "_repositionPos";
private "_theDate";
private "_yyyy";
private "_mm";
private "_dd";
private "_tod";
private "_hot";
private "_cold";
private "_thermalImagingEngine";
private "_thermalImagingWheels";
private "_thermalImagingWeapon";
private "_thermalImagingPars";
private "_gmgGroup";
private "_hmgGroup";
private "_group";
private "_varsuk";
private "_men";
private "_spawningComplete";
private "_trig";


kavalaFuelTruck allowDamage false;


null = [] spawn {
    waitUntil{
        sleep 5;
        if ((getPos player) distance (getMarkerPos "MARKER_CHRISTOS_HOUSE") < 50) exitWith {true};
        false
    };
    sleep random 5;
    TASK_STEAL_KAVALA_FUEL_TRUCK setTaskState "Succeeded";
    ["TaskSucceeded", ["","Steal fuel truck"]] call BIS_fnc_showNotification;
};

sleep (10 + random 10);

_radius = 100;
_vehiclesMotorpool = nearestObjects [(getMarkerPos "MARKER_MOTOR_POOL"),["Car","Tank"],_radius];
_radius = nil;

_actualScore = 0;
_perfectScore = 0;

_perimeter = ["MARKER_PERIMETER_FKS_KAVALA"] call HAYMAKER_fnc_constructPerimeter;

{
    _x allowDamage false;
} forEach _vehiclesMotorpool;

{
    private "_veh";
    private "_vehicleType";
    private "_addRatingValue";
    private "_perfectScore";
    private "_hasAttachedExplosives";

    _veh = _x;
    _vehicleType = typeOf _veh;
    _addRatingValue = [_vehicleType] call HAYMAKER_fnc_getAddRatingValueExplosives;
    _perfectScore = _perfectScore + _addRatingValue;

    _hasAttachedExplosives = "DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects _veh) select 0)];
    if ((!alive _veh) OR _hasAttachedExplosives) then {
        _actualScore = _actualScore + _addRatingValue;
    } else {

        private "_excludedVehicles";

        _excludedVehicles = ["O_MRAP_02_F","O_Quadbike_01_F","O_Truck_02_transport_F","O_Truck_02_covered_F"];
        if (!(typeOf _veh in _excludedVehicles)) then {

            private "_repositionRadius";
            private "_grp";
            private "_dest";
            private "_wp";

            _repositionRadius = 70;
            _repositionPos = [((getMarkerPos "MARKER_MOTOR_POOL_REPOSITION") select 0) - _repositionRadius/2 + random _repositionRadius,
                              ((getMarkerPos "MARKER_MOTOR_POOL_REPOSITION") select 1) - _repositionRadius/2 + random _repositionRadius,
                              ((getMarkerPos "MARKER_MOTOR_POOL_REPOSITION") select 2)];
            _veh setPos _repositionPos;
            createVehicleCrew _veh;
            _grp = group ((crew _veh) select 0);
            _dest = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;
            _wp = _grp addWaypoint [_dest, 20];
            [_grp,1] setWaypointSpeed "LIMITED";
            [_grp,1] setWaypointBehaviour "CARELESS";
            [_grp,1] setWaypointCompletionRadius 100;
        };
    };

} forEach _vehiclesMotorpool;

{
    _x allowDamage true;
} forEach _vehiclesMotorpool;


MOTOR_POOL_SCORE = _actualScore / _perfectScore;

if (MOTOR_POOL_SCORE == 0) then {
    TASK_DESTROY_VEHICLES_KAVALA setTaskState "Failed";
    ["TaskFailed", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
} else {
    TASK_DESTROY_VEHICLES_KAVALA setTaskState "Succeeded";
    ["TaskSucceeded", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
};


sleep random 5;

_isReady = [player, "xqzroloj1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

if (MOTOR_POOL_SCORE == 0) then {
    _isReady = [kostas, "apdzaahs4"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    _isReady = nil;
} else {
    _isReady = [kostas, "apdzaahs5"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    _isReady = nil;
};

_isReady = [player, "xqzroloj5"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs6"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj6"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

sleep 11;

_isReady = [player, "xqzroloj7"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "kxhvkroo1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj8"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "kxhvkroo2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj9"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "kxhvkroo3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj10"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_voiceSampleId = ["kxhvkroo4","kxhvkroo5","kxhvkroo6"] call BIS_fnc_selectRandom;

_isReady = [THE_CO, _voiceSampleId] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;
_voiceSampleId = nil;

_isReady = [player, "xqzroloj11"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "kxhvkroo7"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj12"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

waitUntil{
    sleep 5;
    if ((getPos player) distance (getMarkerPos "MARKER_CHRISTOS_HOUSE") < 50) exitWith {true};
    false
};

player allowDamage false;
cutText ["","BLACK OUT",7,false];
5 fadeSound 0;
sleep 7;

_repositionPos = getPos krya_nera_strider;


_theDate = date;

_yyyy = _theDate select 0;
_mm = _theDate select 1;
_dd = _theDate select 2;
_theDate = nil;

setDate [_yyyy, _mm, _dd, 0, 1];
_yyy = nil;
_mm = nil;
_dd = nil;

_tod = 4.0;
if (HAYMAKER_GLOBALS getVariable "WEATHER_IS_CONTROLLED") then {
    ((24 + _tod)*3600) setFog [0.6,0.1,5.0];
    ((24 + _tod)*3600) setRain 0.0;
    ((24 + _tod)*3600) setOvercast 0.4;
};
skipTime (24 + _tod + random 0.25);
_tod = nil;

if (HAYMAKER_GLOBALS getVariable "WEATHER_IS_CONTROLLED") then {
    (2*3600) setFog [0.02, 0.10, 2.3];
};



clearItemCargo krya_nera_strider;
clearWeaponCargo krya_nera_strider;
clearMagazineCargo krya_nera_strider;
krya_nera_strider addWeaponCargo ["srifle_LRR_F",1];
krya_nera_strider addMagazineCargo ["7Rnd_408_Mag",12];
krya_nera_strider addItemCargo ["optic_ACO_grn",1];
krya_nera_strider addItemCargo ["optic_SOS",1];
krya_nera_strider addItemCargo ["acc_flashlight",2];
krya_nera_strider addItemCargo ["FirstAidKit",6];
krya_nera_strider addWeaponCargo ["Laserdesignator",1];


clearItemCargo krya_nera_strider_gmg;
clearWeaponCargo krya_nera_strider_gmg;
clearMagazineCargo krya_nera_strider_gmg;
krya_nera_strider_gmg addWeaponCargo ["srifle_EBR_F",1];
krya_nera_strider_gmg addWeaponCargo ["SMG_01_F",1];
krya_nera_strider_gmg addMagazineCargo ["20Rnd_762x51_Mag",10];
krya_nera_strider_gmg addMagazineCargo ["30Rnd_45ACP_Mag_SMG_01",15];
krya_nera_strider_gmg addItemCargo ["optic_ACO_grn",1];
krya_nera_strider_gmg addItemCargo ["muzzle_snds_B",1];
krya_nera_strider_gmg addItemCargo ["muzzle_snds_acp",1];
krya_nera_strider_gmg addItemCargo ["acc_flashlight",2];
krya_nera_strider_gmg addItemCargo ["FirstAidKit",6];


clearItemCargo krya_nera_strider_hmg;
clearWeaponCargo krya_nera_strider_hmg;
clearMagazineCargo krya_nera_strider_hmg;
krya_nera_strider_hmg addWeaponCargo ["arifle_TRG21_F",1];
krya_nera_strider_hmg addWeaponCargo ["arifle_Mk20_F",1];
krya_nera_strider_hmg addMagazineCargo ["30Rnd_556x45_Stanag",15];
krya_nera_strider_hmg addMagazineCargo ["30Rnd_556x45_Stanag_Tracer_Green",15];
krya_nera_strider_hmg addItemCargo ["optic_ACO_grn",1];
krya_nera_strider_hmg addItemCargo ["acc_flashlight",2];
krya_nera_strider_hmg addItemCargo ["NVGoggles",3];
krya_nera_strider_hmg addItemCargo ["muzzle_snds_M",3];
krya_nera_strider_hmg addItemCargo ["FirstAidKit",6];

_radius = 50;
{
    private "_lightPos";
    private "_lightColor";
    private "_lightBrightness";

    _lightPos = [(getMarkerPos "MARKER_STAGING_AREA_QUARRY" select 0) - _radius/2 + random _radius,
                 (getMarkerPos "MARKER_STAGING_AREA_QUARRY" select 1) - _radius/2 + random _radius,
                 0.5];
    _lightColor = [0.5,0,1];
    _lightBrightness = 0.25;

    null = [_lightPos,_lightColor,_lightBrightness] execVM "scripts\create-light.sqf";

} forEach [1,2,3];

null = [_radius, _lightPos] spawn {

    private "_radius";
    private "_location";
    private "_lights";
    _radius = _this select 0;
    _location = _this select 1;

    waitUntil{
        sleep 300;
        if (daytime > 6.00) exitWith {true};
        false
    };

    _lights = _location nearObjects ["#lightpoint", _radius];
    {
        deleteVehicle _x;
    } forEach _lights;

};
_radius = nil;


{
    if (alive _x) then {
        [_x] joinSilent (group player);
    };
} forEach [sf0,sf1,sf2,sf3];


{
    if (alive _x) then {
        _x setPos getMarkerPos "MARKER_CHRISTOS_HOUSE";
        _x setFatigue 0;
        _x setUnitPos "AUTO";
    };
} forEach units group player;

player setPos [7454.68,16250.5,0.00133514];
player setDir 334;

MORTAR_TARGETS = [];

// move the striders to Topolia
krya_nera_strider_gmg setPos getMarkerPos "MARKER_STRIDER_GMG";
krya_nera_strider_hmg setPos getMarkerPos "MARKER_STRIDER_HMG";
krya_nera_strider setPos getMarkerPos "MARKER_STRIDER";

// now move the kavalaFuelTruck to the position previously occupied
// by krya_nera_strider
kavalaFuelTruck setPos _repositionPos;

// set the striders orientation
krya_nera_strider_gmg setDir 180 + random 20;
krya_nera_strider_hmg setDir 180 + random 20;
krya_nera_strider setDir 180 + random 20;

// unlock all positions on my vehicle for me, and unlock
// the other vehicles for everyone but me
krya_nera_strider lock 0;
krya_nera_strider_gmg lock 3;
krya_nera_strider_hmg lock 3;

// enable damaging the vehicles
krya_nera_strider allowDamage true;
krya_nera_strider_gmg allowDamage true;
krya_nera_strider_hmg allowDamage true;

// set the vehicles' fuel state
krya_nera_strider setFuel 0.05+random 0.1;
krya_nera_strider_gmg setFuel 0.05+random 0.1;
krya_nera_strider_hmg setFuel 0.05+random 0.1;

// set the thermal properties of the vehicles
_hot = 1.0;
_cold = 0.0;
_thermalImagingEngine = _hot;
_thermalImagingWheels = _cold;
_thermalImagingWeapon = _cold;
_thermalImagingPars = [_thermalImagingEngine, _thermalImagingWheels, _thermalImagingWeapon];

kavalaFuelTruck setVehicleTiPars _thermalImagingPars;
krya_nera_strider setVehicleTiPars _thermalImagingPars;
krya_nera_strider_gmg setVehicleTiPars _thermalImagingPars;
krya_nera_strider_hmg setVehicleTiPars _thermalImagingPars;



_gmgGroup = createGroup west;
"B_G_Soldier_TL_F" createUnit [ getMarkerPos "MARKER_STRIDER_GMG", _gmgGroup,"this moveInCommander krya_nera_strider_gmg;", 1.0, "sergeant"];
"B_G_Soldier_lite_F" createUnit [ getMarkerPos "MARKER_STRIDER_GMG", _gmgGroup,"this moveInGunner krya_nera_strider_gmg;", 1.0, "private"];
"B_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STRIDER_GMG", _gmgGroup,"this moveInDriver krya_nera_strider_gmg;", 1.0, "private"];

_gmgGroup setBehaviour "SAFE";

_hmgGroup = createGroup west;
"B_G_Soldier_TL_F" createUnit [ getMarkerPos "MARKER_STRIDER_HMG", _hmgGroup,"this moveInCommander krya_nera_strider_hmg;", 1.0, "sergeant"];
"B_G_Soldier_lite_F" createUnit [ getMarkerPos "MARKER_STRIDER_HMG", _hmgGroup,"this moveInGunner krya_nera_strider_hmg;", 1.0, "private"];
"B_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STRIDER_HMG", _hmgGroup,"this moveInDriver krya_nera_strider_hmg;", 1.0, "private"];

_hmgGroup setBehaviour "SAFE";


(group player) setBehaviour "SAFE";


{
    _x addWeapon "NVGoggles";
} forEach (crew krya_nera_strider_gmg);

{
    _x addWeapon "NVGoggles";
} forEach (crew krya_nera_strider_hmg);


{

    private "_barrier";

    _barrier = createVehicle ["Land_CncBarrierMedium4_F",_x select 0,[],0,"NONE"];
    _barrier setDir (_x select 1);

} forEach [[[5345.48,14529.5,0.00134087],73.962],
           [[5350.45,14519.7,0.00140572],54.1223],
           [[5355.65,14510.7,0.00116539],63.372],
           [[5355.73,14529.3,0.0014286],61.4842],
           [[5357.83,14517.9,0.00138092],56.5845]];


_group = createGroup EAST;
_varsuk = createVehicle ["O_MBT_02_cannon_F",[5651.19,14638.4,0.97583],[],0,"NONE"];
_varsuk setDir 302;
"O_officer_F" createUnit [ getMarkerPos "MARKER_VARSUK", _group, "this moveInCommander _varsuk", 1.0, "lieutenant"];
"O_crew_F" createUnit [ getMarkerPos "MARKER_VARSUK", _group, "this moveInGunner _varsuk", 1.0, "private"];
"O_crew_F" createUnit [ getMarkerPos "MARKER_VARSUK", _group, "this moveInDriver _varsuk", 1.0, "private"];



{
    private "_marker";
    private "_group";
    private "_staticAT";

    _marker = format["MARKER_AT_TEAM_%1",(_forEachIndex+1)];
    _group = createGroup EAST;
    _staticAT = createVehicle [ "O_static_AT_F", getMarkerPos _marker, [], 0 ,"NONE"];
    _staticAT setDir _x;
    "O_Soldier_lite_F" createUnit [ getMarkerPos _marker, _group, "this setDir _x; this moveInGunner _staticAT; this removePrimaryWeaponItem 'optic_ACO_grn';", 1.0, "private"];
    "O_spotter_F" createUnit [ getMarkerPos _marker, _group, "this setDir _x; this removePrimaryWeaponItem 'optic_ACO_grn';", 1.0, "sergeant"];

} forEach [70,350,10,119,90,10,220];


["MARKER_PERIMETER_SHJ",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";



kavalaRifleSquadAlpha = createGroup west;
"I_G_Soldier_A_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_medic_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_Soldier_LAT_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_Soldier_SL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];
"I_G_Soldier_TL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadAlpha];

kavalaRifleSquadBravo = createGroup west;
"I_G_Soldier_A_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_medic_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_Soldier_LAT_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_Soldier_SL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];
"I_G_Soldier_TL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadBravo];

kavalaRifleSquadCharlie = createGroup west;
"I_G_Soldier_A_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_medic_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_Soldier_LAT_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_Soldier_SL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];
"I_G_Soldier_TL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadCharlie];

kavalaRifleSquadDelta = createGroup west;
"I_G_Soldier_A_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_Soldier_AR_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_medic_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_Soldier_LAT_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_Soldier_SL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];
"I_G_Soldier_TL_F" createUnit [ getMarkerPos "MARKER_STAGING_AREA_QUARRY", kavalaRifleSquadDelta];



_men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
{
   if (side _x == EAST) then {
        null = [_x,300] execVM "scripts\look-out-for-mortar-targets-quarry-groups.sqf";
   };
} forEach _men;


_spawningComplete = [] execVM "scripts\spawn-fireteams-kavala-bases.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;


null = [] spawn {
    waitUntil {
        sleep 60;
        if (daytime > 5.75) exitWith {true};
        false
    };
    HAYMAKER_GLOBALS setVariable ["LOOKOUT_FOR_MORTAR_TARGETS", false];
};

5 fadeSound 1;
cutText ["A few hours later...","BLACK IN",8,false];
sleep 5;
player allowDamage true;


_isReady = [kostas, "apdzaahs7"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj13"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs8"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs9"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj14"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs10"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "xqzroloj15"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [kostas, "apdzaahs11"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


TASK_MEET_STRIDERS = player createSimpleTask ["TASKID_TASK_MEET_STRIDERS"];
TASK_MEET_STRIDERS setSimpleTaskDescription ["The convoy of Striders is waiting for you in <marker name='MARKER_TOPOLIA'>Topolia</marker>.","Hook up with Striders","Hook up with Striders"];
TASK_MEET_STRIDERS setSimpleTaskDestination (getMarkerPos "MARKER_TOPOLIA");
TASK_MEET_STRIDERS setTaskState "Assigned";
["TaskAssigned", ["","Hook up with Striders"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_MEET_STRIDERS;
TASK_MEET_STRIDERS_HAS_BEEN_ASSIGNED = true;


_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_TOPOLIA"];
_trig setTriggerArea[55,55,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND TASK_MEET_STRIDERS_HAS_BEEN_ASSIGNED","null = [] execVM 'scripts\joined-striders-at-topolia.sqf';",""];
_trig = nil;
