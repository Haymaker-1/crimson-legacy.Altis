

private "_stop";
private "_stopCond1";
private "_stopCond2";


_stop = false;
_stopCond1 = nil;
_stopCond2 = nil;

TASK_SEIZE_SRIFLE_DONE = false;

while {!_stop} do {

    private "_hasTheRifle";

    sleep 5;

    _hasTheRifle = [];
    _hasTheRifle resize (count units group player);
    {
        _hasTheRifle set [_forEachIndex,"srifle_LRR_SOS_F" in weapons _x];
    } forEach units (group player);

    _stopCond1 = TASK_SEIZE_SRIFLE_DONE;
    _stopCond2 = (true in _hasTheRifle) AND !("srifle_LRR_SOS_F" in weapons negades_sniper);

    _stop = _stopCond1 OR _stopCond2;

};

if (!_stopCond1) then {

    TASK_SEIZE_SRIFLE setTaskState "Succeeded";
    ["TaskSucceeded", ["","Seize rifle"]] call BIS_fnc_showNotification;
} else {
    TASK_SEIZE_SRIFLE setTaskState "Canceled";
    ["TaskCanceled", ["","Seize rifle"]] call BIS_fnc_showNotification;
};
