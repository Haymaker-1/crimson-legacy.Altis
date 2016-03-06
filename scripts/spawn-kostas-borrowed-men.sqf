


private "_kostasBorrowedMen";
private "_unitTypesAndMarkers";

_kostasBorrowedMen = createGroup west;

_unitTypesAndMarkers = [
    ["B_G_Soldier_lite_F", "MARKER_SPAWN_JOKER"],
    ["B_G_medic_F", "MARKER_SPAWN_COWBOY"],
    ["B_G_Soldier_AR_F", "MARKER_SPAWN_ANIMALMOTHER"]
];

{
    private "_unitType";
    private "_unit";
    private "_marker";

    _unitType = _x select 0;
    _marker = _x select 1;
    _unit = _kostasBorrowedMen createUnit [_unitType, getMarkerPos _marker, [], 0, "NONE"];

    _unit disableAI "MOVE";
    _unit disableAI "ANIM";
    _dir = [getPos _unit, getPos fireplace1] call HAYMAKER_fnc_calcDirection;
    _unit setDir _dir;
    _unit playAction "SitDown";
    _unit allowDamage false;
} forEach _unitTypesAndMarkers;


