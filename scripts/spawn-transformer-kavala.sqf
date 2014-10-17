

private "_trig";

transformer = createVehicle ["Land_spp_Transformer_F" ,getMarkerPos "MARKER_TRANSFORMER_KAVALA",[],0,"CAN_COLLIDE"];      
transformer setDir 270;
transformer allowDamage false;


_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_TRANSFORMER_KAVALA"];
_trig setTriggerArea[7,7,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",true];
_trig setTriggerStatements["this AND POWER_PLANT_CAN_PLACE_EXPLOSIVES AND 'DemoCharge_Remote_Mag' in magazines player","null = [] execVM 'scripts\addaction-attach-explosives.sqf';","null = [] execVM 'scripts\removeaction-attach-explosives.sqf';"]; 



waitUntil{sleep 5; "DemoCharge_Remote_Ammo" in [typeOf ((attachedObjects transformer) select 0)]};

player sideChat "I just placed the explosives, sir.";

sleep 5 + random 2; 

kostas sideChat "Just remember these babies have 5-minute fuses, allright? Kostas out.";

sleep 6 + random 4;



sleep 10 + random 20;

TASK_DESTROY_VEHICLES_KAVALA = player createSimpleTask ["TASKID_DESTROY_VEHICLES_KAVALA"];
TASK_DESTROY_VEHICLES_KAVALA setSimpleTaskDescription ["Use the cover of darkness to infiltrate Kavala. Rig the vehicles in the <marker name='MARKER_MOTOR_POOL'>motorpool</marker> with explosives. Use your judgement to prioritize targets if there are too many vehicles to destroy them all.","Destroy vehicles","Destroy vehicles"];
TASK_DESTROY_VEHICLES_KAVALA setTaskState "Assigned";
["TaskAssigned", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
player setCurrentTask TASK_DESTROY_VEHICLES_KAVALA; 
TASK_DESTROY_VEHICLES_KAVALA_HAS_BEEN_ASSIGNED = true;





waitUntil{sleep 1; !alive transformer};

null = [1.00] execVM 'scripts\lights-out-aggelochori.sqf';




