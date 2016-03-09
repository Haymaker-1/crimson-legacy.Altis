

private "_moreBoom";
private "_grp";
private "_veh";

_veh = createVehicle ["C_Offroad_01_F", getMarkerPos "MARKER_NEGADES",[],0,"NONE"];
_veh setFuel 0.06;
_veh setDir 270;
_veh allowDamage false;
_veh setVehicleLock "LOCKED";
_veh lockCargo true;

_veh addBackpackCargo ["B_AssaultPack_rgr",1];
_moreBoom  = 2 + round (random 2);
_veh addMagazineCargo ["DemoCharge_Remote_Mag",_moreBoom];
N_STICKS_DYNAMITE = N_STICKS_DYNAMITE + _moreBoom;

_grp = createGroup west;
"C_man_hunter_1_F" createUnit [getMarkerPos "MARKER_NEGADES", _grp];


demoSpecialist = units _grp select 0;
demoSpecialist assignAsDriver _veh;
demoSpecialist moveInDriver _veh;
demoSpecialist allowFleeing 0.0;
_grp setGroupId ["IED Specialist","GroupColor4"];