

nGPSPositions = 5000;
GPSTRACK = [];
GPSTRACK resize nGPSPositions;
iGPS = 0;
{
markerName = format ["PLAYER_GPS_LOCATION_%1",iGPS]; 
_marker = createMarker [markerName,[0,0]];
markerName setMarkerType "Empty";
iGPS = iGPS + 1;
} forEach GPSTRACK;

GPS_MARKER_INDEX = 0;
GPS_MARKER_INDEX_PREV = GPS_MARKER_INDEX;

GPSTRACK set [GPS_MARKER_INDEX,getPos player];
timeOfLastGPSFix = time;
GPS_MARKER_INDEX = (GPS_MARKER_INDEX+1)%nGPSPositions;


if (isnil("GPS_TRACKING_IS_ON")) then
{
    GPS_TRACKING_IS_ON = true;
};

while {true} do 
{
    if (GPS_TRACKING_IS_ON) then
    {
        currentPos = getPos player;
        currentTime = time;
        playerHasGPS = "ItemGPS" in assignedItems player;
        timeSinceLastGPSFix = currentTime-timeOfLastGPSFix;
        distSinceLastGPSFix = (GPSTRACK select (GPS_MARKER_INDEX-1+nGPSPositions)%nGPSPositions) distance (currentPos);

        if (playerHasGPS AND (distSinceLastGPSFix > 5) AND ((timeSinceLastGPSFix > 15) OR (distSinceLastGPSFix > 50))) then
        {
            GPSTRACK set [GPS_MARKER_INDEX,currentPos];
            markerName = format ["PLAYER_GPS_LOCATION_%1",GPS_MARKER_INDEX];
            markerName setMarkerColor "ColorYellow";
            markerName setMarkerType "mil_triangle";
            markerName setMarkerPos (GPSTRACK select GPS_MARKER_INDEX);
            markerName setMarkerSize [0.25,0.25];
            markerName setMarkerDir ([GPSTRACK select GPS_MARKER_INDEX_PREV,GPSTRACK select GPS_MARKER_INDEX] call HAYMAKER_fnc_calcDirection);
            GPS_MARKER_INDEX_PREV = GPS_MARKER_INDEX;
            GPS_MARKER_INDEX = (GPS_MARKER_INDEX+1)%nGPSPositions;
            timeOfLastGPSFix = currentTime;
        };
    };
    sleep 1;
};  