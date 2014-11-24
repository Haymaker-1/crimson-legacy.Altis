//radio-conversation-status-update.sqf

sleep (random 25);

waitUntil {sleep 5; EVERYBODY_IS_DONE_TALKING};
EVERYBODY_IS_DONE_TALKING = false;

_isReady = [player, "wfgtacli1"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "ufvpcvty1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "wfgtacli2"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "ufvpcvty2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "wfgtacli3"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "ufvpcvty3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "wfgtacli4"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "ufvpcvty4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [player, "wfgtacli5"] execVM "scripts\unitspeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};


EVERYBODY_IS_DONE_TALKING = true;

