
waitUntil {
    sleep 5;
    if (!isnil "TASK_FIND_CRASH_SITE") exitWith {true};
    false
};

while {isnil "TASK_FREE_PILOT"} do {

    private "_nAlive";

    _nAlive = 0;
    {
        if (alive _x) then {
            _nAlive = _nAlive + 1;
        };
    } forEach [sf0,sf1,sf2,sf3];

    if (_nAlive < 1) then {

        private "_endName";
        private "_isVictory";
        private "_fadeType";

        _endName = "End1";
        _isVictory = false;
        _fadeType = true;

        if (alive player AND !ENDMISSION_REASON_THROWN) then {
            ENDMISSION_REASON_THROWN = true;
            [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
        };

    };

    sleep 5;
};
