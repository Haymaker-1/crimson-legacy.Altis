

private ["_arr","_n","_randNumbers","_i","_bubResult","_idx","_out"];

_arr = _this select 0;
_nResults = _this select 1;

if (isnil "_nResults") then {
    _nResults = 1;
};

if (_nResults > count _arr) then {
    _nResults = count _arr;
};


_n = count _arr;

_randNumbers = [];
_randNumbers resize _n;
for "_i" from 0 to (_n - 1) do
{
    _randNumbers set [_i,random 1.0];
};

_bubResult = [_randNumbers] call HAYMAKER_fnc_bubbleSort;


_idx = _bubResult select 1 select 0;

_out = [];
_out resize _nResults;
for "_iResult" from 0 to (_nResults - 1) do {

    _idx = (_bubResult select 1) select _iResult;
    _out set [_iResult,_arr select _idx];
};

_out