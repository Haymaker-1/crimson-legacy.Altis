



_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_TRANSFORMER_KAVALA"];
_trig setTriggerArea[7,7,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",true];
_trig setTriggerStatements["this AND POWER_PLANT_SEIZED","hint 'place a charge'",""]; 

