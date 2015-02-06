

_spawningComplete = [] spawn {
    
    waitUntil {
        sleep 0.5;
        if (!isNull player) exitWith {true};
        false
    }; 
    
    if (false) then {

        unit1 = player;
        
        waitUntil {
            sleep 0.5;
            if (!isNil "sfTeamProb") exitWith {true};
            false
        };
    
        _tmp = [sfTeamProb] call HAYMAKER_fnc_selectWeightedRandom;
        
        _fighterTypeIdx = _tmp select 0;
        _fighterType = _tmp select 1;
        sfTeamProb set [_fighterTypeIdx,[_tmp,0.00]];
            
        _grp = createGroup west;
        _fighterType createUnit [getPos unit1, _grp, "unit2 = this;"];
        selectPlayer unit2;
        
        // FIXME triggerAttachVehicle does not work after this
        
        unit2 setName (name unit1);
        (group unit2) setGroupId ["Delta One","GroupColor4"];
        
        null = [group unit2] execVM "scripts\change-equipment-blufor-group-members.sqf";
        
        {
            _char = _x select 0;
            if (_char == unit1) then {
                _pitch = _x select 1;
                VOICE_PITCH set [_forEachIndex,[unit2,_pitch]];
            };
        } forEach VOICE_PITCH;

        {
            _char = _x select 0;
           if (_char == unit1) then {
                _volume = _x select 1;
                VOICE_VOLUME set [_forEachIndex,[unit2,_volume]];
            };
        } forEach VOICE_VOLUME;

        [unit1] joinSilent grpNull;
        deleteVehicle unit1;
        
        waitUntil {
            sleep 0.5;
            if (isPlayer unit2) exitWith {true};
            false
        };

        unit1 = nil;
        unit2 = nil;
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
    _trig triggerAttachVehicle [player];
    _trig setTriggerActivation["VEHICLE","PRESENT",false];
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








