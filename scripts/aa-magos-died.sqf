diag_log format ["starting %1", __FILE__];

waitUntil {
    sleep 5;
    if (!alive AA_MAGOS) exitWith {true};
    false
};

"MARKER_OPFOR_AA_MAGOS" setMarkerAlpha 0;
"MARKER_OPFOR_AA_MAGOS_TEXT" setMarkerType "Empty";


diag_log format ["%1: done", __FILE__];
