



if (alive player AND !ENDMISSION_REASON_THROWN) then {

    private "_endName";
    private "_isVictory";
    private "_fadeType";

    ENDMISSION_REASON_THROWN = true;

    _endName = "Win1";
    _isVictory = true;
    _fadeType = 10;

    activateKey "missionCompletedKey";
    sleep 1;

    [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;


};
