
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setTaskState "Succeeded";
["TaskSucceeded", ["","Set up CP"]] call BIS_fnc_showNotification;

player allowDamage false;

cutText ["","BLACK OUT",5,false];
5 fadeSound 0;
sleep 5;

TASK_SEIZE_SRIFLE_DONE = true;
null = [] execVM "scripts\scavenge-agios-konstantinos.sqf";

_spawningComplete = [] execVM "scripts\spawn-guer-fireteam-warehouse-agios.sqf";
waitUntil {
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

_skiptimeValue = (15-daytime+random 0.25);
(_skiptimeValue * 3600) setFog 0;
skipTime _skiptimeValue;

SKIP_CLEANING_HOUSE = [CRASH_SITE_IS_CLEAR,AA_MAGOS_IS_CLEAR,AA_AMFISSA_IS_CLEAR] isEqualTo [true,true,true];

if (!SKIP_CLEANING_HOUSE) then {
    
    _perimeter = ["MARKER_PERIMETER_ODS_OP_AGIOS"] call HAYMAKER_fnc_constructPerimeter;
    {   
        if (alive _x) then {
            _posResume = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;
            _x setPos _posResume;
            _x setDir (200+random 40);
            _x setFatigue 0;
            _x setDamage 0;
        };
    } forEach units group player;


    5 fadeSound 1;
    cutText ["CP Agios, later that day...","BLACK IN",8,false];
    player allowDamage true;

    sleep 5;
    _isReady = [kostas, "lhdnftpm1"] execVM "scripts\unitradiospeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };

    _isReady = [player, "notjrcug1"] execVM "scripts\unitspeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };


    _siteIsClear = [CRASH_SITE_IS_CLEAR,AA_MAGOS_IS_CLEAR,AA_AMFISSA_IS_CLEAR];
    _n = 0;
    {
        if (!_x) then
        {
            _n = _n + 1;
        };
    } forEach _siteIsClear;

    if (_n > 1) then
    {
        _isReady = [kostas, "lhdnftpm2"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
    };

    _needAT = false; 
    
    if (_siteIsClear isEqualTo [false,false,false]) then {
    
        _isReady = [kostas, "lhdnftpm3"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };        
        
        _isReady = [player, "notjrcug2"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [kostas, "lhdnftpm4"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug3"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [kostas, "lhdnftpm5"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug4"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _needAT = true;

    };
    
    
    if (_siteIsClear isEqualTo [false,false,true]) then {
    
        _isReady = [kostas, "lhdnftpm6"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug2"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [kostas, "lhdnftpm7"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug3"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        
    };
    
    
    if (_siteIsClear isEqualTo [false,true,false]) then {
    
        _isReady = [kostas, "lhdnftpm8"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug2"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [kostas, "lhdnftpm9"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug4"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _needAT = true;
        
    };
    
    
    if (_siteIsClear isEqualTo [true,false,false]) then {
    
        _isReady = [kostas, "lhdnftpm10"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug3"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };

        _isReady = [kostas, "lhdnftpm11"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug4"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _needAT = true;
        
    };
    
    
    if (_siteIsClear isEqualTo [false,true,true]) then {
        
        _isReady = [kostas, "lhdnftpm12"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug2"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };

    };
    
    
    if (_siteIsClear isEqualTo [true,false,true]) then {
        
        _isReady = [kostas, "lhdnftpm13"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug3"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _needAT = true;

    };
    
    
    if (_siteIsClear isEqualTo [true,true,false]) then {
    
        _isReady = [kostas, "lhdnftpm14"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _isReady = [player, "notjrcug4"] execVM "scripts\unitspeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
        
        _needAT = true;
        
    };


    "MARKER_SHED_AGIOS" setMarkerColor "ColorBLACK";
    "MARKER_SHED_AGIOS" setMarkerType "mil_dot";
    _isReady = [kostas, "lhdnftpm15"] execVM "scripts\unitradiospeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };

    if (_needAT) then 
    {
        _isReady = [kostas, "lhdnftpm16"] execVM "scripts\unitradiospeak.sqf";
        waitUntil {
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
    };


    _isReady = [kostas, "lhdnftpm17"] execVM "scripts\unitradiospeak.sqf";
    waitUntil {
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };


    if (SHOW_CHAPTER_TITLES) then {
        null = ["Cleaning house"] execVM "scripts\show-chapter-title.sqf";
    };
    sleep 10;
    TIME_LAST_SAVEGAME = time;
    saveGame;



    if (!CRASH_SITE_IS_CLEAR) then
    {

        TASK_CLEAR_CRASH_SITE = player createSimpleTask ["TASKID_CLEAR_CRASH_SITE"];
        TASK_CLEAR_CRASH_SITE setSimpleTaskDescription ["We have reports of enemies patrolling the area around the crash site. Go there and eliminate them.","Clear crash site","Clear crash site"];
        TASK_CLEAR_CRASH_SITE setTaskState "Created";
        ["TaskCreated", ["","Clear crash site"]] call BIS_fnc_showNotification;
        TASK_CLEAR_CRASH_SITE_HAS_BEEN_ASSIGNED = true;
        
        sleep 6;
        
        null = [] spawn {
            
            waitUntil { 
                sleep 5;
                if (CRASH_SITE_IS_CLEAR) exitWith {true};
                false
            };
            TASK_CLEAR_CRASH_SITE setTaskState "Succeeded";
            ["TaskSucceeded", ["","Clear crash site"]] call BIS_fnc_showNotification;
        };

    };

    if (!AA_MAGOS_IS_CLEAR) then
    {

        TASK_CLEAR_AA_MAGOS = player createSimpleTask ["TASKID_CLEAR_AA_MAGOS"];
        TASK_CLEAR_AA_MAGOS setSimpleTaskDescription ["The enemy Anti-Air unit near Magos must be neutralized.","Neutralize AA Magos","Neutralize AA Magos"];
    //  TASK_CLEAR_AA_MAGOS setSimpleTaskDestination (getMarkerPos "MARKER_AA_MAGOS");
        TASK_CLEAR_AA_MAGOS setTaskState "Created";
        ["TaskCreated", ["","Neutralize AA Magos"]] call BIS_fnc_showNotification;
        TASK_CLEAR_AA_MAGOS_HAS_BEEN_ASSIGNED = true;
        
        sleep 6;
        
        null = [] spawn {
            
            waitUntil { 
                sleep 5;
                if (AA_MAGOS_IS_CLEAR) exitWith {true};
                false
            };
            TASK_CLEAR_AA_MAGOS setTaskState "Succeeded";
            ["TaskSucceeded", ["","Neutralize AA Magos"]] call BIS_fnc_showNotification;
        };    

    };

    if (!AA_AMFISSA_IS_CLEAR) then
    {

        TASK_CLEAR_AA_AMFISSA = player createSimpleTask ["TASKID_CLEAR_AA_AMFISSA"];
        TASK_CLEAR_AA_AMFISSA setSimpleTaskDescription ["The enemy Anti-Air unit near Amfissa must be neutralized.","Neutralize AA Amfissa","Neutralize AA Amfissa"];
    //  TASK_CLEAR_AA_AMFISSA setSimpleTaskDestination (getMarkerPos "MARKER_AA_AMFISSA");
        TASK_CLEAR_AA_AMFISSA setTaskState "Created";
        ["TaskCreated", ["","Neutralize AA Amfissa"]] call BIS_fnc_showNotification;
        TASK_CLEAR_AA_AMFISSA_HAS_BEEN_ASSIGNED = true;
        
        sleep 6;
        
        null = [] spawn {
            
            waitUntil { 
                sleep 5;
                if (AA_AMFISSA_IS_CLEAR) exitWith {true};
                false
            };
            TASK_CLEAR_AA_AMFISSA setTaskState "Succeeded";
            ["TaskSucceeded", ["","Neutralize AA Amfissa"]] call BIS_fnc_showNotification;
        };     

    };


    waitUntil { 
        sleep 5;
        if (CRASH_SITE_IS_CLEAR) exitWith {true};
        false
    };

    waitUntil { 
        sleep 5;
        if (AA_MAGOS_IS_CLEAR) exitWith {true};
        false
    };

    waitUntil {
        sleep 5;
        if (AA_AMFISSA_IS_CLEAR) exitWith {true};
        false
    };

    sleep 10;

    _isReady = [player, "notjrcug5"] execVM "scripts\unitspeak.sqf";
    waitUntil { 
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };

    sleep 6;

    _isReady = [kostas, "lhdnftpm18"] execVM "scripts\unitradiospeak.sqf";
    waitUntil { 
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };

    if ((count units group player) > 1) then {
        _isReady = [player, "notjrcug6"] execVM "scripts\unitspeak.sqf";
        waitUntil { 
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };

    }
    else {
        _isReady = [player, "notjrcug7"] execVM "scripts\unitspeak.sqf";
        waitUntil { 
            sleep 1;
            if (scriptDone _isReady) exitWith {true};
            false
        };
    };

    _isReady = [kostas, "lhdnftpm19"] execVM "scripts\unitradiospeak.sqf";
    waitUntil { 
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    sleep 10;
    
    cancelSimpleTaskDestination TASK_SET_UP_OP_AGIOS_KONSTANTINOS;
    
    TASK_FALL_BACK_TO_CP = player createSimpleTask ["TASKID_FALL_BACK_TO_CP"];
    TASK_FALL_BACK_TO_CP setSimpleTaskDescription ["Fall back to <marker name='MARKER_OP_AGIOS_KONSTANTINOS'>Agios Konstantinos</marker> to rest up.","Fall back to Agios","Fall back to Agios"];
    TASK_FALL_BACK_TO_CP setSimpleTaskDestination (getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS");
    TASK_FALL_BACK_TO_CP setTaskState "Assigned";
    ["TaskAssigned", ["","Fall back to Agios"]] call BIS_fnc_showNotification;
    
    waitUntil {
        sleep 5;
        if ((getPos player) distance (getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS") < 30) exitWith {true};
        false
    };

    TASK_FALL_BACK_TO_CP setTaskState "Succeeded";
    ["TaskSucceeded", ["","Fall back to Agios"]] call BIS_fnc_showNotification;
    
    cutText ["","BLACK OUT",5,false];
    5 fadeSound 0;
    player allowDamage false;

};



N_STICKS_DYNAMITE = 2;
_box = createVehicle ["Box_NATO_Ammo_F", getMarkerPos "MARKER_SHED_AGIOS",[],6,"NONE"]; 
_box setDir random 360;
_box addMagazineCargo ["DemoCharge_Remote_Mag",N_STICKS_DYNAMITE];

_weapon = [[["vector",0.25],["scorpion",0.50],["tavor",0.25]]] call HAYMAKER_fnc_selectWeightedRandom;
switch (_weapon) do {
    case "vector" : {
        _box addWeaponCargo ["SMG_01_F",1]; 
        _box addMagazineCargo ["30Rnd_45ACP_Mag_SMG_01_tracer_green",8];
        _box addMagazineCargo ["30Rnd_45ACP_Mag_SMG_01",8]; 
        _box addItemCargo ["muzzle_snds_acp",1]; 
    };
    case "scorpion": {
        _box addWeaponCargo ["SMG_02_F",1]; 
        _box addMagazineCargo ["30Rnd_9x21_Mag",12]; 
        _box addItemCargo ["muzzle_snds_L",1];
    };
    case "tavor": {
        _box addWeaponCargo ["arifle_TRG21_F",2];
        _box addMagazineCargo ["30Rnd_556x45_Stanag_Tracer_Green",19];
        _box addItemCargo ["muzzle_snds_M",4];
        _box addItemCargo ["optic_ACO_grn",4];
    };
    default { 
        player globalChat "error: no switch case."; 
    };
};

_box addItemCargo ["acc_flashlight",2];

sleep 5;

_DateStamp = date;
setDate [_DateStamp select 0, _DateStamp select 1, _DateStamp select 2, 18, 45];

//"FirePlace_burning_F" createVehicle (getMarkerPos "MARKER_FIRE_PLACE_CP_AGIOS");
"Land_Camping_Light_F" createVehicle (getMarkerPos "MARKER_FIRE_PLACE_CP_AGIOS");


_perimeter = ["MARKER_PERIMETER_ODS_OP_AGIOS"] call HAYMAKER_fnc_constructPerimeter;
{   
    if (alive _x) then {
        _posResume = [_perimeter] call HAYMAKER_fnc_generateRandomPositionInPolygon;
        _x setPos _posResume;
        _x setDir (200+random 40);
        _x setFatigue 0;
        _x setDamage 0;
    };
} forEach units group player;



_nLights = 3 + round(random 2);
null = [_nLights] execVM "scripts\spawn-barn-lights-agios-konstantinos.sqf";

sleep 6;

5 fadeSound 1;
cutText ["Later that day...","BLACK IN",8,false];
player allowDamage true;



sleep 10;

_isReady = [kostas, "lhdnftpm20"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "notjrcug8"] execVM "scripts\unitspeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm21"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "notjrcug9"] execVM "scripts\unitspeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm22"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "notjrcug10"] execVM "scripts\unitspeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm23"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm24"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

null = [] execVM "scripts\spawn-kavala-static-defenses.sqf";

_isReady = [kostas, "lhdnftpm25"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "notjrcug11"] execVM "scripts\unitspeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm26"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_spawningComplete = [] execVM "scripts\spawn-fireteam-power-plant.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

null = [] execVM "scripts\spawn-transformer-kavala.sqf";

_isReady = [kostas, "lhdnftpm27"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm28"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm29"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};




if (SKIP_CLEANING_HOUSE) then {


    _isReady = [kostas, "lhdnftpm30"] execVM "scripts\unitradiospeak.sqf";
    waitUntil { 
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    
    "MARKER_SHED_AGIOS" setMarkerColor "ColorBLACK";
    "MARKER_SHED_AGIOS" setMarkerType "mil_dot";
    
    _isReady = [kostas, "lhdnftpm31"] execVM "scripts\unitradiospeak.sqf";
    waitUntil { 
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
    
}
else {
    _isReady = [kostas, "lhdnftpm32"] execVM "scripts\unitradiospeak.sqf";
    waitUntil { 
        sleep 1;
        if (scriptDone _isReady) exitWith {true};
        false
    };
};
    


_isReady = [kostas, "lhdnftpm33"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [player, "notjrcug12"] execVM "scripts\unitspeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_isReady = [kostas, "lhdnftpm34"] execVM "scripts\unitradiospeak.sqf";
waitUntil { 
    sleep 1;
    if (scriptDone _isReady) exitWith {true};
    false
};

_nSeconds = (19.5-daytime)*3600;
if (_nSeconds>600) then {
    _nSeconds setFog [0.5,0.05,4];
    _nSeconds setRain 0;
    _nSeconds setOvercast 0.75;
};

if (SHOW_CHAPTER_TITLES) then {
    null = ["Nightstalker"] execVM "scripts\show-chapter-title.sqf";
};
sleep 10;
TIME_LAST_SAVEGAME = time;
saveGame;



// the part below this line used to be executed during the radio conversation with kostas;
// I moved it here because otherwise the conversation halts for 30 seconds or so.

null = [] execVM "scripts\populate-motor-pool-kavala.sqf";

_spawningComplete = [] execVM "scripts\spawn-fireteams-kavala.sqf";
waitUntil { 
    sleep 0.5;
    if (scriptDone _spawningComplete) exitWith {true};
    false
};
_spawningComplete = nil;

null = [] execVM "scripts\spawn-kavala-marids.sqf";
null = [] execVM "scripts\spawn-kavala-mortar-group.sqf";


