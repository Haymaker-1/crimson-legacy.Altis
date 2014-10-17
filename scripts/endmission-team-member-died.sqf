
_keepGoing = true;
while {_keepGoing} do
{
    {
        if (!(OUTLIVED_HIS_USEFULNESS select _forEachIndex) AND (!alive _x)) then 
        {
            _keepGoing = false;
        };
    } forEach [sf_teamleader,sf_marksman1,sf_rifleman1,sf_atman];
    sleep 5;
};


_endName = "End1";
_isVictory = false;
_fadeType = true;

if (alive player AND !ENDMISSION_REASON_THROWN) then
{
    ENDMISSION_REASON_THROWN = true;
    [_endName,_isVictory,_fadeType] spawn BIS_fnc_endMission;
};
