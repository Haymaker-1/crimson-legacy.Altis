
_men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
{
    _markerName = format ["MARKER_MAN_KAVALA_%1",_forEachIndex];
    _marker = createMarker[_markerName,getPos _x];
} forEach _men;

SHOW_MEN_KAVALA = true;

while {SHOW_MEN_KAVALA} do {
    _men = (getMarkerPos "MARKER_MOTOR_POOL") nearEntities ["Man",1250];
    {
        _markerName = format ["MARKER_MAN_KAVALA_%1",_forEachIndex];
        _markerName setMarkerType "mil_dot";
        _markerName setMarkerPos (getPos _x);
        _markerName setMarkerSize [0.5,0.5];

        if (side _x == EAST) then {
            _markerName setMarkerColor "ColorEAST";
        };
        if (side _x == WEST) then {
            _markerName setMarkerColor "ColorWEST";
        };
        if (side _x == CIVILIAN) then {
            _markerName setMarkerColor "ColorCIV";
        };

    } forEach _men;

    sleep 10;    
};



{   
    if (["MARKER_MAN_KAVALA_",_x,count toArray "MARKER_MAN_KAVALA_"] call HAYMAKER_fnc_strcmpn) then {
        deleteMarker _x;
    };
} forEach allMapmarkers;

