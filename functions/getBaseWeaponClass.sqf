
private "_theClassName";
private "_theSuperClass";
private "_theClassConfig";
private "_cont";

_theClassName = _this select 0;
_theSuperClass = "CfgWeapons";
_theClassConfig = configFile >> _theSuperClass >> _theClassName;


_cont = true;
while {_cont} do {
    if (isClass (_theClassConfig >> "LinkedItems")) then {
        _theClassConfig = inheritsFrom (_theClassConfig);
        _theClassName = configName _theClassConfig;
    } else {
        _cont = false;
    };
};


_theClassName
