
private "_str1";
private "_str2";
private "_nCharsCompare";
private "_strsArePartlyEqual";
private "_arr1";
private "_arr2";

_str1 = _this select 0;
_str2 = _this select 1;
_nCharsCompare = _this select 2;

_strsArePartlyEqual = nil;

if (isNil "_str1") then {
    player globalChat "DBG: first string is empty ('strcmpn.sqf')";
};

if (isNil "_str2") then {
    player globalChat "DBG: second string is empty ('strcmpn.sqf')";
};

_arr1 = toArray _str1;
_arr2 = toArray _str2;

if (isNil "_nCharsCompare") then {

    private "_nCharsStr1";
    private "_nCharsStr2";

    _nCharsStr1 = count _arr1;
    _nCharsStr2 = count _arr2;

    if (_nCharsStr1 < _nCharsStr2) then {
        _nCharsCompare = _nCharsStr1;
    } else {
        _nCharsCompare = _nCharsStr2;
    };
};

_arr1 resize _nCharsCompare;
_arr2 resize _nCharsCompare;

if (_arr1 isEqualTo _arr2) then {
    _strsArePartlyEqual = true;
} else {
    _strsArePartlyEqual = false;
};


// return:
_strsArePartlyEqual
