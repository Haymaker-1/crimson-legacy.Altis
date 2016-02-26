
waitUntil
{
    sleep 5;
    if (TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED AND ((fuel thehelicopter) == 0)) exitWith {true};
    false
};

sleep 30;


if (alive player AND !ENDMISSION_REASON_THROWN) then {
    if (!TRIGGER_LANDED_AT_REBEL_CAMP_FIRED) then {

        private "_endName";
        private "_isVictory";
        private "_fadeType";

        ENDMISSION_REASON_THROWN = true;

        _endName = "End5";
        _isVictory = false;
        _fadeType = true;

        sleep 1;

        [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;

    };
};
