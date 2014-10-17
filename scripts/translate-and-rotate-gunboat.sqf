
  



_egressPos = getMarkerPos "MARKER_EGRESS_ALPHA_BOAT";
_boatPos = getPos THE_GUNBOAT;
_dir = [_boatPos,_egressPos] call HAYMAKER_fnc_calcDirection;

_leavePos = [(_boatPos select 0) + (sin _dir) * 15,(_boatPos select 1) + (cos _dir) * 15,0];

_freeFloatDepth = -0.87;

_dx = (_leavePos select 0) - (_boatPos select 0);
_dy = (_leavePos select 1) - (_boatPos select 1);

_n = 1000;

for "_i" from 0 to _n do
{

    
    if ((getPosATL THE_GUNBOAT select 2) < _freeFloatDepth) then 
    {
        _depth = -0.87;
    }
    else
    {
        _depth = 0;
    };

    _newPos = [(_boatPos select 0) + (_i/_n)*_dx,(_boatPos select 1) + (_i/_n)*_dy,-0.87];
    
    THE_GUNBOAT setPos _newPos;
    
    sleep 0.025;

};





_leaveDir = 265;

_rotate = true;
while {_rotate} do
{
    _boatDir = getDir THE_GUNBOAT;
    if (_boatDir<_leaveDir-5) then
    {
        THE_GUNBOAT setDir (_boatDir + 0.1)%360;
    }
    else
    {
        if (_boatDir>_leaveDir+10) then
        {
            THE_GUNBOAT setDir (_boatDir - 0.1)%360;
        }
        else
        {
            _rotate = false;
        };
    };
    sleep 0.01;
};



