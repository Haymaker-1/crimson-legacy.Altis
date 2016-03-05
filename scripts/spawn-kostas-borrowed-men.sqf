

diag_log format ["starting %1", _thisScript];

kostasBorrowedMen = createGroup west;

"B_G_Soldier_lite_F" createUnit [(getMarkerPos "MARKER_SPAWN_JOKER"), kostasBorrowedMen, "joker = this;
                    this disableAI 'MOVE';
                    this disableAI 'ANIM';
                    dir = [getPos this, getPos fireplace1] call HAYMAKER_fnc_calcDirection;
                    this setPos (getMarkerPos 'MARKER_SPAWN_JOKER');
                    this setDir dir;
                    this playAction 'SitDown';", 0.5,"PRIVATE"];

"B_G_Soldier_AR_F" createUnit [(getMarkerPos "MARKER_SPAWN_ANIMALMOTHER"), kostasBorrowedMen, "animalmother = this;
                    this disableAI 'MOVE';
                    this disableAI 'ANIM';
                    dir = [getPos this, getPos fireplace1] call HAYMAKER_fnc_calcDirection;
                    this setPos (getMarkerPos 'MARKER_SPAWN_ANIMALMOTHER');
                    this setDir dir;
                    this playAction 'SitDown';", 0.5, "PRIVATE"];

"B_G_medic_F" createUnit [(getMarkerPos "MARKER_SPAWN_COWBOY"), kostasBorrowedMen, "this disableAI 'MOVE';
                    cowboy = this;
                    this disableAI 'ANIM';
                    dir = [getPos this, getPos fireplace1] call HAYMAKER_fnc_calcDirection;
                    this setPos (getMarkerPos 'MARKER_SPAWN_COWBOY');
                    this setDir dir;
                    this playAction 'SitDown';", 0.5, "PRIVATE"];

{
    allowDamage false;
} forEach (units kostasBorrowedMen);



diag_log format ["%1: done", _thisScript];
