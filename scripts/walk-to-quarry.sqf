

_perimeter = ["MARKER_PERIMETER_FKS_KAVALA"] call HAYMAKER_fnc_constructPerimeter;
_pos = getPos kavalaFuelTruck;
_windingNumber = [_perimeter,_pos] call HAYMAKER_fnc_calcWindingNumber;
if (_windingNumber != 0) then {
    TASK_STEAL_KAVALA_FUEL_TRUCK setTaskState "Failed";
    ["TaskFailed", ["","Steal fuel truck"]] call BIS_fnc_showNotification;
    
    sleep 10;
    
    TASK_LEAVE_KAVALA = player createSimpleTask ["TASKID_LEAVE_KAVALA"];
    TASK_LEAVE_KAVALA setSimpleTaskDescription ["The fuel truck was immobilized. Escape Kavala on foot.","Escape Kavala","Escape Kavala"];
    TASK_LEAVE_KAVALA setTaskState "Assigned";
    ["TaskAssigned", ["","Escape Kavala"]] call BIS_fnc_showNotification;
    player setCurrentTask TASK_LEAVE_KAVALA; 
    TASK_LEAVE_KAVALA_HAS_BEEN_ASSIGNED = true;
    
} 
else {
    TASK_STEAL_KAVALA_FUEL_TRUCK setTaskState "Succeeded";
    ["TaskSucceeded", ["","Steal fuel truck"]] call BIS_fnc_showNotification;
};

sleep 10;

waitUntil{
    sleep 5; 
    _windingNumber = [_perimeter,(getPos player)] call HAYMAKER_fnc_calcWindingNumber; 
    _cond1 = _windingNumber == 0;
    _cond2 = ((getPos player) distance (getMarkerPos "MARKER_MOTOR_POOL_REPOSITION")) > 300;
    _cond3 = ((getPos player) distance (getMarkerPos "MARKER_MOTOR_POOL")) > 150;
    _cond1 AND _cond2 AND _cond3
};
    
if (TASK_LEAVE_KAVALA_HAS_BEEN_ASSIGNED) then {    
    TASK_LEAVE_KAVALA setTaskState "Succeeded";
    ["TaskSucceeded", ["","Escape Kavala"]] call BIS_fnc_showNotification;
};


_radius = 100;
_vehiclesMotorpool = nearestObjects [(getMarkerPos "MARKER_MOTOR_POOL"),["Car","Tank"],_radius];

_actualScore = 0;
_perfectScore = 0;

{
    _x allowDamage false;
} forEach _vehiclesMotorpool;

{
    _veh = _x;
    _vehicleType = typeOf _veh;
    _addRatingValue = [_vehicleType] call HAYMAKER_fnc_getAddRatingValueExplosives;
    _perfectScore = _perfectScore + _addRatingValue;
    
    _hasAttachedExplosives = "DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects _veh) select 0)];
    if ((!alive _veh) OR _hasAttachedExplosives) then {
        _actualScore = _actualScore + _addRatingValue;
    } 
    else {
        _excludedVehicles = ["O_MRAP_02_F","O_Quadbike_01_F","O_Truck_02_transport_F","O_Truck_02_covered_F"];
        if (!(typeOf _veh in _excludedVehicles)) then {
        
            _repositionRadius = 70;
            _repositionPos = [((getMarkerPos "MARKER_MOTOR_POOL_REPOSITION") select 0) - _repositionRadius/2 + random _repositionRadius,
                              ((getMarkerPos "MARKER_MOTOR_POOL_REPOSITION") select 1) - _repositionRadius/2 + random _repositionRadius,
                              ((getMarkerPos "MARKER_MOTOR_POOL_REPOSITION") select 2)];
            _veh setPos _repositionPos;

            createVehicleCrew _veh;
            _grp = group ((crew _veh) select 0);
            _dest = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;
            _wp = _grp addWaypoint [_dest, 20];
            _wp setWaypointSpeed "LIMITED";
            _wp setWaypointBehaviour "CARELESS";
            _wp setWaypointCompletionRadius 100;
        };
    };

} forEach _vehiclesMotorpool;

{
    _x allowDamage true;
} forEach _vehiclesMotorpool;

MOTOR_POOL_SCORE = _actualScore/_perfectScore;

