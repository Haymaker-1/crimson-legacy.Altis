/*
 Author: Haymaker-1

 Description:
 Use the winding number method to calculate whether a point lies within	a closed polygon defined by an array of points in 2-space.

 Parameter(s):
 _this select 0: ARRAY - list of positions together making up the perimeter
 _this select 1: ARRAY - 3D position as returned by e.g. getPos

 Returns:
 NUMBER - the winding number for the input point
*/

private ["_perimeter","_point","_n","_windingNumber","_i","_vertx1","_verty1","_vertx2","_verty2"];

_perimeter = _this select 0;
_point = _this select 1;
_n = count _perimeter;
_windingNumber = 0;

for "_i" from (1) to (_n - 1) do
{
    _vertx1 = ((_perimeter select (_i - 1)) select 0) - (_point select 0);
    _verty1 = ((_perimeter select (_i - 1)) select 1) - (_point select 1);
    _vertx2 = ((_perimeter select (_i)) select 0) - (_point select 0);
    _verty2 = ((_perimeter select (_i)) select 1) - (_point select 1);

    if ((_verty1 * _verty2) < 0) then
    {
        // vertex crosses x-axis
        _r = _vertx1 + ((_verty1*(_vertx2-_vertx1))/(_verty1-_verty2));
        if (_r>0) then
        // vertex crosses positive x-axis
        {
            if (_verty1<0) then
            {
                _windingNumber = _windingNumber + 1;
            }
            else
            {
                _windingNumber = _windingNumber - 1;
            };
        };
    }
    else
    {
        if ((_verty1==0) AND (_vertx1>0)) then
        // [_vertx1,_verty1] is on the positive x-axis
        {
            if (_verty2>0) then
            {
                _windingNumber = _windingNumber + (1/2);
            }
            else
            {
                _windingNumber = _windingNumber - (1/2);
            };
        }
        else
        {
            if ((_verty2==0) AND (_vertx2>0)) then
            // [_vertx2,_verty2] is on the positive x-axis
            {
                if (_verty1<0) then
                {
                    _windingNumber = _windingNumber + (1/2);
                }
                else
                {
                    _windingNumber = _windingNumber - (1/2);
                };
            };
        };
    };
};


// return:
_windingNumber
