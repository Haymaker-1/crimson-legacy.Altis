

_saveGameAddRate = nil;

switch (difficulty) do { 
    case 0: { _saveGameAddRate = 1/(5*60) }; //  5
    case 1: { _saveGameAddRate = 1/(5*60) }; // 15
    case 2: { _saveGameAddRate = 1/(5*60) }; // 30
    case 3: { _saveGameAddRate = 1/(5*60) }; // 60
    default { _saveGameAddRate = 1/(5*60) }; // 60
};

N_SAVEGAMES_REMAINING = 0;
_nSaveGamesRemainingMax = 3;
_timeLastSave = time;

while {alive player} do {

    _cond1 = (time - _timeLastSave) > (1/_saveGameAddRate);
    _cond2 = N_SAVEGAMES_REMAINING <= _nSaveGamesRemainingMax;
    
    if (_cond1 AND _cond2) then {
        N_SAVEGAMES_REMAINING = N_SAVEGAMES_REMAINING + 1;
        hint "save game added";
        
        TRIGGER_SAVE_GAME setTriggerText format ["Save game (%1 remaining)",N_SAVEGAMES_REMAINING];
    };
    
    sleep 15;

};