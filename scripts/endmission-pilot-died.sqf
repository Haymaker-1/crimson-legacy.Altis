

waitUntil {
    sleep 5;
    if (!isnil "pilot") exitWith {true};
    false
};

waitUntil {
    sleep 5;
    if (!alive pilot) exitWith {true};
    false
};

if (alive player AND !(HAYMAKER_GLOBALS getVariable "ENDMISSION_REASON_THROWN")) then {

    if (!(HAYMAKER_GLOBALS getVariable "PILOT_EGRESS_WAS_SUCCESSFUL")) then {

        private "_endName";
        private "_isVictory";
        private "_fadeType";

        HAYMAKER_GLOBALS setVariable ["ENDMISSION_REASON_THROWN", true];

        _endName = "End4";
        _isVictory = false;
        _fadeType = true;

        [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
    };

};
