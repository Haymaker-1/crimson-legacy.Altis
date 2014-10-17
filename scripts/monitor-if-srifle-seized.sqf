

_cont = true;

while {_cont} do
{
    _hasTheRifle = [];
    _hasTheRifle resize (count units group player);

    {
        _hasTheRifle set [_forEachIndex,"srifle_LRR_SOS_F" in weapons _x];
    } forEach units (group player);
    
    _cont = !(true in _hasTheRifle) OR ("srifle_LRR_SOS_F" in weapons negades_sniper);
    
    sleep 5;

};


TASK_SEIZE_SRIFLE setTaskState "Succeeded";
["TaskSucceeded", ["","Seize rifle"]] call BIS_fnc_showNotification;
