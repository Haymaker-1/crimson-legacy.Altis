private "_veh";
private "_knownHitPointStrings";
private "_knownHitPoints";
private "_configEntry";
private "_configHitPoints";
private "_report";

_veh = _this select 0;

_knownHitPointStrings = [   "wheel_1_1_steering",
                            "wheel_1_2_steering",
                            "wheel_1_3_steering",
                            "wheel_2_1_steering",
                            "wheel_2_2_steering",
                            "wheel_2_3_steering",
                            "Glass1",
                            "Glass2",
                            "Glass3",
                            "Glass4",
                            "Glass5",
                            "Glass6",
                            "motor",
                            "mala vrtule",
                            "Main_Light_hitpoint",
                            "light_0_hitpoint",
                            "light_1_hitpoint",
                            "light_2_hitpoint",
                            "light_3_hitpoint",
                            "light_4_hitpoint",
                            "light_5_hitpoint",
                            "Cabin_illumination_hitpoint",
                            "Light_L",
                            "Light_R",
                            "otocVez",
                            "pas_L",
                            "pas_P",
                            "telo",
                            "vez",
                            "zbran",
                            "HitLTrack",
                            "HitRTrack",
                            "HitTurret",
                            "HitGun",
                            "HitEngine",
                            "HitEngine2",
                            "HitEngine3",
                            "HitHRotor",
                            "HitVRotor",
                            "HitBatteries",
                            "HitLight",
                            "HitHydraulics",
                            "HitTransmission",
                            "HitGear",
                            "HitFuel",
                            "HitHStabilizerL1",
                            "HitHStabilizerR1",
                            "HitVStabilizer1",
                            "HitTail",
                            "HitPitotTube",
                            "HitStaticPort",
                            "HitStarter1",
                            "HitStarter2",
                            "HitStarter3",
                            "HitAvionics",
                            "HitHull",
                            "HitMissiles",
                            "HitRGlass",
                            "HitLGlass",
                            "HitGlass1",
                            "HitGlass2",
                            "HitGlass3",
                            "HitGlass4",
                            "HitGlass5",
                            "HitGlass6"];




_knownHitPoints = [];
{
    private "_hitPointStr";
    private "_damage";
    _hitPointStr = _x;
    _damage = _veh getHitPointDamage _hitPointStr;
    if (!isnil "_damage") then {
        private "_nElems";
        _nElems = count _knownHitPoints;
        _knownHitPoints resize (_nElems + 1);
        _knownHitPoints set [_nElems,[_hitPointStr,_damage]];
    };
} forEach _knownHitPointStrings;



_configEntry = configFile >> "CfgVehicles" >> typeOf _veh >> "HitPoints";
_configHitPoints = [];
for "_iHitPoint" from 0 to count _configEntry - 1 do {

    private "_iCharStart";
    private "_fullStr";
    private "_hitPointFullArray";
    private "_iCharEnd";
    private "_hitPoint";
    private "_iChar";
    private "_hitPointStr";
    private "_damage";
    private "_nElems";

    _iCharStart = count toArray (str (_configEntry));
    _fullStr = str (_configEntry select _iHitPoint);
    _hitPointFullArray = toArray _fullStr;
    _iCharEnd = count _hitPointFullArray;

    _hitPoint = [];
    _hitPoint resize (_iCharEnd -_iCharStart - 1);
    _iChar = 0;
    {
        if (_forEachIndex>_iCharStart) then {
            _hitPoint set [_iChar,_x];
            _iChar = _iChar + 1;
        };
    } forEach _hitPointFullArray;

    _hitPointStr = toString _hitPoint;
    _damage = _veh getHitPointDamage _hitPointStr;

    _nElems = count _configHitPoints;
    _configHitPoints resize (_nElems + 1);
    _configHitPoints set [_nElems,[_hitPointStr,_damage]];

};

_report = _configHitPoints + _knownHitPoints;

_report
