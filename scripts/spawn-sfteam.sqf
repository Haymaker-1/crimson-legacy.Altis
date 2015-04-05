
_group = createGroup WEST;
_nUnitsSF = 4;

for "_iUnitSF" from 0 to (_nUnitsSF - 1) do {

    _fighterType = nil;
    if (_iUnitSF == 0) then {
        _fighterType = "B_Soldier_TL_F";  // teamleader
    }
    else {

        // FIXME for some reason the call to selectWeightedRandom only works
        // as intended when the scope of the input variable 'TEAM_PROB' is global
        
        _tmp = [TEAM_PROB] call HAYMAKER_fnc_selectWeightedRandom;

        _fighterTypeIdx = _tmp select 0;    
        _fighterType = _tmp select 1;
        TEAM_PROB set [_fighterTypeIdx,[_tmp,0.00]];    
        
    };

    _fighterType createUnit [getMarkerPos "MARKER_NABISCO_HELIPAD", _group];
    
};    

null = [_group] execVM "scripts\change-equipment-blufor-group-members.sqf";

{
    _x allowDamage false;
} forEach units _group; 

(units _group select 0) setRank "SERGEANT";
_group selectLeader (units _group select 0); 


    
_perimeter = ["MARKER_PERIMETER_LNN_NABISCO"] call HAYMAKER_fnc_constructPerimeter;
_iRandomPatrol = TOTAL_NUMBER_OF_RANDOM_PATROLS;
null = [_perimeter,_group,_iRandomPatrol] execVM "scripts\setAsRandomPatrol.sqf";
TOTAL_NUMBER_OF_RANDOM_PATROLS = TOTAL_NUMBER_OF_RANDOM_PATROLS + 1;

sf0 = units _group select 0;
sf1 = units _group select 1;
sf2 = units _group select 2;
sf3 = units _group select 3;


// destroy global var TEAM_PROB
TEAM_PROB = nil;




