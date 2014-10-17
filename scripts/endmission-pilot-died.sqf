

waitUntil {sleep 5;!isnil "pilot"};

waitUntil {sleep 5;!alive pilot};

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