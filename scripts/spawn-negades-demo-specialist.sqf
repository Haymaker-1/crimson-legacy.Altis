

demoSpecialistVeh = createVehicle ["C_Offroad_01_F", getMarkerPos "MARKER_NEGADES",[],0,"NONE"];
demoSpecialistVeh setFuel 0.06;
demoSpecialistVeh setDir 270;
demoSpecialistVeh allowDamage false;
demoSpecialistVeh setVehicleLock "LOCKED"; 
//demoSpecialistVeh lockDriver true;
demoSpecialistVeh lockCargo true;

demoSpecialistVeh addBackpackCargo ["B_AssaultPack_rgr",1];
_moreBoom  = 2 + round (random 2);
demoSpecialistVeh addMagazineCargo ["DemoCharge_Remote_Mag",_moreBoom];
N_STICKS_DYNAMITE = N_STICKS_DYNAMITE + _moreBoom;

demoSpecialistGroup = createGroup west;
"C_man_hunter_1_F" createUnit [getMarkerPos "MARKER_NEGADES",demoSpecialistGroup];


demoSpecialist = units demoSpecialistGroup select 0;
demoSpecialist assignAsDriver demoSpecialistVeh;
demoSpecialist moveInDriver demoSpecialistVeh;
//demoSpecialist allowDamage false;
demoSpecialist allowFleeing 0.0; 
(group demoSpecialist) setGroupId ["IED Specialist","GroupColor4"];