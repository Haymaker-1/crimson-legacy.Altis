
private "_unit";

_unit = _this select 0;

while {alive _unit} do {
    {
        private = "_target";
        private = "_targetSide";
        _target = _x;
        _targetSide = _target select 2;

        if (_targetSide == WEST) then {

            private = "_id";
            _id = (_target select 4);
            if (_unit knowsabout _id > 3.5) then {
                (group negades_sniper) reveal _id;
                negades_sniper doTarget _id;
                negades_sniper doFire _id;
            };
        };
    } forEach (_unit nearTargets 500);

    sleep 30;
};
