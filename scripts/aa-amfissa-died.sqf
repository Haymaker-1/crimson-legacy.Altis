diag_log format ["starting %1", _thisScript];

waitUntil {
    sleep 5;
    if (!alive AA_AMFISSA) exitWith {true};
    false
};

"MARKER_OPFOR_AA_AMFISSA" setMarkerAlpha 0;
"MARKER_OPFOR_AA_AMFISSA_TEXT" setMarkerType "Empty";

diag_log format ["%1: done", _thisScript];
