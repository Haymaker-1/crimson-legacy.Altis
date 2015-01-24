

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

if (alive player AND !ENDMISSION_REASON_THROWN) then
{

    if (!PILOT_EGRESS_WAS_SUCCESSFUL) then
    {
        ENDMISSION_REASON_THROWN = true;
        _endName = "End4";
        _isVictory = false;
        _fadeType = true;

        [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
    };
    
};