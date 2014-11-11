handle1 = [6] execVM "dbg\test-wait-done.sqf";
waitUntil{scriptDone handle1};
null = [2] execVM "dbg\test-wait-done.sqf";




