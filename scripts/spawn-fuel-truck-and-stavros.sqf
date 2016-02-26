

private "_stavrosGroup";
private "_posStavros";
private "_posTruck";
private "_dirFaceTruck";
private "_trig";

THE_FUEL_TRUCK = createVehicle ["C_Van_01_fuel_F",(getMarkerPos "MARKER_SPAWN_FUEL_TRUCK"),[],0,"NONE"];
THE_FUEL_TRUCK setDir (random 360);
THE_FUEL_TRUCK setFuelCargo 0.17;
THE_FUEL_TRUCK setHit ["wheel_2_1_steering", 1.0];


_stavrosGroup = createGroup west;

"C_man_polo_5_F_euro"  createUnit [(getMarkerPos "MARKER_SPAWN_STAVROS"), _stavrosGroup, ""];

stavros = (units _stavrosGroup) select 0;
stavros disableAI "MOVE";

sleep 3;

_posStavros = getPos stavros;
_posTruck = getPos THE_FUEL_TRUCK;
_dirFaceTruck = [_posStavros,_posTruck] call HAYMAKER_fnc_calcDirection;

stavros setDir _dirFaceTruck;


_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_LOAD_FUEL"];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this AND TASK_LOAD_FUEL_HAS_BEEN_ASSIGNED AND ((fuel thehelicopter) > 0.90) AND ((getPos thehelicopter) distance (getPos THE_FUEL_TRUCK) < 20)","null = [] execVM 'scripts\got-fuel-from-stavros.sqf';",""];



