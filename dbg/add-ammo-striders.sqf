

striders = [krya_nera_strider,
            krya_nera_strider_hmg,
            krya_nera_strider_gmg];


{            
    _strider = _x;
    _gunner = assignedGunner _strider;
    _strider setAmmo [currentWeapon _strider, 1000];
    
} forEach striders;

