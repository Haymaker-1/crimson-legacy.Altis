




TASK_REPORT_IN_AT_KRYA_NERA setTaskState "Succeeded";
["TaskSucceeded", ["","Report in"]] call BIS_fnc_showNotification;

THE_CO sideChat "Hello, Lieutenant.";
sleep 3;
THE_CO sideChat "I have a special assignment for you today.";
sleep 4;
player sideChat "Uh...OK. Anything you need Captain.";
sleep 4;
THE_CO sideChat "I need you to assist the Special Forces team at Camp Nabisco. They are tasked with providing the rebels with secure long range comms so we can coordinate the resistance against CSAT better.";
sleep 12;
THE_CO sideChat "I'll mark Nabisco on your map.";
sleep 7;

["MARKER_PERIMETER_LNN_NABISCO",25,"ColorWEST",0.70] execVM "scripts\floodfill-perimeter.sqf";

"MARKER_CAMP_NABISCO" setMarkerType "mil_dot";

THE_CO sideChat "The radios are in those cases on the table there.";
sleep 7;
THE_CO sideChat "Problem is, I currently can't spare the resources to bring those radios to the Special Forces team: everybody's low on fuel and resupply is not foreseen in the near future.";
sleep 10;
player sideChat "OK, what can I do?";
sleep 3;
THE_CO sideChat "I want you to go to the airport southwest of here.";
sleep 4;


["MARKER_PERIMETER_KRYA_NERA_AIRPORT_FTS",25,"ColorWEST",0.70] execVM "scripts\floodfill-perimeter.sqf";
"MARKER_HELIPORT" setMarkerType "mil_dot";

THE_CO sideChat "In the meantime, I'll use my black market contact to procure some fuel. Stavros usually comes through but it'll surely take him a couple of hours.";
sleep 5;
THE_CO sideChat "In any case, I'll tell him to deliver the fuel directly to the airport so you can fill up the helo.";
sleep 5;
THE_CO sideChat "Once that's done, bring the helo here, load her up with the radios, and deliver them to Nabisco.";
sleep 5;
THE_CO sideChat "Any questions?";
sleep 3;
player sideChat "No sir!";
sleep 2;
THE_CO sideChat "Allright then. Dismissed.";

{ 
    _x lock 0;
} forEach (getMarkerPos "MARKER_OP_KRYA_NERA" nearObjects ["Car",30]);

TASK_GO_TO_THE_AIRPORT = player createSimpleTask ["TASKID_GO_TO_THE_AIRPORT"];
TASK_GO_TO_THE_AIRPORT setSimpleTaskDescription ["Go to the heliport SW of Krya Nera and wait for the CO's contact to deliver the fuel.","Go to the airport","Go to the airport"];
TASK_GO_TO_THE_AIRPORT setSimpleTaskDestination (getMarkerPos "MARKER_DESTINATION_TASK_WAIT_FOR_FUEL");
player setCurrentTask TASK_GO_TO_THE_AIRPORT;
TASK_GO_TO_THE_AIRPORT setTaskState "Assigned";
["TaskAssigned", ["","Go to the airport"]] call BIS_fnc_showNotification;
TASK_GO_TO_THE_AIRPORT_HAS_BEEN_ASSIGNED = true;

