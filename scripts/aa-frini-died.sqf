

waitUntil { 
    sleep 5;
    if (!alive AA_FRINI) exitWith {true};
    false
};

"MARKER_OPFOR_AA_FRINI" setMarkerAlpha 0;
"MARKER_OPFOR_AA_FRINI_TEXT" setMarkerType "Empty"; 