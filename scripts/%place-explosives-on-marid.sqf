
// MARID
_veh = _this select 0;
_nMinutesBoom = _this select 1;
_placementOffset = _this select 2;
_placementVectorUp = _this select 3;

_bomb = createVehicle ["DemoCharge_Remote_Ammo" ,getPos player,[],0,"NONE"];
_bomb attachTo [_veh,_placementOffset];
_bomb setVectorUp _placementVectorUp;

_dateOfPlacement = dateToNumber date;


_ticking = true;

while {_ticking} do {
  
    _dateNow = dateToNumber date;

    _nMinutes = (_dateNow - _dateOfPlacement) * 365 * 24 * 60;
               
    sleep 5;
    if (_nMinutes>_nMinutesBoom) then 
    {   
        sleep random 60;
        _ticking = false;
    };
};

_boom = createVehicle ["Bo_Mk82" ,getPos _bomb,[],0,"NONE"];
sleep 1;
deleteVehicle _bomb;
