
private "_addVolume";
private "_veh";
private "_view";
private "_vehLittlebirds";
private "_vehOffroads";
private "_vehHunters";
private "_vehQuads";
private "_vehStriders";
private "_vehZamaks";

_addVolume = 0.0;

_veh = assignedVehicle player;
_view = cameraView;


_vehLittlebirds = [ "B_Heli_Light_01_F" ];
_vehOffroads    = [ "B_G_Offroad_01_F" , "I_G_Offroad_01_F" , "C_Offroad_01_F"  ];
_vehHunters     = [ "O_MRAP_02_base_F" , "O_MRAP_02_hmg_F"  , "O_MRAP_02_gmg_F" ];
_vehQuads       = [ "B_Quadbike_01_F"  , "I_Quadbike_01_F"  , "O_Quadbike_01_F" ];
_vehStriders    = [ "I_MRAP_03_base_F" , "I_MRAP_03_hmg_F"  , "I_MRAP_03_gmg_F" ];
_vehZamaks      = [ "O_Truck_02_transport_F","O_Truck_02_fuel_F"];



if (!isNull (_veh)) then {

    private "_vehType";

    _vehType = typeOf (_veh);

    if (player in crew _veh) then {

        if (_veh isKindOf "Helicopter") then {
            if (_vehType in _vehLittlebirds) then {
                if (_view == "EXTERNAL") then {
                   _addVolume = 40.0;
                } else {
                    _addVolume = 20.0;
                };
            };
        };

        if (_veh isKindOf "Car") then {

            if (_view == "EXTERNAL") then {
                _addVolume = 50.0;
            } else {
                _addVolume = 10.0;
            };

            if (_vehType in _vehOffroads) then {
                if (_view == "EXTERNAL") then {
                   _addVolume = 130.0;
                } else {
                    _addVolume = 10.0;
                };
            };
            if (_vehType in _vehHunters) then {
                if (_view == "EXTERNAL") then {
                   _addVolume = 130.0;
                } else {
                    _addVolume = 10.0;
                };
            };
            if (_vehType in _vehQuads) then {
                if (_view == "EXTERNAL") then {
                   _addVolume = 150.0;
                } else {
                    _addVolume = 10.0;
                };
            };
            if (_vehType in _vehStriders) then {
                if (_view == "EXTERNAL") then {
                   _addVolume = 150.0;
                } else {
                    _addVolume = 70.0;
                };
            };
            if (_vehType in _vehZamaks) then {
                if (_view == "EXTERNAL") then {
                   _addVolume = 150.0;
                } else {
                    _addVolume = 50.0;
                };
            };
        };
    };
};


_addVolume
