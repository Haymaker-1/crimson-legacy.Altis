

_cont = true;
_cond1 = nil;
_cond2 = nil;
_cond3 = nil;

TASK_SEIZE_SRIFLE_DONE = false;

while {_cont} do
{
    
    sleep 5;
    
    _hasTheRifle = [];
    _hasTheRifle resize (count units group player);

    {
        _hasTheRifle set [_forEachIndex,"srifle_LRR_SOS_F" in weapons _x];
    } forEach units (group player);
    
    _cond1 = !TASK_SEIZE_SRIFLE_DONE;
    _cond2 = !(true in _hasTheRifle);
    _cond3 = "srifle_LRR_SOS_F" in weapons negades_sniper;
    
    _cont =  _cond1 AND _cond2 AND _cond3;

};

if (_cond2 AND _cond3) then {

    TASK_SEIZE_SRIFLE setTaskState "Succeeded";
    ["TaskSucceeded", ["","Seize rifle"]] call BIS_fnc_showNotification;
} 
else {
    TASK_SEIZE_SRIFLE setTaskState "Canceled";
    ["TaskCanceled", ["","Seize rifle"]] call BIS_fnc_showNotification;
};
