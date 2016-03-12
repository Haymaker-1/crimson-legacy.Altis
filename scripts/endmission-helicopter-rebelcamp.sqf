
waitUntil
{
	private "_cond1";
	private "_cond2";
    sleep 5;
	_cond1 = HAYMAKER_GLOBALS getVariable "TASK_MEET_KOSTAS_HAS_BEEN_ASSIGNED";
	_cond2 = (fuel thehelicopter) == 0;
    if (_cond1 AND _cond2) exitWith {true};
    false
};

sleep 30;


if (alive player AND !ENDMISSION_REASON_THROWN) then {
    if (!HAYMAKER_GLOBALS getVariable "TRIGGER_LANDED_AT_REBEL_CAMP_FIRED") then {

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
