
NUMBER_OF_CONVOY_VEHICLES_DESTROYED = 0;

waitUntil {
    sleep 5;
    if (!isnil("TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED")) exitWith {true};
    false
};

waitUntil {
    sleep 5;
    if (TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED) exitWith {true};
    false
};

{
    null = [_x] execVM "scripts\monitor-if-convoy-vehicle-is-alive.sqf";
} forEach [convoyIfritGMG,convoyIfritHMG,convoyZamak];


while {CAN_ASSIGN_DESTROY_CONVOY_VEHICLES} do {

    if (NUMBER_OF_CONVOY_VEHICLES_DESTROYED==3) then {
        CAN_ASSIGN_DESTROY_CONVOY_VEHICLES = false;
        TASK_DESTROY_CONVOY_VEHICLES setTaskState "Succeeded";
        ["TaskSucceeded", ["","Destroy vehicles"]] call BIS_fnc_showNotification;
        sleep 5;
    };
    sleep 5;
};




