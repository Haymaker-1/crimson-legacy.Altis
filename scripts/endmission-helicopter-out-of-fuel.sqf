
waitUntil 
{
    sleep 5;
    if ((NEED_HELO AND ((getMarkerPos "MARKER_REBEL_CAMP_HELIPAD" distance getPos thehelicopter)>50) AND ((fuel thehelicopter) == 0))) exitWith {true};
    false
};

_endName = "End3";
_isVictory = false;
_fadeType = true;


sleep 15;

if (alive player AND !ENDMISSION_REASON_THROWN) then
{
    ENDMISSION_REASON_THROWN = true;
    [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
};

