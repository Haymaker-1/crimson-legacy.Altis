
while {false in OUTLIVED_HIS_USEFULNESS} do {
    {
        if (!(OUTLIVED_HIS_USEFULNESS select _forEachIndex) AND (!alive _x)) then {

            private "_endName";
            private "_isVictory";
            private "_fadeType";

            _endName = "End1";
            _isVictory = false;
            _fadeType = true;

            if (alive player AND !HAYMAKER_GLOBALS getVariable "ENDMISSION_REASON_THROWN") then {
                HAYMAKER_GLOBALS setVariable ["ENDMISSION_REASON_THROWN", true];
                [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
            };

        };
    } forEach [sf0,sf1,sf2,sf3];
    sleep 5;
};
