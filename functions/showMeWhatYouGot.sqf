private "_man";
private "_doRemove";
private "_initialValues";
private "_weaponArray";
private "_magazineArray";
private "_itemArray";
private "_headgearArray";
private "_backpackArray";
private "_vestArray";
private "_gogglesArray";
private "_primaryWeaponItems";
private "_handgunItems";
private "_arr";
private "_backpackType";
private "_vest";
private "_headgear";
private "_goggles";


_man = _this select 0;
_doRemove = _this select 1;
_initialValues = _this select 2;


_weaponArray = nil;
_magazineArray = nil;
_itemArray = nil;
_headgearArray = nil;
_backpackArray = nil;
_vestArray = nil;
_gogglesArray = nil;

if (isnil "_initialValues") then {
    _weaponArray = [];
    _magazineArray = [];
    _itemArray = [];
    _headgearArray = [];
    _backpackArray = [];
    _vestArray = [];
    _gogglesArray = [];
} else {
    _weaponArray = _initialValues select 0 select 1;
    _magazineArray = _initialValues select 1 select 1;
    _itemArray = _initialValues select 2 select 1;
    _headgearArray = _initialValues select 3 select 1;
    _backpackArray = _initialValues select 4 select 1;
    _vestArray = _initialValues select 5 select 1;
    _gogglesArray = _initialValues select 6 select 1;
};


if (isnil "_doRemove") then {
    _doRemove = true;
};


_primaryWeaponItems = primaryWeaponItems _man;
{
    if (_x != "") then {
        if (_doRemove) then {
            _man removePrimaryWeaponItem _x;
        };
        _itemArray = _itemArray + [_x];
    };
} forEach _primaryWeaponItems;

_handgunItems = handgunItems _man;
{
    if (_x != "") then {
        if (_doRemove) then {
            _man removeHandgunItem _x;
        };
        _itemArray = _itemArray + [_x];
    };
} forEach _handgunItems;

_arr = weapons _man;
{
    // retrieve the most basic version of the weapon by
    // traversing the inheritance tree:
    private "_theWeaponName";
    _theWeaponName = _x;
    if (_doRemove) then {
        _man removeWeapon _theWeaponName;
    };
    _theWeaponName = [_theWeaponName] call HAYMAKER_fnc_getBaseWeaponClass;
    _weaponArray = _weaponArray + [_theWeaponName];

} forEach _arr;

_arr = magazines _man;
{
    if (_doRemove) then {
        _man removeMagazine _x;
    };
    _magazineArray = _magazineArray + [_x];
} forEach _arr;

_arr = items _man;
{
    if (_doRemove) then {
        _man removeItem _x;
    };
    _itemArray = _itemArray + [_x];
} forEach _arr;

_arr = assignedItems _man;
{
    if (_doRemove) then {
        _man unassignItem _x;
        _man removeItem _x;
    };
    _itemArray = _itemArray + [_x];
} forEach _arr;

_backpackType = backpack _man;
if (_backpackType != "") then {
    // clearAllItemsFromBackpack _man;
    if (_doRemove) then {
        removeBackpack _man;
    };
    _backpackArray = _backpackArray + [_backpackType];
};

_vest = vest _man;
if (_vest != "") then {
    if (_doRemove) then {
        removeVest _man;
    };
    _vestArray = _vestArray + [_vest];
};

_headgear = headgear _man;
if (_headgear != "") then {
    if (_doRemove) then {
        removeHeadgear _man;
    };
    _headgearArray = _headgearArray + [_headgear];
};

_goggles = goggles _man;
if (_goggles != "") then {
    if (_doRemove) then {
        removeGoggles _man;
    };
    _gogglesArray = _gogglesArray + [_goggles];
};

// return
[
    [ "weapons"   , _weaponArray   ],
    [ "magazines" , _magazineArray ],
    [ "items"     , _itemArray     ],
    [ "headgear"  , _headgearArray ],
    [ "backpack"  , _backpackArray ],
    [ "vest"      , _vestArray     ],
    [ "goggles"   , _gogglesArray  ]
]
