



_posWeaponsCrate = getMarkerPos "MARKER_WAREHOUSE_AGIOS_WEAPONS_CRATE";
_weaponsHolder = createVehicle ["GroundWeaponHolder",[0,0,0],[], 0, "CAN_COLLIDE"];
_weaponsHolder addMagazineCargo ["16Rnd_9x21_Mag",1];
_weaponsCrate = createVehicle ["Land_CratesWooden_F",_posWeaponsCrate,[], 0, "CAN_COLLIDE"];
_weaponsCrate setDir random 360;
_weaponsCrate allowDamage false;

_posMagazinesCrate = getMarkerPos "MARKER_WAREHOUSE_AGIOS_MAGAZINES_CRATE";
_magazinesHolder = createVehicle ["GroundWeaponHolder",[0,0,0],[], 0, "CAN_COLLIDE"];
_magazinesHolder addItemCargo ["FirstAidKit",1];
_magazinesCrate = createVehicle ["Land_CratesWooden_F",_posMagazinesCrate,[], 0, "CAN_COLLIDE"];
_magazinesCrate setDir random 360;
_magazinesCrate allowDamage false;

_posItemsCrate = getMarkerPos "MARKER_WAREHOUSE_AGIOS_ITEMS_CRATE";
_itemsHolder = createVehicle ["GroundWeaponHolder",[0,0,0],[], 0, "CAN_COLLIDE"];
_itemsHolder addWeaponCargo ["hgun_rook40_F",1];
_itemsCrate = createVehicle ["Land_CratesWooden_F",_posItemsCrate,[], 0, "CAN_COLLIDE"];
_itemsCrate setDir random 360;
_itemsCrate allowDamage false;



_areasIveBeenTo = ["MARKER_PERIMETER_FGF_AGIOS_KONSTANTINOS",
                   "MARKER_PERIMETER_KLD_NEGADES",
                   "MARKER_OUTER_PERIMETER_PILOT"];

{

    _perimeter = [_x] call HAYMAKER_fnc_constructPerimeter;
    _bbox = [_perimeter] call HAYMAKER_fnc_calcBoundingBox;

    _xLeft = _bbox select 0 select 0;
    _yBottom = _bbox select 0 select 1;

    _xRight = _bbox select 1 select 0;
    _yTop = _bbox select 1 select 1;

    _xWidth = _xRight - _xLeft;
    _yHeight = _yTop - _yBottom;


    _pos = [_xLeft + 0.5 * _xWidth , _yBottom + 0.5 * _yHeight,0.0];
    _radius = nil;

    if (_xWidth > _yHeight) then
    {
        _radius = sqrt(2) * (_xWidth/2);
    }
    else
    {
        _radius = sqrt(2) * (_yHeight/2);
    };

    _men = nearestObjects [_pos,["Man"], _radius];
    {
        if (!alive _x) then
        {

            _man = _x;
            
            _arr = weapons _man;
            {
                _man removeWeapon _x;
                _weaponsHolder addWeaponCargo [_x, 1];
            } forEach _arr;
            
            _arr = magazines _man;
            {
                _man removeMagazine _x;
                _magazinesHolder addMagazineCargo [_x, 1];
            } forEach _arr;
            
            _arr = items _man;
            {
                _man removeItem _x;
                _itemsHolder addItemCargo [_x, 1];
            } forEach _arr;

            _arr = assignedItems _man;
            {
                _man unassignItem _x;
                _man removeItem _x;
                _itemsHolder addItemCargo [_x, 1];
            } forEach _arr;            
           
            _backpackType = backpack _man;
            // clearAllItemsFromBackpack _man;
            removeBackpack _man;
            _itemsHolder addBackpackCargo [_backpackType,1];
                        
            _vest = vest _man;
            removeVest _man;
            _itemsHolder addItemCargo [_vest,1];
            
            _headgear = headgear _man;
            removeHeadgear _man;
            _itemsHolder addItemCargo [_headgear,1];
            
            _goggles = goggles _man;
            removeGoggles _man;
            _itemsHolder addItemCargo [_goggles,1];
           
        };
    } forEach _men;
    
    // remove the contents of the backpacks in the _itemsHolder
    {
        clearMagazineCargo _x;
        clearWeaponCargo _x;
        clearItemCargo _x;
    } forEach everyBackpack _itemsHolder;

    _stuffOnTheGround = nearestObjects [_pos,["GroundWeaponHolder","WeaponHolderSimulated"], _radius];
    {
        _holder = _x;
        
        _arr = weaponCargo _holder;
        {
            _holder removeWeapon _x;
            _weaponsHolder addWeaponCargo [_x, 1];
        } forEach _arr;
        
        _arr = magazineCargo _holder;
        {
            _holder removeMagazine _x;
            _magazinesHolder addMagazineCargo [_x, 1];
        } forEach _arr;
        
        _arr = itemCargo _holder;
        {
            _holder removeItem _x;
            _itemsHolder addItemCargo [_x, 1];
        } forEach _arr;
        
        if (typeOf(_holder)=="WeaponHolderSimulated") then
        {
            deleteVehicle _holder;
        };
    } forEach _stuffOnTheGround;    

} forEach _areasIveBeenTo;

// attach to respective crate

_weaponsHolder attachTo [_weaponsCrate,[0,0,0.65]]; 
_magazinesHolder attachTo [_magazinesCrate,[0,0,0.65]];
_itemsHolder attachTo [_itemsCrate,[0,0,0.65]];


// repack each holder:

_weaponCargo = getWeaponCargo _weaponsHolder;
_weapons = _weaponCargo select 0;
_numbers = _weaponCargo select 1;
clearWeaponCargo _weaponsHolder;
{
    _weaponsHolder addWeaponCargo [_x, _numbers select _forEachIndex];
} forEach _weapons;
clearMagazineCargo _weaponsHolder;

_magazineCargo = getMagazineCargo _magazinesHolder;
_magazines = _magazineCargo select 0;
_numbers = _magazineCargo select 1;
clearMagazineCargo _magazinesHolder;
{
    _magazinesHolder addMagazineCargo [_x, _numbers select _forEachIndex];
} forEach _magazines;
clearItemCargo _magazinesHolder;


_itemCargo = getItemCargo _itemsHolder;
_items = _itemCargo select 0;
_numbers = _itemCargo select 1;
clearItemCargo _itemsHolder;
{
    _itemsHolder addItemCargo [_x, _numbers select _forEachIndex];
} forEach _items;
clearWeaponCargo _itemsHolder;



