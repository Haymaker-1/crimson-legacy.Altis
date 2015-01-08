
_group = createGroup WEST;
_nUnitsSF = 4;



sfTeamProb = [
         [[0,"B_Soldier_M_F",     "marksman"],    0.15],
         [[1,"B_soldier_repair_F","engineer"],    0.15],
         [[2,"B_medic_F",         "medic"],       0.15],
         [[3,"B_soldier_AR_F",    "autorifleman"],0.15],
         [[4,"B_Soldier_F",       "rifleman"],    0.25],
         [[5,"B_Soldier_GL_F",    "grenadier"],   0.15]
        ];

_arifle = nil;
_arifleGL = nil;
if (BLUFOR_ARIFLE_OF_CHOICE == "f2000") then {
    _arifle = "arifle_Mk20_plain_F";
    _arifleGL = "arifle_Mk20_GL_plain_F";

};
if (BLUFOR_ARIFLE_OF_CHOICE == "tavor") then {
    _arifle = "arifle_TRG21_F";
    _arifleGL = "arifle_TRG21_GL_F";
};



for "_iUnitSF" from 0 to (_nUnitsSF - 1) do {

    _fighterType = nil;
    if (_iUnitSF == 0) then {
        _fighterType = "B_Soldier_TL_F";  // teamleader
    }
    else {

        // FIXME for some reason the call to selectWeightedRandom only works
        // as intended when the scope of the input variable 'sfTeamProb' is global
        
        _tmp = [sfTeamProb] call HAYMAKER_fnc_selectWeightedRandom;

        _fighterTypeIdx = _tmp select 0;    
        _fighterType = _tmp select 1;
        sfTeamProb set [_fighterTypeIdx,[_tmp,0.00]];    
        
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


// destroy global var sfTeamProb
sfTeamProb = nil;




