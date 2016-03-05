diag_log format ["starting %1", __FILE__];

waitUntil {
    sleep 5;
    if (!alive AA_GALATI) exitWith {true};
    false
};

"MARKER_OPFOR_AA_GALATI" setMarkerAlpha 0;
"MARKER_OPFOR_AA_GALATI_TEXT" setMarkerType "Empty";

diag_log format ["%1: done", __FILE__];
