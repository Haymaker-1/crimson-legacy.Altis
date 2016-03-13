
private "_perimeter";
private "_point";
private "_n";
private "_windingNumber";

_perimeter = _this select 0;
_point = _this select 1;
_n = count _perimeter;
_windingNumber = 0;

for "_i" from (1) to (_n - 1) do {

    private "_vertx1";
    private "_verty1";
    private "_vertx2";
    private "_verty2";

    _vertx1 = ((_perimeter select (_i - 1)) select 0) - (_point select 0);
    _verty1 = ((_perimeter select (_i - 1)) select 1) - (_point select 1);
    _vertx2 = ((_perimeter select (_i)) select 0) - (_point select 0);
    _verty2 = ((_perimeter select (_i)) select 1) - (_point select 1);

    if ((_verty1 * _verty2) < 0) then {
        private "_r";

        _r = _vertx1 + ((_verty1 * (_vertx2 - _vertx1)) / (_verty1 - _verty2));
        if (_r > 0) then {

            if (_verty1 < 0) then {
                _windingNumber = _windingNumber + 1;
            } else {
                _windingNumber = _windingNumber - 1;
            };
        };
    } else {
        if ((_verty1 == 0) AND (_vertx1 > 0)) then {

            if (_verty2 > 0) then {
                _windingNumber = _windingNumber + (1 / 2);
            } else {
                _windingNumber = _windingNumber - (1 / 2);
            };
        } else {
            if ((_verty2 == 0) AND (_vertx2 > 0)) then {

                if (_verty1<0) then {
                    _windingNumber = _windingNumber + (1 / 2);
                } else {
                    _windingNumber = _windingNumber - (1 / 2);
                };
            };
        };
    };
};


_windingNumber
