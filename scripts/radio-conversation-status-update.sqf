//radio-conversation-status-update.sqf

sleep (random 25);

waitUntil {sleep 5; EVERYBODY_IS_DONE_TALKING};
EVERYBODY_IS_DONE_TALKING = false;

player sideChat "Delta Actual, this is Delta One, come in, over.";
sleep (7+random 2);

_isReady = [THE_CO, "ufvpcvty1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "I have good news and bad news.";
sleep 5;

_isReady = [THE_CO, "ufvpcvty2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "The helicopter is out for the moment. It started losing fuel all of a sudden, and I just managed to put her down at the old factory east of Mt. Kira.";
sleep 16;

_isReady = [THE_CO, "ufvpcvty3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "Commander Kostas gave us some fresh intel about a possible location where our guy is being held. We are on our way now to check it out.";
sleep (12+random 2);

_isReady = [THE_CO, "ufvpcvty4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "Will do, Captain. Delta One, out.";
sleep (2+random 2);


EVERYBODY_IS_DONE_TALKING = true;

