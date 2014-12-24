

// FIXME somehow the support boxes and ammo boxes are not created

_data = [
            ["Land_Cargo_Patrol_V3_F",[3870.47,13476.1,-0.25],125.3],
            ["Land_HBarrierTower_F",[3853.69,13447.4,-0.10],20.0],
            ["O_HMG_01_high_F",[3881.94,13457.2,0.00180817],279.188],
            ["O_Truck_02_transport_F",[3820.24,13396.7,0.00130749],46.6176],
            ["O_G_Quadbike_01_F",[3861.62,13465.7,0.00119591],319.233],
            ["O_G_Quadbike_01_F",[3871.69,13484.8,0.00132751],129.201],
            ["Land_Cargo_Patrol_V3_F",[3894.33,12692.1,-0.25],59.0597],
            ["Land_HBarrierTower_F",[3800.04,12655.2,-0.10],273.093],
            ["O_HMG_01_high_F",[3821.88,12644,0.902819],67.142],
            ["O_G_Quadbike_01_F",[3858.05,12664.7,0.900274],104.241],
            ["O_G_Quadbike_01_F",[3874.48,12725.6,0.901014],297.973],
            ["Land_HBarrierTower_F",[3631.1,13127.3,-0.10],168.0],
            ["Land_HBarrierTower_F",[3661.83,13103.7,-0.10],311.0],
            ["O_HMG_01_high_F",[3666.83,13120.7,0.00142002],342.063],
            ["Land_Cargo_Patrol_V3_F",[3500.28,13632.7,-0.25],129.553],
            ["O_HMG_01_high_F",[3502.76,13610,0.00220394],151.808],
            ["O_HMG_01_high_F",[3517.78,13622.1,0.00160217],103.423],
            ["O_G_Quadbike_01_F",[3512.08,13638,0.00152016],106.891],
            ["O_G_Quadbike_01_F",[3495.84,13619.2,0.00168133],108.16],
            ["Land_Cargo_Patrol_V3_F",[4927.61,16404.2,-0.25],352.099],
            ["Land_HBarrierTower_F",[4932.16,16449.1,-0.10],210.816],
            ["O_G_Quadbike_01_F",[4928.6,16434.3,0.00135422],222.331],
            ["O_G_Quadbike_01_F",[4933.56,16411.6,0.00127983],105.1],
            ["Land_Cargo_Patrol_V3_F",[4213.22,17385.7,-0.25],303.459],
            ["O_HMG_01_high_F",[4200.02,17378.2,0.0019455],295.168],
            ["O_G_Quadbike_01_F",[4229.41,17387.3,0.0014267],2.88236],
            ["O_G_Quadbike_01_F",[4220.57,17382.6,0.00117493],301.728],
            ["Land_HBarrier_5_F", [4215.31,17402.1,-0.20],155.0],
            ["Land_HBarrier_5_F",[4203.47,17396,-0.22],116.0],
            ["Land_HBarrier_5_F",[4192.27,17387.3,-0.23],110.0],
            ["Land_HBarrier_5_F",[4187.89,17373.8,-0.20],90.0],
            ["Land_HBarrier_5_F",[4223.48,17371.2,-0.22],330.0],
            ["Land_HBarrier_5_F",[4240.34,17384.3,-0.22],332.0],
            ["Land_HBarrier_5_F",[4225.64,17395,-0.14],226.769],
            ["Land_BagBunker_Small_F",[4245.5,17419.9,-0.10],43.1434],
            ["Land_HBarrier_Big_F",[4251.31,17425.8,-0.180054],223.09],
            ["Land_HBarrier_Big_F",[4243.36,17434.4,-0.197601],229.696],
            ["O_HMG_01_high_F",[4238.92,17407.6,0.00150299],151.125],
            ["Box_East_Ammo_F",[4224.66,17392.2,0.00146484],257.295],
            ["Box_East_Grenades_F",[4224.72,17389.9,0.00144958],331.337],
            ["Box_East_Ammo_F",[4904.28,16395.2,0.900057],269.258],
            ["Box_East_Grenades_F",[4906.07,16394.8,0.906973],313.35],
            ["Box_East_Support_F",[4907.21,16399.2,0.89868],23.9526],
            ["Box_East_Ammo_F",[3520.32,13628.3,0.00125122],214.914],
            ["Box_East_Grenades_F",[3518.52,13629.2,0.00151348],326.068],
            ["Box_East_Support_F",[3519.26,13632.7,0.00157833],349.554],
            ["Box_East_Ammo_F",[3893.43,12699.6,0.00146866],356.347],
            ["Box_East_Grenades_F",[3892.08,12696.4,0.00148201],197.276],
            ["Box_East_Support_F",[3890.91,12698.8,0.00135231],61.382],
            ["Box_East_Grenades_F",[3858.5,13443.7,0.00138474],281.108],
            ["Box_East_Support_F",[3858.95,13446,0.00139999],281.108],
            ["Box_East_Ammo_F",[3858.19,13448.7,0.00188923],202.792]
            
            
];


{
    _type = _x select 0;
    _pos = _x select 1;
    _dir = _x select 2;
    
    
    _veh = _type createVehicle _pos;
    //_veh setVariable ["BIS_enableRandomization", false];
    _veh setDir _dir;
    _veh setPos _pos;

    if (_type in ["Land_Cargo_Patrol_V3_F","Land_HBarrierTower_F","Land_BagBunker_Small_F"]) then {
        _veh setPosATL _pos;
    };
    
    if (!(_type in ["Land_Cargo_Patrol_V3_F","Land_HBarrierTower_F","Land_BagBunker_Small_F"])) then {
        _normal = surfaceNormal _pos;
        _veh setVectorUp _normal;
    };

    if (_type isKindOf "Car") then {
        _veh setFuel (0.01+random 0.05);
    };
    
    if (_type == "Box_East_Support_F") then {
    
        _weapons = weaponCargo _veh;
        clearWeaponCargo _veh;
        {
            if (_x != "Laserdesignator") then {
                // re-add all weapons except the designator
                _veh addWeaponCargo [_x,1];
            };
        } forEach _weapons;
    };
} forEach _data;


