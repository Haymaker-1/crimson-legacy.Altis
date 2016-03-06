
waitUntil {
    sleep 5;
    if (!alive AA_PYRSOS) exitWith {true};
    false
};

"MARKER_OPFOR_AA_PYRSOS" setMarkerAlpha 0;
"MARKER_OPFOR_AA_PYRSOS_TEXT" setMarkerType "Empty";

