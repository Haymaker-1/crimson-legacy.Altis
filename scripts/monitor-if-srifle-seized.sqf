

_cont = true;

TASK_SEIZE_SRIFLE_DONE = false;

while {_cont} do
{
    _hasTheRifle = [];
    _hasTheRifle resize (count units group player);

    {
        _hasTheRifle set [_forEachIndex,"srifle_LRR_SOS_F" in weapons _x];
    } forEach units (group player);
    
    _cont = !TASK_SEIZE_SRIFLE_DONE AND (!(true in _hasTheRifle) OR ("srifle_LRR_SOS_F" in weapons negades_sniper));
    
    sleep 5;

};

if (!(true in _hasTheRifle) OR ("srifle_LRR_SOS_F" in weapons negades_sniper)) then {

    TASK_SEIZE_SRIFLE setTaskState "Succeeded";
    ["TaskSucceeded", ["","Seize rifle"]] call BIS_fnc_showNotification;
} 
else {
    TASK_SEIZE_SRIFLE setTaskState "Canceled";
    ["TaskCanceled", ["","Seize rifle"]] call BIS_fnc_showNotification;
};
