
private "_endName";
private "_isVictory";
private "_fadeType";
private "_cond1";
private "_cond2";
private "_cond3";
private "_cond4";

waitUntil
{
    sleep 5;
	_cond1 = HAYMAKER_GLOBALS getVariable "NEED_HELO";
	_cond2 = (getMarkerPos "MARKER_REBEL_CAMP_HELIPAD" distance getPos thehelicopter) > 50;
	_cond3 = (fuel thehelicopter) == 0;
    if (_cond1 AND _cond2 AND _cond3) exitWith {true};
    false
};

_endName = "End3";
_isVictory = false;
_fadeType = true;


sleep 15;

if (alive player AND !HAYMAKER_GLOBALS getVariable "ENDMISSION_REASON_THROWN") then {
    HAYMAKER_GLOBALS setVariable ["ENDMISSION_REASON_THROWN", true];
    [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
};
