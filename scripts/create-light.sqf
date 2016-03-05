
diag_log format ["starting %1", _thisScript];

private "_thePosition";
private "_theColor";
private "_theBrightness";
private "_light";


_thePosition = _this select 0;
_theColor = _this select 1;
_theBrightness = _this select 2;


if (isnil "_thePosition") then {
    _thePosition = [0,0,0];
    player globalChat "DBG: No position given for the light source (create-light.sqf)";
};

if (isnil "_theColor") then {
    _theColor = [0.5,0,0.5];
};
if (isnil "_theBrightness") then {
    _theBrightness = 0.5;
};



_light = createVehicle ["#lightpoint", _thePosition, [], 0, "NONE"];
_light setLightBrightness _theBrightness;
_light setLightAmbient _theColor;
_light setLightColor _theColor;

diag_log format ["%1: done", _thisScript];
