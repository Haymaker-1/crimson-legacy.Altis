

private "_hitHRotorThreshold";
private "_hitEngineThreshold";
private "_endName";
private "_isVictory";
private "_fadeType";


_hitHRotorThreshold = 0.9;
_hitEngineThreshold = 0.9;



waitUntil
{
    sleep 5;
    if (((thehelicopter getHitPointDamage "HitHRotor") > _hitHRotorThreshold) OR ((thehelicopter getHitPointDamage "HitEngine") > _hitEngineThreshold)) exitWith {true};
    false
};

_endName = "End2";
_isVictory = false;
_fadeType = true;

sleep 15;
if (alive player AND !HAYMAKER_GLOBALS getVariable "ENDMISSION_REASON_THROWN") then
{
    HAYMAKER_GLOBALS setVariable ["ENDMISSION_REASON_THROWN", true];
    [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
};
