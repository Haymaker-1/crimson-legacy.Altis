

private "_veh";
private "_taskDescriptionParts";



_veh = _this select 0;

while {alive _veh} do {
    sleep 5;
};

NUMBER_OF_CONVOY_VEHICLES_DESTROYED = NUMBER_OF_CONVOY_VEHICLES_DESTROYED + 1;


_taskDescriptionParts = taskDescription TASK_DESTROY_CONVOY_VEHICLES;
_taskDescriptionParts set [1,format ["Destroy vehicles (%1/3)",NUMBER_OF_CONVOY_VEHICLES_DESTROYED]];

TASK_DESTROY_CONVOY_VEHICLES setSimpleTaskDescription _taskDescriptionParts;
