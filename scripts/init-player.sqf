

_spawningComplete = [] spawn {
    
    waitUntil {
        sleep 0.5;
        if (!isNull player) exitWith {true};
        false
    }; 
    
    if (true) then {

        waitUntil {
            sleep 0.5;
            if (!isNil "TEAM_PROB") exitWith {true};
            false
        };
    
        _tmp = [TEAM_PROB] call HAYMAKER_fnc_selectWeightedRandom;
        
        _fighterTypeIdx = _tmp select 0;
        _fighterType = _tmp select 1;
        TEAM_PROB set [_fighterTypeIdx,[_tmp,0.00]];
        
        CHARACTER_POOL_GROUP = group player;
        
        selectPlayer (units CHARACTER_POOL_GROUP select _fighterTypeIdx);
        
        _grp = createGroup west;
        _grp setGroupId ["Delta One","GroupColor4"];
        
        [player] joinSilent _grp;
        player setName profileName;
        _grp selectLeader player;
        player setRank "LIEUTENANT";
        
        null = [_grp] execVM "scripts\change-equipment-blufor-group-members.sqf";
        
        _pos = getPos (units CHARACTER_POOL_GROUP select 0);
        
        {
            removeSwitchableUnit _x;
            deleteVehicle _x;
        } forEach (units CHARACTER_POOL_GROUP);

        player setPos _pos;
        
    }
    else {
        null = [group player] execVM "scripts\change-equipment-blufor-group-members.sqf";
        (group player) setGroupId ["Delta One","GroupColor4"];
    };

};


waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};




5 fadeSound 1;
null = [] spawn {
    sleep 3;
    titleText ["", "BLACK IN", 5];
}; 

null = [] spawn {
    
    sleep 10;
    
    _trig = createTrigger["EmptyDetector",getPos THE_CO];
    _trig setTriggerArea[2,2,0,false];
    _trig setTriggerActivation["VEHICLE","PRESENT",false];
    _trig triggerAttachVehicle [player];
    _trig setTriggerStatements["this","null = [] execVM 'scripts\conversation-with-the-co.sqf';",""]; 
    
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








