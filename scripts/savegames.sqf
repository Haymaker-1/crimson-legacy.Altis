


SAVEGAME_ADD_RATE = nil;

switch (difficulty) do {
    case 0: { N_SAVEGAMES_REMAINING_MAX = 3; SAVEGAME_ADD_RATE = 1/(5*60) }; //  5
    case 1: { N_SAVEGAMES_REMAINING_MAX = 2; SAVEGAME_ADD_RATE = 1/(15*60) }; // 15
    case 2: { N_SAVEGAMES_REMAINING_MAX = 1; SAVEGAME_ADD_RATE = 1/(30*60) }; // 30
    case 3: { N_SAVEGAMES_REMAINING_MAX = 1; SAVEGAME_ADD_RATE = 1/(60*60) }; // 60
    default { N_SAVEGAMES_REMAINING_MAX = 1; SAVEGAME_ADD_RATE = 1/(60*60) }; // 60
};


N_SAVEGAMES_REMAINING = 1;

TIME_LAST_SAVEGAME = time;

while {alive player} do {

    private "_cond1";
    private "_cond2";

    _cond1 = (time - TIME_LAST_SAVEGAME) > (1/SAVEGAME_ADD_RATE);
    _cond2 = N_SAVEGAMES_REMAINING < N_SAVEGAMES_REMAINING_MAX;

    if (_cond1 AND _cond2) then {

        TIME_LAST_SAVEGAME = time;
        N_SAVEGAMES_REMAINING = N_SAVEGAMES_REMAINING + 1;

        hintSilent parseText format["<t size='1.00' color='#ffffff'>%1</t>", "savegame available"];

        TRIGGER_SAVE_GAME setTriggerText format ["Save game (%1 remaining)",N_SAVEGAMES_REMAINING];
    };

    sleep 15;

};