sleep 10;
if (MOTOR_POOL_SCORE == 0) then {
    TASK_DESTROY_VEHICLES_KAVALA setTaskState "Failed";
    ["TaskFailed", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
} 
else {
    TASK_DESTROY_VEHICLES_KAVALA setTaskState "Succeeded";
    ["TaskSucceeded", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
};


sleep 10;

_isReady = [player, "pobbanfx1"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx2"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx3"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_vehName1 = getText (configFile >> "CfgVehicles" >> "I_MRAP_03_hmg_F" >> "displayName");
_vehName2 = getText (configFile >> "CfgVehicles" >> "I_MRAP_03_gmg_F" >> "displayName");

_isReady = [player, "pobbanfx4"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

if (MOTOR_POOL_SCORE == 0) then {
    _isReady = [kostas, "lrxfuuzi4"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{sleep 1; scriptDone _isReady};
}
else {
    _isReady = [kostas, "lrxfuuzi5"] execVM "scripts\unitradiospeak.sqf";
    waitUntil{sleep 1; scriptDone _isReady};
};

_isReady = [player, "pobbanfx5"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi6"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};


_isReady = [player, "pobbanfx6"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

sleep 10;

_isReady = [player, "pobbanfx7"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, sawfkwnw1] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_vehTypeName = getText (configFile >> "CfgVehicles" >> "I_MRAP_03_hmg_F" >> "textPlural");

_isReady = [player, "pobbanfx8"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, sawfkwnw2] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx9"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

sleep 10;

sleep 5;

_isReady = [player, "pobbanfx10"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi7"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx11"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx12"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi8"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx13"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi9"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx14"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi10"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};


TASK_MEET_AT_QUARRY = player createSimpleTask ["TASKID_MEET_AT_QUARRY"];
TASK_MEET_AT_QUARRY setSimpleTaskDescription ["Make your way to the <marker name='MARKER_STAGING_AREA_QUARRY'>quarry</marker> in the hills east of Kavala, and meet up with the rifle squads that are already present at there.","Move to staging area","Move to staging area"];
TASK_MEET_AT_QUARRY setSimpleTaskDestination (getMarkerPos "MARKER_STAGING_AREA_QUARRY");
TASK_MEET_AT_QUARRY setTaskState "Assigned";
["TaskAssigned", ["","Move to staging area"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_MEET_AT_QUARRY; 



_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_STAGING_AREA_QUARRY"];
_trig setTriggerArea[111,111,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND TASK_MEET_AT_QUARRY_HAS_BEEN_ASSIGNED","null = [true] execVM 'scripts\assault-kavala.sqf';",""]; 


sleep 10;


player allowDamage false;
cutText ["","BLACK OUT",7,false];
5 fadeSound 0;
sleep 7;

_theDate = date;

_yyyy = _theDate select 0;
_mm = _theDate select 1;
_dd = _theDate select 2;

setDate [_yyyy, _mm, _dd, 0, 1];

_tod = 4.75;
((24 + _tod)*3600) setFog [0.6,0.1,5.0];
((24 + _tod)*3600) setRain 0.0;
((24 + _tod)*3600) setOvercast 0.4;
skiptime (24 + _tod + random 0.25);
(2*3600) setFog [0.02, 0.10, 2.3];

 
_radius = 50;
{
    _lightPos = [(getMarkerPos "MARKER_STAGING_AREA_QUARRY" select 0) - _radius/2 + random _radius,
                 (getMarkerPos "MARKER_STAGING_AREA_QUARRY" select 1) - _radius/2 + random _radius,
                 0.5];
    _lightColor = [0.5,0,1];
    _lightBrightness = 0.25;
    
    null = [_lightPos,_lightColor,_lightBrightness] execVM "scripts\create-light.sqf";
} forEach [1,2,3];


null = [_radius,_location] spawn {

    _radius = _this select 0;
    _location = _this select 1;
    _lights = _location nearObjects ["#lightpoint",_radius];
    
    waitUntil{sleep 300; daytime > 6.00};
    
    {
        deleteVehicle _x;
    } forEach _lights;
    
};


{
    if (alive _x) then {
        _x setPos getMarkerPos "MARKER_STAGING_AREA_QUARRY_WALKING";
        _x setDir 260 + random 20;
        _x setFatigue 0.9;
        _x doFollow player;
        _x setUnitPos "UP";
        _x switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
    };
} forEach units group player;
(group player) setCombatMode "RED";
(group player) setBehaviour "SAFE";


{ 
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
    _marker = format["MARKER_AT_TEAM_%1",(_forEachIndex+1)];
    _group = createGroup EAST;
    _staticAT = createVehicle [ "O_static_AT_F", getMarkerPos _marker, [], 0 ,"NONE"];
    _staticAT setDir _x;
    "O_Soldier_lite_F" createUnit [ getMarkerPos _marker, _group, "this setDir _x; this moveInGunner _staticAT", 1.0, "private"];
    "O_spotter_F" createUnit [ getMarkerPos _marker, _group, "this setDir _x;", 1.0, "sergeant"];

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



TASK_MEET_AT_QUARRY_HAS_BEEN_ASSIGNED = true;



5 fadeSound 1;
cutText ["A few hours later in the \nhills east of Kavala...","BLACK IN",8,false];
sleep 5;
player allowDamage true;


_isReady = [kostas, "lrxfuuzi11"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx15"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [kostas, "lrxfuuzi12"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx16"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "pobbanfx17"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};



















