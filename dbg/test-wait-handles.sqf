handle1 = [6] execVM "dbg\test-wait-done.sqf";
waitUntil {
    sleep 1;
    if (scriptDone handle1) exitWith {true};
    false
};
null = [2] execVM "dbg\test-wait-done.sqf";




