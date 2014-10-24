

player removeAction ACTION_RADIO_FOR_BOAT;
deleteVehicle TRIGGER_ADDACTION_CALL_BOAT;

sleep random 3;

player sideChat "Noah Three, this is Delta One. Do you read?";
sleep 5;

(leader gunBoatGroup) sideChat "This is Noah Three. I read you loud and clear.";
sleep 5;

_pos1 = getPos player;
_pos2 = getMarkerPos "MARKER_EGRESS_ALPHA";
_dist = _pos1 distance _pos2;
if (_dist > 100) then
{
    player sideChat "We are approaching the pickup point.";
}
else
{
    player sideChat "We are ready for pickup at egress Alpha.";
};
sleep 5;

(leader gunBoatGroup) sideChat "Stand by. We are coming in now. Noah out.";
sleep 6;

_group = gunboatGroup;
_pos = getMarkerPos "MARKER_EGRESS_ALPHA_BOAT";

_wp = _group addWaypoint [_pos,1]; 
[_group,1] setWaypointCompletionRadius 100;
[_group,1] setWaypointType "MOVE"; 
[_group,1] setWaypointSpeed "NORMAL";
[_group,1] setWaypointBehaviour "SAFE";
[_group,1] setWaypointCombatMode "RED";
[_group,1] setWaypointStatements ["true","THE_GUNBOAT lockCargo [floor(random 7),false];"];



waitUntil {sleep 5;pilot in crew THE_GUNBOAT};

pilot allowDamage false;
//THE_GUNBOAT setPos getMarkerPos "MARKER_EGRESS_ALPHA_BOAT";
null = [] execVM "scripts\translate-and-rotate-gunboat.sqf";

PILOT_EGRESS_WAS_SUCCESSFUL = true;

[pilot] joinSilent gunboatGroup;

_perimeter = ["MARKER_PERIMETER_SPAWN_GUNBOAT"] call HAYMAKER_fnc_constructPerimeter;
_pos = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;

_wp = gunboatGroup addWaypoint [_pos,2];
[gunboatGroup,2] setWaypointStatements ["true", "{deleteVehicle _x} forEach units gunboatGroup; deleteVehicle THE_GUNBOAT;"];
[gunboatGroup,2] setWaypointCompletionRadius 100;


sleep random 10;

player sideChat "Delta Actual, come in, over.";
sleep 3;

THE_CO sideChat "Go ahead, One.";
sleep 2;

player sideChat "Captain, the pilot is on the boat.";
sleep 4;

THE_CO sideChat "Sterling work, One.";
sleep 2;

THE_CO sideChat "You really helped avoid a severe crisis here.";
sleep 4;

if (random 1 < 0.5) then
{   
    player sideChat "Just doing my job, sir.";
    sleep 3;
}
else
{
    player sideChat "All in a day's work, sir.";
    sleep 3;
};

THE_CO sideChat "Well, I appreciate it.";
sleep 3;

player sideChat "What do you want me to do now?";
sleep 4;

THE_CO sideChat "I want you to fall back to the rebel camp. See if you can be of any assistance to Commander Kostas.";
sleep 7;

player sideChat "Willco.";
sleep 2;

THE_CO sideChat "Catch you later, One. Delta Actual out.";
sleep 3;

sleep random 4;

TASK_ESCORT_PILOT setTaskState "Succeeded";
["TaskSucceeded", ["","Escort pilot"]] call BIS_fnc_showNotification;



sleep (10+random 30);

null = [] execVM "scripts\negades-retrieve-longrange-asset.sqf";




