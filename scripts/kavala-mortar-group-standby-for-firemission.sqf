

MORTAR_TARGETS = [];

private "_targetAgeMax";

_targetAgeMax = 5 / 60; // hours

while {LOOKOUT_FOR_MORTAR_TARGETS} do {

    {
        private "_targetAge";

        _targetAge = daytime - (_x select 0);

        if (_targetAge < _targetAgeMax) then {

            private "_spread";
            private "_nShells";

            _spread = 50 + (_targetAge / _targetAgeMax) * 200;
            _nShells = 5 + random 2;

            for "_iShell" from 0 to (_nShells - 1) do {

                private "_pos";

                _pos = [(_x select 1 select 0) - _spread / 2 + random _spread, (_x select 1 select 1) - _spread / 2 + random _spread, 20];

                if (daytime < 5.75 OR daytime > 20.0) then {
                    mortar1 addMagazine ["8Rnd_82mm_Mo_Flare_white",1];
                    mortarGunner doArtilleryFire [_pos,"8Rnd_82mm_Mo_Flare_white",1];
                    sleep 2;
                };
            };
        } else {
            MORTAR_TARGETS deleteAt _forEachIndex;
        };
    } forEach MORTAR_TARGETS;
    sleep (10 + random 20);
};
