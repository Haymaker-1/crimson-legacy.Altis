

demoSpecialistVeh = createVehicle ["C_Offroad_01_F", getMarkerPos "MARKER_NEGADES",[],0,"NONE"];
demoSpecialistVeh setFuel 0.06;
demoSpecialistVeh setDir 270;
demoSpecialistVeh allowDamage false;
demoSpecialistVeh setVehicleLock "LOCKED"; 
//demoSpecialistVeh lockDriver true;
demoSpecialistVeh lockCargo true;

demoSpecialistVeh addBackpackCargo ["B_AssaultPack_rgr",1];
N_STICKS_DYNAMITE = 4 + random 3;
demoSpecialistVeh addMagazineCargo ["DemoCharge_Remote_Mag",N_STICKS_DYNAMITE];


demoSpecialistGroup = createGroup west;
"C_man_hunter_1_F" createUnit [getMarkerPos "MARKER_NEGADES",demoSpecialistGroup];


demoSpecialist = units demoSpecialistGroup select 0;
demoSpecialist assignAsDriver demoSpecialistVeh;
demoSpecialist moveInDriver demoSpecialistVeh;
demoSpecialist allowDamage false;
demoSpecialist allowFleeing 0.0; 
(group demoSpecialist) setGroupId ["IED Specialist","GroupColor4"];