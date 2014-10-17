
_nLights = _this select 0;

if (isnil "_nLights") then {
    _nLights = 2;
};


_chooseFrom = [ "MARKER_BARN_LIGHT_1",
                "MARKER_BARN_LIGHT_2",
                "MARKER_BARN_LIGHT_3",
                "MARKER_BARN_LIGHT_4",
                "MARKER_BARN_LIGHT_5",
                "MARKER_BARN_LIGHT_6",
                "MARKER_BARN_LIGHT_7"];

if (_nLights > count _chooseFrom) then {
    _nLights = count _chooseFrom;
};

                
_markerNames = [_chooseFrom,_nLights] call HAYMAKER_fnc_randomSelectionFromArray;


{
    _marker = _x;
               
    _light =  createVehicle ["Land_PortableLight_single_F",getMarkerPos _marker,[],0,"NONE"];
    _source = createVehicle ["#lightpoint",                getMarkerPos _marker,[],0,"NONE"];

    _offset = [0,-4,1];
    _source setLightBrightness 1.0; 
    _source setLightAttenuation [3.5, 1, 1, 12]; 
    _source setLightColor [1,1,0.5];
    _source setLightAmbient [1,1,0.5];
    _source attachTo [_light,_offset];

    _posBarn = getMarkerPos "MARKER_SHED_AGIOS";
    _posLight = getMarkerPos _marker;
    _dir = [_posBarn,_posLight] call HAYMAKER_fnc_calcDirection;
    _light setDir _dir;

    _light allowDamage false;
    
} forEach _markerNames;