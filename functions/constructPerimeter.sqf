

// "MARKER_PERIMETER_PILOT"
// marker numbers should start with 1 (basename is not including _)

private ["_perimeterBasename",
         "_n",
         "_perimeter",
         "_skipMarker",
         "_a",
         "_str",
         "_nElems",
         "_i",
         "_markerName"
         ];

_perimeterBasename = _this select 0;

_n = count (toArray _perimeterBasename);

_perimeter = [];


{
    _a = toArray _x;
    _a resize _n;
    _str = toString (_a);
    
    if (_str == _perimeterBasename) then 
    {
        _nElems = count _perimeter;
        _perimeter resize (_nElems+1);
        _perimeter set [_nElems,_x];
    };
} forEach allMapMarkers;


for "_i" from 0 to (count _perimeter)-1 do
{
    _perimeter set [_i,getMarkerPos (_perimeter select _i)];
    
};

// close the polygon:
_nElems = count _perimeter;
_perimeter resize (_nElems+1);
_perimeter set [_nElems,_perimeter select 0];

// return:
_perimeter

