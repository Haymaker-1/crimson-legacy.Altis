
_aaAlphaValue = 0.35;

TASK_GO_TO_THE_AIRPORT setTaskState "Succeeded";
["TaskSucceeded", ["","Go to the airport"]] call BIS_fnc_showNotification;
cutText ["","BLACK OUT",5,false];
5 fadeSound 0;
player allowDamage false;
sleep 5;
skipTime (10.0+random 1.0);


_perimeter = ["MARKER_PERIMETER_SPAWN_AREA_KDX"] call HAYMAKER_fnc_constructPerimeter;
_posResume = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;
player setPos _posResume;
_posHelo = getPos thehelicopter;
_dirFaceHelo = [_posResume,_posHelo] call HAYMAKER_fnc_calcDirection;
player setDir _dirFaceHelo;

sleep 6;

null = [] execVM "scripts\spawn-fuel-truck-and-stavros.sqf";

5 fadeSound 1;
cutText ["Early the following morning...","BLACK IN",8,false];
player allowDamage true;

sleep (10+random 20);
THE_CO sideChat "Delta One, come in, over.";
sleep 3;
player sideChat "This is One. What's up Captain? Any news on that fuel?";
sleep 3;
THE_CO sideChat "I just got word from Stavros. He managed to hustle some fuel but his truck is stuck near Athira.";
sleep 3;
THE_CO sideChat "And since the fuel is not coming to the helicopter...";
sleep 4;
THE_CO sideChat "I'm sending you the truck's location now.";
sleep 5;
"MARKER_FUEL_TRUCK" setMarkerType "mil_dot";
THE_CO sideChat "Make no mistake though, CSAT forces control damn near every mountain south of here. I'm marking some of their AA on your map.";
sleep 8;
"MARKER_OPFOR_AA_FRINI" setMarkerShape "ELLIPSE"; 
"MARKER_OPFOR_AA_FRINI" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_FRINI" setMarkerAlpha _aaAlphaValue; 
"MARKER_OPFOR_AA_FRINI_TEXT" setMarkerType "mil_dot"; 
sleep (1+random 2);
"MARKER_OPFOR_AA_IFESTONIA" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_IFESTONIA" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_IFESTONIA" setMarkerAlpha _aaAlphaValue; 
"MARKER_OPFOR_AA_IFESTONIA_TEXT" setMarkerType "mil_dot"; 
sleep (1+random 2); 
"MARKER_OPFOR_AA_GALATI" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_GALATI" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_GALATI" setMarkerAlpha _aaAlphaValue; 
"MARKER_OPFOR_AA_GALATI_TEXT" setMarkerType "mil_dot"; 
sleep (1+random 2);
"MARKER_OPFOR_AA_PYRSOS" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_PYRSOS" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_PYRSOS" setMarkerAlpha _aaAlphaValue; 
"MARKER_OPFOR_AA_PYRSOS_TEXT" setMarkerType "mil_dot"; 
sleep (1+random 2);
"MARKER_OPFOR_AA_AMFISSA" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_AMFISSA" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_AMFISSA" setMarkerAlpha _aaAlphaValue;
"MARKER_OPFOR_AA_AMFISSA_TEXT" setMarkerType "mil_dot";  
sleep (1+random 2);
"MARKER_OPFOR_AA_MAGOS" setMarkerShape "ELLIPSE";
"MARKER_OPFOR_AA_MAGOS" setMarkerSize [1750,1750];
"MARKER_OPFOR_AA_MAGOS" setMarkerAlpha _aaAlphaValue; 
"MARKER_OPFOR_AA_MAGOS_TEXT" setMarkerType "mil_dot"; 
sleep (4+random 2);
THE_CO sideChat "Furthermore, Gravia Airbase is firmly in CSAT hands, although intel says there's no AA in that area. Be careful though.";
["MARKER_PERIMETER_AIRBASE",100,"ColorEAST",0.70] execVM "scripts\floodfill-perimeter.sqf";
sleep 5;
THE_CO sideChat "As you can see, you've got your work cut out for you.";
sleep 4;
THE_CO sideChat "Delta Actual, out.";
sleep 2;
TASK_LOAD_FUEL = player createSimpleTask ["TASKID_LOAD_FUEL"];
TASK_LOAD_FUEL setSimpleTaskDescription ["Refuel the helicopter at Stavros' truck.","Refuel","Refuel"];
TASK_LOAD_FUEL setSimpleTaskDestination (getMarkerPos "MARKER_LOAD_FUEL");
player setCurrentTask TASK_LOAD_FUEL;
TASK_LOAD_FUEL setTaskState "Assigned";
["TaskAssigned", ["","Refuel"]] call BIS_fnc_showNotification;
TASK_LOAD_FUEL_HAS_BEEN_ASSIGNED = true;


sleep 10;

if (SHOW_CHAPTER_TITLES) then {
    null = ["Flyboys"] execVM "scripts\show-chapter-title.sqf";
};

