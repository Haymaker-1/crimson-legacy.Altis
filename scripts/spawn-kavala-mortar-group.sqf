


mortarGroup = createGroup EAST;
"O_Soldier_TL_F" createUnit [getMarkerPos "MARKER_MORTAR_SPAWN", mortarGroup, "mortarGroup selectLeader this; this allowDamage false;", 0.5, "sergeant"];
"O_support_Mort_F" createUnit [getMarkerPos "MARKER_MORTAR_SPAWN", mortarGroup, "mortarGunner = this; this allowDamage false; removeBackpack this;", 0.5, "corporal"];
"O_support_AMort_F" createUnit [getMarkerPos "MARKER_MORTAR_SPAWN", mortarGroup, "this allowDamage false; ", 0.5, "private"];


mortar1 = createVehicle ["O_Mortar_01_F",getMarkerPos "MARKER_MORTAR_SPAWN",[],0,"NONE"];  

{
    mortar1 removeMagazine _x;
} forEach magazines mortar1;

mortar1 addMagazine ["8Rnd_82mm_Mo_Flare_white",10];


mortarGunner moveInGunner mortar1;



null = [] execVM "scripts\kavala-mortar-group-standby-for-firemission.sqf";