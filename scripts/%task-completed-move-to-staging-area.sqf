//task-completed-move-to-staging-area

TASK_MOVE_TO_STAGING_AREA setTaskState "Succeeded";
["TaskSucceeded", ["","Move to staging area"]] call BIS_fnc_showNotification;

deleteVehicle TRIGGER_STAGING_AREA_ALPHA;
deleteVehicle TRIGGER_STAGING_AREA_BRAVO;
deleteVehicle TRIGGER_STAGING_AREA_CHARLIE;

"MARKER_STAGING_AREA_ALPHA" setMarkerType "Empty";
"MARKER_STAGING_AREA_BRAVO" setMarkerType "Empty";
"MARKER_STAGING_AREA_CHARLIE" setMarkerType "Empty";
