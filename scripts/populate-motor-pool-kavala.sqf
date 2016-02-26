

private "_nVehsMax";
private "_nVehsPlaced";
private "_randNumbers";
private "_bubResult";
private "_markerName";
private "_spawnPos";
private "_vehType";
private "_trig";
private "_placementOffset";

"MARKER_MOTOR_POOL" setMarkerType "mil_dot";


_nVehsMax = 10;
_nVehsPlaced = 4 + floor random 5;

_randNumbers = [];
_randNumbers resize _nVehsMax;
{
    _randNumbers set [_forEachIndex,random 1]
} forEach _randNumbers;

_bubResult = [_randNumbers] call HAYMAKER_fnc_bubbleSort;


for "_i" from 0 to _nVehsPlaced-1 do {

    private "_markerName";
    private "_spawnPos";
    private "_vehType";
    private "_veh";
    private "_placementOffset";
    private "_trig";
    _markerName = format ["MARKER_MOTOR_POOL_KAVALA_VEH_%1",((_bubResult select 1) select _i) + 1];
    _spawnPos = getMarkerPos _markerName;
    _vehType = ["O_APC_Tracked_02_cannon_F",
                "O_APC_Wheeled_02_rcws_F",
                "O_MRAP_02_gmg_F",
                "O_MRAP_02_hmg_F",
                "O_Quadbike_01_F",
                "O_Truck_02_transport_F",
                "O_Truck_02_covered_F"] call BIS_fnc_selectRandom;
    _veh = createVehicle [_vehType,_spawnPos,[],0,"NONE"];
    _veh setDir 131 + (round random 1) * 180 - 5 + random 10;
    _veh lock true;
    clearWeaponCargo _veh;
    clearMagazineCargo _veh;
    clearBackpackCargo _veh;
    clearItemCargo _veh;


    _placementOffset = nil;
    switch (_vehType) do
    {
        case "O_APC_Tracked_02_cannon_F": {_placementOffset = [0,-4.4,-1.5] };
        case "O_APC_Wheeled_02_rcws_F":   {_placementOffset = [0.3,-4.3925,-1] };
        case "O_MRAP_02_gmg_F":   {_placementOffset = [0.3,-4.4,-1.2] };
        case "O_MRAP_02_hmg_F":   {_placementOffset = [0.3,-4.4,-1.2] };
        case "O_MRAP_02_F":   {_placementOffset =  [-0.2,-4.3,-0.9] };
        case "O_Quadbike_01_F":   {_placementOffset =  [0,-0.87,-0.9] };
        case "O_Truck_02_transport_F":   {_placementOffset =  [-0.88,1.1,-1.2] };
        case "O_Truck_02_covered_F":   {_placementOffset =  [-0.88,1.1,-1.2] };
    };

    _trig = createTrigger["EmptyDetector",getPos _veh];
    _trig setTriggerArea[3,3,0,false];
    _trig triggerAttachVehicle [player];
    _trig setTriggerActivation["VEHICLE","PRESENT",true];
    _trig setTriggerStatements["this AND 'DemoCharge_Remote_Mag' in magazines player","null = [] execVM 'scripts\addaction-attach-explosives.sqf';","null = [] execVM 'scripts\removeaction-attach-explosives.sqf';"];

    _trig attachTo [_veh,_placementOffset];

};


// spawn fuel truck at one of the remaining empty positions:

_markerName = format ["MARKER_MOTOR_POOL_KAVALA_VEH_%1",((_bubResult select 1) select _nVehsPlaced) + 1];
_spawnPos = getMarkerPos _markerName;
_vehType = "O_Truck_02_fuel_F";
kavalaFuelTruck = createVehicle [_vehType,_spawnPos,[],0,"NONE"];
kavalaFuelTruck setDir 131 + (round random 1) * 180 - 5 + random 10;
kavalaFuelTruck lock true;
kavalaFuelTruck setFuel 0.3 + random 0.2;
kavalaFuelTruck lockCargo true;
kavalaFuelTruck allowDamage false;

_trig = createTrigger["EmptyDetector",getPos kavalaFuelTruck];
_trig setTriggerArea[7,7,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this","null = [] execVM 'scripts\radio-conversation-about-fuel-truck-kavala.sqf';",""];

_placementOffset =  [-0.88,1.1,-1.2] ;
_trig attachTo [kavalaFuelTruck,_placementOffset];


waitUntil{
    sleep 5;
    if (player in crew kavalaFuelTruck) exitWith {true};
    false
};

deleteVehicle _trig;
kavalaFuelTruck setSide west;
