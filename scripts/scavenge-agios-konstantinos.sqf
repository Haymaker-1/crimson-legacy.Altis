
private "_posWeaponsCrate";
private "_weaponsHolder";
private "_weaponsCrate";
private "_posMagazinesCrate";
private "_magazinesHolder";
private "_magazinesCrate";
private "_posItemsCrate";
private "_itemsHolder";
private "_itemsCrate";
private "_areasIveBeenTo";
private "_inventory";



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


_inventory =
[
    [ "weapons"   , [] ],
    [ "magazines" , [] ],
    [ "items"     , [] ],
    [ "headgear"  , [] ],
    [ "backpack"  , [] ],
    [ "vest"      , [] ],
    [ "goggles"   , [] ]
];


{
    private "_perimeter";
    private "_bbox";
    private "_xLeft";
    private "_yBottom";
    private "_xRight";
    private "_yTop";
    private "_xWidth";
    private "_yHeight";
    private "_pos";
    private "_radius";
    private "_men";
    private "_stuffOnTheGround";

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

    if (_xWidth > _yHeight) then {
        _radius = sqrt(2) * (_xWidth/2);
    } else {
        _radius = sqrt(2) * (_yHeight/2);
    };

    _men = nearestObjects [_pos,["Man"], _radius];
    {
        if (!alive _x) then {
            private "_man";
            _man = _x;
            _inventory = [_man,true,_inventory] call HAYMAKER_fnc_showMeWhatYouGot;
        };
    } forEach _men;

    _stuffOnTheGround = nearestObjects [_pos,["GroundWeaponHolder","WeaponHolderSimulated"], _radius];
    {
        private "_holder";
        private "_arr";
        _holder = _x;
        _arr = weaponCargo _holder;
        {
            private "_theWeaponName";
            private "_tmpPos";
            private "_tmpMan";
            _theWeaponName = _x;
            _tmpPos = getPos _holder;
            _tmpPos set [2, 1e5];
            _tmpMan = createVehicle["C_man_1",_tmpPos,[],0,"NONE"];
            _tmpMan enableSimulation false;
            removeAllAssignedItems _tmpMan;
            removeHeadgear _tmpMan;
            _tmpMan addWeapon _theWeaponName;
            _inventory = [_tmpMan,true,_inventory] call HAYMAKER_fnc_showMeWhatYouGot;
            deleteVehicle _tmpMan;
            _holder removeWeapon _theWeaponName;
        } forEach _arr;

        _arr = magazineCargo _holder;
        {
            private "_theMagazineName";
            private "_tmpPos";
            private "_tmpMan";
            _theMagazineName = _x;
            _tmpPos = getPos _holder;
            _tmpPos set [2, 1e5];
            _tmpMan = createVehicle["C_man_1",_tmpPos,[],0,"NONE"];
            _tmpMan enableSimulation false;
            removeAllAssignedItems _tmpMan;
            removeHeadgear _tmpMan;
            _tmpMan addMagazine _theMagazineName;
            _inventory = [_tmpMan,true,_inventory] call HAYMAKER_fnc_showMeWhatYouGot;
            deleteVehicle _tmpMan;
            _holder removeMagazine _theMagazineName;
        } forEach _arr;

        _arr = itemCargo _holder;
        {
            private "_theItemName";
            private "_tmpPos";
            private "_tmpMan";
            _theItemName = _x;
            _tmpPos = getPos _holder;
            _tmpPos set [2, 1e5];
            _tmpMan = createVehicle["C_man_1",_tmpPos,[],0,"NONE"];
            _tmpMan enableSimulation false;
            removeAllAssignedItems _tmpMan;
            removeHeadgear _tmpMan;
            _tmpMan addItem _theItemName;
            _inventory = [_tmpMan,true,_inventory] call HAYMAKER_fnc_showMeWhatYouGot;
            deleteVehicle _tmpMan;
            _holder removeItem _theItemName;
        } forEach _arr;

        if (typeOf(_holder)=="WeaponHolderSimulated") then
        {
            deleteVehicle _holder;
        };
    } forEach _stuffOnTheGround;

} forEach _areasIveBeenTo;


INVENTORY = _inventory;

// attach to respective crate

{
    _weaponsHolder addWeaponCargo [_x,1];
} forEach (_inventory select 0 select 1);

{
    _magazinesHolder addMagazineCargo [_x,1];
} forEach (_inventory select 1 select 1);

{
    _itemsHolder addItemCargo [_x,1];
} forEach (_inventory select 2 select 1);

{
    _itemsHolder addItemCargo [_x,1];
} forEach (_inventory select 3 select 1);

{
    _itemsHolder addBackpackCargo [_x,1];
} forEach (_inventory select 4 select 1);

{
    _itemsHolder addItemCargo [_x,1];
} forEach (_inventory select 5 select 1);

{
    _itemsHolder addItemCargo [_x,1];
} forEach (_inventory select 6 select 1);


// remove the contents of the backpacks in the _itemsHolder
{
    clearMagazineCargo _x;
    clearWeaponCargo _x;
    clearItemCargo _x;
} forEach everyBackpack _itemsHolder;


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
