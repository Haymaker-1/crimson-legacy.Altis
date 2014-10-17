

_headgearArray = ["H_Beret_blk",
                  "H_Beret_grn",
                  "H_Beret_grn_SF",
                  "H_Shemag_khk",
                  "H_Shemag_tan",
                  "H_ShemagOpen_khk",
                  "H_ShemagOpen_tan",
                  "H_TurbanO_blk",
                  "H_Booniehat_indp",
                  "H_Cap_oli",
                  "H_Cap_blk_Raven",
                  "H_Cap_tan",
                  "H_Booniehat_khk",
                  "H_Booniehat_mcamo",
                  "H_Booniehat_grn",
                  "H_Booniehat_tan",
                  "H_Booniehat_dirty",
                  "H_Booniehat_dgtl",
                  "H_Bandmask_blk"];

MARID_KAVALA_1_GROUP = createGroup east;
MARID_KAVALA_1 = createVehicle ["O_APC_Wheeled_02_rcws_F",(getMarkerPos "MARKER_MARID_KAVALA_1"),[],0,"NONE"];
MARID_KAVALA_1 setDir 17.0;
MARID_KAVALA_1 lock true;


"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_1"),
                            MARID_KAVALA_1_GROUP,
                            "this assignAsDriver MARID_KAVALA_1; this moveInDriver MARID_KAVALA_1"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_1"),
                            MARID_KAVALA_1_GROUP,
                            "this assignAsGunner MARID_KAVALA_1; this moveInGunner MARID_KAVALA_1"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_1"),
                            MARID_KAVALA_1_GROUP,
                            "this assignAsCommander MARID_KAVALA_1; this moveInCommander MARID_KAVALA_1"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_1"),
                            MARID_KAVALA_1_GROUP,
                            "this assignAsCargoIndex [MARID_KAVALA_1,0]; this moveInCargo MARID_KAVALA_1;"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_1"),
                            MARID_KAVALA_1_GROUP,
                            "this assignAsCargoIndex [MARID_KAVALA_1,1]; this moveInCargo MARID_KAVALA_1;"];
                            
"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_1"),
                            MARID_KAVALA_1_GROUP,
                            "this assignAsCargoIndex [MARID_KAVALA_1,2]; this moveInCargo MARID_KAVALA_1;"];
                            

{
    removeHeadGear _x;
    _headgear = _headgearArray call BIS_fnc_selectRandom;
    _x addHeadGear _headgear;
} forEach units MARID_KAVALA_1_GROUP;



MARID_KAVALA_2_GROUP = createGroup east;
MARID_KAVALA_2 = createVehicle ["O_APC_Wheeled_02_rcws_F",(getMarkerPos "MARKER_MARID_KAVALA_2"),[],0,"NONE"];
MARID_KAVALA_2 setDir 60.0;
MARID_KAVALA_2 lock true;




"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_2"),
                            MARID_KAVALA_2_GROUP,
                            "this assignAsDriver MARID_KAVALA_2; this moveInDriver MARID_KAVALA_2"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_2"),
                            MARID_KAVALA_2_GROUP,
                            "this assignAsGunner MARID_KAVALA_2; this moveInGunner MARID_KAVALA_2"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_2"),
                            MARID_KAVALA_2_GROUP,
                            "this assignAsCommander MARID_KAVALA_2; this moveInCommander MARID_KAVALA_2"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_2"),
                            MARID_KAVALA_2_GROUP,
                            "this assignAsCargoIndex [MARID_KAVALA_2,0]; this moveInCargo MARID_KAVALA_2;"];

"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_2"),
                            MARID_KAVALA_2_GROUP,
                            "this assignAsCargoIndex [MARID_KAVALA_2,1]; this moveInCargo MARID_KAVALA_2;"];
                            
"O_Soldier_F"  createUnit [(getMarkerPos "MARKER_MARID_KAVALA_2"),
                            MARID_KAVALA_2_GROUP,
                            "this assignAsCargoIndex [MARID_KAVALA_2,2]; this moveInCargo MARID_KAVALA_2;"];
                            

{
    removeHeadGear _x;
    _headgear = _headgearArray call BIS_fnc_selectRandom;
    _x addHeadGear _headgear;
} forEach units MARID_KAVALA_1_GROUP;


