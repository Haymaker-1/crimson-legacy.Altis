

private "_pos";
private "_radius";
private "_lamps";



_pos = getMarkerPos "MARKER_MOTOR_POOL";
_radius = 150;
_lamps = nearestObjects [_pos, ["Lamps_Base_F","Land_LampDecor_F","Land_PowerPoleWooden_L_F"], _radius];

while {!alive transformer} do {

    private "_nLampsOff";
    _nLampsOff = 0;
    {
        if (_x getHitPointDamage "light_0_hitpoint") then {
            _nLampsOff = _nLampsOff + 1;
        };
    } forEach _lamps;

    if (LIGHTS_AGGELOCHORI_SHOULD_BE_OFF AND ((_nLampsOff / (count _lamps)) < 0.25)) then {

        null = [1.00,0.00] execVM "scripts\lightswitch-aggelochori.sqf";

    };

    sleep 15;
};
