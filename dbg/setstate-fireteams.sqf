

pilotGroup = createGroup west;

pilot = "B_Pilot_F" createUnit [(getMarkerPos "MARKER_SPAWN_PILOT"),pilotGroup,"this disableAI 'MOVE';this disableAI 'ANIM';_pos = getPos this; _pos set [2,2.0]; this setPos _pos;this setDir 205;this playAction 'SitDown'; this setCaptive true; removeBackpack this;removeAllWeapons this; removeHeadgear this",0.5,"LIEUTENANT"];  

_otherGroup = createGroup east;
_soldier = "O_Soldier_TL_F" createUnit [(getMarkerPos "MARKER_SPAWN_PILOT"),_otherGroup,"_pos = getPos this; _pos set [2,2.0]; this setPos _pos; this removePrimaryWeaponItem 'optic_ACO_grn';",0.5,"CORPORAL"];


_spawningComplete = [] execVM "scripts\spawn-fireteam1.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteam2.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_spawningComplete = [] execVM "scripts\spawn-fireteam3.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;



