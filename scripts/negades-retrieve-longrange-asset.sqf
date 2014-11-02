

kostas sideChat "Hello? Lieutenant? Kostas here.";
sleep 4;

player sideChat "Hello sir.";
sleep 3;

kostas sideChat "I could use your help.";
sleep 3;

player sideChat "Sure thing. Just tell me what you need.";
sleep 3;

kostas sideChat "I want you to start clearing the western coast towards Kavala.";
sleep 6;

player sideChat "Roger that, search and destroy towards Kavala.";
sleep 5;

kostas sideChat "One more thing. We have intel that an anti-material gun is present near Negades. Seizing it could make your life a lot easier. But getting to it may be risky. Anyway, your call. Kostas out.";







sleep 15;

TASK_CLEAR_AGIOS_KONSTANTINOS = player createSimpleTask ["TASKID_CLEAR_AGIOS_KONSTANTINOS"];
TASK_CLEAR_AGIOS_KONSTANTINOS setSimpleTaskDescription ["Clear the area around <marker name='MARKER_AGIOS_KONSTANTINOS'>Agios Konstantinos</marker> of all enemies.","Clear Agios Konstantinos","Clear Agios Konstantinos"];
//TASK_CLEAR_AGIOS_KONSTANTINOS setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
player setCurrentTask TASK_CLEAR_AGIOS_KONSTANTINOS;
TASK_CLEAR_AGIOS_KONSTANTINOS setTaskState "Assigned";
["TaskAssigned", ["","Clear Agios Konstantinos"]] call BIS_fnc_showNotification;
TASK_CLEAR_AGIOS_KONSTANTINOS_HAS_BEEN_ASSIGNED = true;

sleep 6;

TASK_CLEAR_NEGADES = player createSimpleTask ["TASKID_CLEAR_NEGADES"];
TASK_CLEAR_NEGADES setSimpleTaskDescription ["Clear the area around <marker name='MARKER_NEGADES'>Negades</marker> of all enemies.","Clear Negades","Clear Negades"];
//TASK_CLEAR_NEGADES setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
//player setCurrentTask TASK_CLEAR_NEGADES;
TASK_CLEAR_NEGADES setTaskState "Created";
["TaskCreated", ["","Clear Negades"]] call BIS_fnc_showNotification;
TASK_CLEAR_NEGADES_HAS_BEEN_ASSIGNED = true;


sleep 6;

TASK_SEIZE_SRIFLE = player createSimpleTask ["TASKID_SEIZE_SRIFLE"];
TASK_SEIZE_SRIFLE setSimpleTaskDescription ["We have intel that there is an anti-material rifle near <marker name='MARKER_NEGADES'>Negades</marker>. Seizing it could help turn the tables in our advantage.","Seize rifle","Seize rifle"];
//TASK_SEIZE_SRIFLE setSimpleTaskDestination (getMarkerPos "MARKER_EGRESS_ALPHA");
//player setCurrentTask TASK_SEIZE_SRIFLE;
TASK_SEIZE_SRIFLE setTaskState "Created";
["TaskCreated", ["","Seize rifle"]] call BIS_fnc_showNotification;
TASK_SEIZE_RIFLE_HAS_BEEN_ASSIGNED = true;


sleep 10;

if (SHOW_CHAPTER_TITLES) then {
    null = ["Street sweepers"] execVM "scripts\show-chapter-title.sqf";
};
sleep 10;
TIME_LAST_SAVEGAME = time;
saveGame;


waitUntil{sleep 5;AGIOS_KONSTANTINOS_IS_CLEAR AND NEGADES_IS_CLEAR};

null = [] execVM "scripts\spawn-blufor-fireteams-agios-konstantinos.sqf";
sleep 5;
null = [] execVM "scripts\spawn-blufor-fireteams-negades.sqf";
sleep 5;

null = [] execVM "scripts\set-up-op-agios-konstantinos.sqf";




