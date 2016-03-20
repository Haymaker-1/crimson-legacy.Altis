




CAN_ASSIGN_DESTROY_CONVOY_VEHICLES = false;

TASK_MOVE_PILOT_TO_REBEL_CAMP setTaskState "Succeeded";
["TaskSucceeded", ["","Return to rebel camp"]] call BIS_fnc_showNotification;


waitUntil {
    sleep 5;
    if (HAYMAKER_GLOBALS getVariable "EVERYBODY_IS_DONE_TALKING") exitWith {true};
    false
};

HAYMAKER_GLOBALS setVariable ["EVERYBODY_IS_DONE_TALKING", !(HAYMAKER_GLOBALS getVariable "EVERYBODY_IS_DONE_TALKING")];
null = execVM "scripts\radio-conversation-about-pilot-egress.sqf";
HAYMAKER_GLOBALS setVariable ["EVERYBODY_IS_DONE_TALKING", !(HAYMAKER_GLOBALS getVariable "EVERYBODY_IS_DONE_TALKING")];



if (HAYMAKER_GLOBALS getVariable "TASK_DESTROY_CONVOY_VEHICLES_HAS_BEEN_ASSIGNED") then {
    private = "_pos1";
    private = "_pos2";
    _pos1 = getMarkerPos "MARKER_CAPTURED_PILOT_LOCATION";
    _pos2 = getMarkerPos "MARKER_REPOSITION_CONVOY";
    {
        if (alive _x) then {
            private = "_pos3";
            private = "_deltax";
            private = "_deltay";
            private = "_pos4";
            _pos3 = getPos _x;
            _deltax = (_pos3 select 0) - (_pos1 select 0);
            _deltay = (_pos3 select 1) - (_pos1 select 1);
            _pos4 = [(_pos2 select 0) + _deltax, (_pos2 select 1) + _deltay, 0];
            _x setPos _pos4;
        };
    } forEach (units convoyIfritGMGGroup + units convoyIfritHMGGroup + units convoyZamakGroup +
               crew convoyIfritGMG       + crew convoyIfritHMG       + crew convoyZamak);



    if !((convoyIfritGMG getHitPointDamage "HitEngine" > 0.90) OR
        (convoyIfritGMG getHitPointDamage "HitLFWheel" == 1.00) OR
        (convoyIfritGMG getHitPointDamage "HitLF2Wheel" == 1.00) OR
        (convoyIfritGMG getHitPointDamage "HitRFWheel" == 1.00) OR
        (convoyIfritGMG getHitPointDamage "HitRF2Wheel" == 1.00) ) then {
        private = "_pos3";
        private = "_deltax";
        private = "_deltay";
        private = "_pos4";
        _pos3 = getPos convoyIfritGMG;
        _deltax = (_pos3 select 0) - (_pos1 select 0);
        _deltay = (_pos3 select 1) - (_pos1 select 1);
        _pos4 = [(_pos2 select 0) + _deltax, (_pos2 select 1) + _deltay, 0];
        convoyIfritGMG setPos _pos4;
    };

    if !((convoyIfritHMG getHitPointDamage "HitEngine" > 0.90) OR
        (convoyIfritHMG getHitPointDamage "HitLFWheel" == 1.00) OR
        (convoyIfritHMG getHitPointDamage "HitLF2Wheel" == 1.00) OR
        (convoyIfritHMG getHitPointDamage "HitRFWheel" == 1.00) OR
        (convoyIfritHMG getHitPointDamage "HitRF2Wheel" == 1.00) ) then {
        private = "_pos3";
        private = "_deltax";
        private = "_deltay";
        private = "_pos4";
        _pos3 = getPos convoyIfritHMG;
        _deltax = (_pos3 select 0) - (_pos1 select 0);
        _deltay = (_pos3 select 1) - (_pos1 select 1);
        _pos4 = [(_pos2 select 0) + _deltax, (_pos2 select 1) + _deltay, 0];
        convoyIfritHMG setPos _pos4;
    };


    if !((convoyZamak getHitPointDamage "HitEngine" > 0.90) OR
        (convoyZamak getHitPointDamage "HitLFWheel" == 1.00) OR
        (convoyZamak getHitPointDamage "HitRFWheel" == 1.00) OR
        ((convoyZamak getHitPointDamage "HitLF2Wheel" == 1.00) AND (convoyZamak getHitPointDamage "HitLBWheel" == 1.00)) OR
        ((convoyZamak getHitPointDamage "HitRF2Wheel" == 1.00) AND (convoyZamak getHitPointDamage "HitRBWheel" == 1.00)) OR
        (convoyZamak getHitPointDamage "HitRF2Wheel" == 1.00) ) then {
        private = "_pos3";
        private = "_deltax";
        private = "_deltay";
        private = "_pos4";
        _pos3 = getPos convoyZamak;
        _deltax = (_pos3 select 0) - (_pos1 select 0);
        _deltay = (_pos3 select 1) - (_pos1 select 1);
        _pos4 = [(_pos2 select 0) + _deltax, (_pos2 select 1) + _deltay, 0];
        convoyZamak setPos _pos4;
    };


    if (NUMBER_OF_CONVOY_VEHICLES_DESTROYED < 3) then {
        TASK_DESTROY_CONVOY_VEHICLES setTaskState "Canceled";
        ["TaskCanceled", ["",format ["Destroy vehicles (%1 remaining)", 3 - NUMBER_OF_CONVOY_VEHICLES_DESTROYED]]] call BIS_fnc_showNotification;
    };
};
