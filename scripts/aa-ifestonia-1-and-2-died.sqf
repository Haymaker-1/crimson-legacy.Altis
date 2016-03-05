diag_log format ["starting %1", __FILE__];

waitUntil {
    sleep 5;
    if (!alive AA_IFESTONIA_1 AND !alive AA_IFESTONIA_2) exitWith {true};
    false
};

"MARKER_OPFOR_AA_IFESTONIA" setMarkerAlpha 0;
"MARKER_OPFOR_AA_IFESTONIA_TEXT" setMarkerType "Empty";

diag_log format ["%1: done", __FILE__];
