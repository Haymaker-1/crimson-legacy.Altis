

SAVEGAME_ADD_RATE = nil;

switch (difficulty) do { 
    case 0: { N_SAVEGAMES_REMAINING_MAX = 3; SAVEGAME_ADD_RATE = 1/(5*60) }; //  5
    case 1: { N_SAVEGAMES_REMAINING_MAX = 2; SAVEGAME_ADD_RATE = 1/(15*60) }; // 15
    case 2: { N_SAVEGAMES_REMAINING_MAX = 1; SAVEGAME_ADD_RATE = 1/(30*60) }; // 30
    case 3: { N_SAVEGAMES_REMAINING_MAX = 1; SAVEGAME_ADD_RATE = 1/(60*60) }; // 60
    default { N_SAVEGAMES_REMAINING_MAX = 1; SAVEGAME_ADD_RATE = 1/(60*60) }; // 60
};


N_SAVEGAMES_REMAINING = 1;

_timeLastSave = time;

while {alive player} do {

    _cond1 = (time - _timeLastSave) > (1/SAVEGAME_ADD_RATE);
    _cond2 = N_SAVEGAMES_REMAINING < N_SAVEGAMES_REMAINING_MAX;
    
    if (_cond1 AND _cond2) then {
    
        _timeLastSave = time;
        N_SAVEGAMES_REMAINING = N_SAVEGAMES_REMAINING + 1;
        hint "save game added";
        
        TRIGGER_SAVE_GAME setTriggerText format ["Save game (%1 remaining)",N_SAVEGAMES_REMAINING];
    };
    
    sleep 15;

};