
// posATL
// dir
// weapontype
// probability of presence
// probability of being indicated on the map

_theTable = 
[
 [[3560.6,12873.7,4.31142],      216,  "O_HMG_01_high_F",0.30,0.80],
 [[3710.27,13403.6,13.2569],      42,  "O_HMG_01_high_F",0.30,0.80],
 [[3801.76,13410,4.60929],        78,  "O_HMG_01_high_F",0.30,0.80],
 [[3558.91,12874.9,0.440392],    212,  "O_HMG_01_high_F",0.30,0.80],
 [[3630.13,12827.7,3.89456],     127,  "O_HMG_01_high_F",0.30,0.80],
 [[3649.64,12836.7,18.9288],     337,  "O_HMG_01_high_F",0.30,0.80],
 [[3666.8,12837.5,17.2425],       98,  "O_HMG_01_high_F",0.30,0.80],
 [[3670.25,12815.2,17.2773],     129,  "O_HMG_01_high_F",0.30,0.80], 
 [[3664.34,12813.1,12.7699],     129,  "O_HMG_01_high_F",0.30,0.80],
 [[3660.48,12813.1,13.0582],     221,  "O_HMG_01_high_F",0.30,0.80],
 [[3687.15,13101.7,0.377017],    280,  "O_HMG_01_high_F",0.30,0.80],
 [[3684.69,13147.4,12.5322],     234,  "O_HMG_01_high_F",0.30,0.80],
 [[3528.42,12997.5,12.0126],     264,  "O_HMG_01_high_F",0.30,0.80],
 [[3628.35,13082,4.38347],       357,  "O_HMG_01_high_F",0.30,0.80],
 [[3628.33,13071.3,4.27421],     195,  "O_HMG_01_high_F",0.30,0.80],
 [[3630.64,13075.6,0.455126],    350,  "O_HMG_01_high_F",0.30,0.80],
 [[3640.37,13082.1,4.18592],     350,  "O_HMG_01_high_F",0.30,0.80],
 [[3650.49,13077,0.455505],      348,  "O_HMG_01_high_F",0.30,0.80],
 [[3684.59,13110.4,0.348903],    273,  "O_HMG_01_high_F",0.30,0.80],
 [[3648.76,13199.2,3.55304],     196,  "O_HMG_01_high_F",0.30,0.80],
 [[3648.1,13185.5,3.48052],      204,  "O_HMG_01_high_F",0.30,0.80],
 [[3658.61,13195,3.59976],       106,  "O_HMG_01_high_F",0.30,0.80],
 [[3658.95,13196.7,7.24318],     103,  "O_HMG_01_high_F",0.30,0.80],
 [[3654.05,13194.7,7.70263],     198,  "O_HMG_01_high_F",0.30,0.80],
 [[3919.86,13301.3,0.00170898],  283,  "O_HMG_01_high_F",0.30,0.80],
 [[3801.76,13399.8,8.64107],     196,  "O_HMG_01_high_F",0.30,0.80],
 [[3792.24,13400.8,12.5399],     185,  "O_HMG_01_high_F",0.30,0.80],
 [[3780.54,13413.2,12.585],      357,  "O_HMG_01_high_F",0.30,0.80],
 [[3798.99,13427.2,8.23927],      42,  "O_HMG_01_high_F",0.30,0.80], 
 [[3761.78,13562.5,3.79287],     322,  "O_HMG_01_high_F",0.30,0.80],
 [[3820.14,13713.5,0.00138855],   63,  "O_HMG_01_high_F",0.30,0.80],
 [[3777.03,13802.6,0.00163078],  180,  "O_HMG_01_high_F",0.30,0.80],
 [[3700.65,13871.6,5.02193],     224,  "O_HMG_01_high_F",0.30,0.80],
 [[3699.03,13870,5.08904],       326,  "O_HMG_01_high_F",0.30,0.80],
 [[3729.92,13932.7,4.04055],     130,  "O_HMG_01_high_F",0.30,0.80]
];


_actualDefenses = [];

_nDefenses = count _theTable;
_minDistAllowed = 100;
_spread = 50;

for "_i" from 0 to (_nDefenses - 1) do {

    _thePos = _theTable select _i select 0;
    _theDir = _theTable select _i select 1;
    _theWeapon = _theTable select _i select 2;
    _probPresent = _theTable select _i select 3;
    _probKnown = _theTable select _i select 4;

    _minDist = 1000;
    {
        _dist = (_x select 0) distance _thePos;
        if (_dist < _minDist) then {
            _minDist = _dist;
        };
        
    } forEach _actualDefenses;
    
    _conditionPresent = ((random 1) < _probPresent) AND (_minDist > _minDistAllowed);
    
    if (_conditionPresent) then {
        null = [_thePos,_theDir,_theWeapon] execVM "scripts\spawn-mounted-gun.sqf";
        _iDefenseActual = count _actualDefenses;
        _actualDefenses resize _iDefenseActual + 1;
        _actualDefenses set [_iDefenseActual,_theTable select _i];
    };
    
    _conditionKnown = _conditionPresent AND ((random 1) < _probKnown);
    if (_conditionKnown) then {
    
        _theMarkerPos = [(_thePos select 0) - _spread/2 + (random 1)*_spread, (_thePos select 1) - _spread/2 + (random 1)*_spread, (_thePos select 2)];
    
        _markerName = format ["MARKER_STATIC_DEFENSE_%1",_i];
        _marker = createMarker [_markerName, _theMarkerPos ];
        _markerName setMarkerShape "ICON";
        _markerName setMarkerType "mil_warning";
        _markerName setMarkerSize [0.5,0.5];
        _markerName setMarkerDir 0;
        _markerName setMarkerColor "ColorRed";
    };
    
};


