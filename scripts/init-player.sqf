


private "_trig";
private "_tmp";
private "_fighterTypeIdx";
private "_fighterType";
private "_grp";
private "_pos";
private "_teamprob";
private "_characterPoolGrp";


waitUntil {
    sleep 0.5;
    if (!isNull player) exitWith {true};
    false
};


// you need this waituntil, otherwise TEAM_PROB is undefined
waitUntil {
    sleep 0.5;
    if (!isNil {HAYMAKER_GLOBALS getVariable "TEAM_PROB"}) exitWith {true};
    false
};

_teamprob = HAYMAKER_GLOBALS getVariable "TEAM_PROB";
_tmp = [_teamprob] call HAYMAKER_fnc_selectWeightedRandom;

_fighterTypeIdx = _tmp select 0;
_fighterType = _tmp select 1;
_teamprob set [_fighterTypeIdx, [_tmp, 0.00]];

HAYMAKER_GLOBALS setVariable ["TEAM_PROB", _teamprob];

_characterPoolGrp = group player;
_pos = getPos (units _characterPoolGrp select 0);

selectPlayer (units _characterPoolGrp select _fighterTypeIdx);

_grp = createGroup west;
_grp setGroupId ["Delta One","GroupColor4"];

[player] joinSilent _grp;
player setName profileName;
_grp selectLeader player;
player setRank "LIEUTENANT";

null = [_grp] execVM "scripts\change-equipment-blufor-group-members.sqf";


{
    removeSwitchableUnit _x;
    deleteVehicle _x;
} forEach (units _characterPoolGrp);

player setPos _pos;
player setDir 0.0;


null = [] spawn {
    sleep 3;
    titleText ["", "BLACK IN", 5];
    5 fadeSound 1;
};

null = [] spawn {

    private "_trig";

    sleep 10;

    _trig = createTrigger["EmptyDetector",getPos THE_CO];
    _trig setTriggerArea[2,2,0,false];
    _trig setTriggerActivation["VEHICLE","PRESENT",false];
    _trig triggerAttachVehicle [player];
    _trig setTriggerStatements["this","null = [] execVM 'scripts\conversation-with-the-co.sqf';",""];
    _trig = nil;

    TASK_REPORT_IN_AT_KRYA_NERA = player createSimpleTask ["TASKID_REPORT_IN_AT_KRYA_NERA"];
    TASK_REPORT_IN_AT_KRYA_NERA setSimpleTaskDescription ["Report to your commanding officer at <marker name='MARKER_OP_KRYA_NERA'>OP Krya Nera</marker>.","Report in","Report in"];
    TASK_REPORT_IN_AT_KRYA_NERA setSimpleTaskDestination (getMarkerPos "MARKER_COMMANDING_OFFICER");
    player setCurrentTask TASK_REPORT_IN_AT_KRYA_NERA;
    TASK_REPORT_IN_AT_KRYA_NERA setTaskState "Assigned";

    ["TaskAssigned", ["","Report in"]] call BIS_fnc_showNotification;
};



_trig = createTrigger["EmptyDetector",getMarkerPos "MARKER_TRIGGER_HINT_SAVEGAMES"];
_trig setTriggerArea[500,500,0,false];
_trig triggerAttachVehicle [player];
_trig setTriggerActivation["VEHICLE","PRESENT",false];
_trig setTriggerStatements["this","null = [] execVM 'scripts\hint-savegames.sqf';",""];
_trig = nil;


player createDiarySubject ["varAbout","About"];
player createDiaryRecord ["varAbout",["Version","<br /><br />This mission was built on: {{AUTO_INSERT_BUILD_DATETIME}}"]];
