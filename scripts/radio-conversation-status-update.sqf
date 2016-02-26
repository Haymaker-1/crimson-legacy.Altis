

private "_isReady";

sleep (random 25);

waitUntil {
    sleep 5;
    if (EVERYBODY_IS_DONE_TALKING) exitWith {true};
    false
};
EVERYBODY_IS_DONE_TALKING = false;

_isReady = [player, "wfgtacli1"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ufvpcvty1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "wfgtacli2"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ufvpcvty2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "wfgtacli3"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ufvpcvty3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "wfgtacli4"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [THE_CO, "ufvpcvty4"] execVM "scripts\unitradiospeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;

_isReady = [player, "wfgtacli5"] execVM "scripts\unitspeak.sqf";
waitUntil{
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};
_isReady = nil;


EVERYBODY_IS_DONE_TALKING = true;
