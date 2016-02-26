

private "_trig";

transformer = createVehicle ["Land_spp_Transformer_F" ,getMarkerPos "MARKER_TRANSFORMER_KAVALA",[],0,"CAN_COLLIDE"];
transformer setDir 270;
transformer allowDamage false;


_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_TRANSFORMER_KAVALA"];
_trig setTriggerArea[7,7,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",true];
_trig setTriggerStatements["this AND POWER_PLANT_CAN_PLACE_EXPLOSIVES AND 'DemoCharge_Remote_Mag' in magazines player","null = [] execVM 'scripts\addaction-attach-explosives.sqf';","null = [] execVM 'scripts\removeaction-attach-explosives.sqf';"];

