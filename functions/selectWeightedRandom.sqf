private "_table";
private "_forceIndex";
private "_returnItem";

_table = _this select 0;
_forceIndex = _this select 1;
_returnItem = nil;

if (isnil "_forceIndex") then {

    private "_sum";
    private "_urandom";

    _sum = 0;
    {
        _sum = _sum + (_x select 1);
    } forEach _table;

    {
        private "_content";
        private "_prob";
        _content = _x select 0;
        _prob = (_x select 1) / _sum;
        _table set [_forEachIndex,[_content,_prob]];
    } forEach _table;

    _returnItem = _table select 0 select 0;
    _urandom = random 1.0;
    _sum = 0;
    {
        _sum = _sum + (_x select 1);
        if ( _urandom <= _sum ) exitWith {
            _returnItem = _x select 0;
        };
    } forEach _table;
} else {
    _returnItem = _table select _forceIndex select 0;
};

_returnItem
