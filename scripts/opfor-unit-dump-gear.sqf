
private = "_theUnit";
private = "_doRemoveGear";
private = "_inventory";
private = "_holder";


_theUnit = _this select 0;

_doRemoveGear = true;

_inventory = [_theUnit,_doRemoveGear] call HAYMAKER_fnc_showMeWhatYouGot;

_holder = createVehicle ["GroundWeaponHolder",getPos _theUnit,[],3,"NONE"];

{
    _holder addWeaponCargo [_x,1];
} forEach (_inventory select 0 select 1);

{
    _holder addMagazineCargo [_x,1];
} forEach (_inventory select 1 select 1);

{
    _holder addItemCargo [_x,1];
} forEach (_inventory select 2 select 1);

{
    _holder addItemCargo [_x,1];
} forEach (_inventory select 3 select 1);

{
    _holder addBackpackCargo [_x,1];
} forEach (_inventory select 4 select 1);

{
    _holder addItemCargo [_x,1];
} forEach (_inventory select 5 select 1);

{
    _holder addItemCargo [_x,1];
} forEach (_inventory select 6 select 1);


// remove the contents of the backpacks in the _holder
{
    clearMagazineCargo _x;
    clearWeaponCargo _x;
    clearItemCargo _x;
} forEach everyBackpack _holder;
