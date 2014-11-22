sleep (random 5);


_isReady = [THE_CO, "dxhqaqgv1"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

player sideChat "Hi there Captain, I'm approaching Krya Nera now."; 
sleep 3; 

_isReady = [THE_CO, "dxhqaqgv2"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

_isReady = [THE_CO, "dxhqaqgv3"] execVM "scripts\unitradiospeak.sqf";
waitUntil{sleep 1; scriptDone _isReady};

suitcase1 setPos (getMarkerPos "MARKER_SUITCASE1_GOTO_LABEL");
suitcase2 setPos (getMarkerPos "MARKER_SUITCASE2_GOTO_LABEL");
suitcase3 setPos (getMarkerPos "MARKER_SUITCASE3_GOTO_LABEL"); 
SUITCASE_CARRIER_MAN setPos (getMarkerPos "MARKER_SUITCASE_CARRIER_MAN_GOTO_LABEL");