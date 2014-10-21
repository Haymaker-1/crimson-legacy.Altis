
TASK_SET_UP_OP_AGIOS_KONSTANTINOS setTaskState "Succeeded";
["TaskSucceeded", ["","Set up CP"]] call BIS_fnc_showNotification;

player allowDamage false;

cutText ["","BLACK OUT",5,false];
5 fadeSound 0;

sleep 5;
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

null = [] execVM "scripts\scavenge-agios-konstantinos.sqf";
null = [] execVM "scripts\spawn-guer-fireteam-warehouse-agios.sqf";


_skiptimeValue = (15-daytime+random 0.25);
(_skiptimeValue * 3600) setFog 0;
skipTime _skiptimeValue;

waitUntil {sleep 1;SPAWN_AGIOS_DONE};

5 fadeSound 1;
cutText ["CP Agios, later that day...","BLACK IN",8,false];
player allowDamage true;

sleep 5;
kostas sideChat "Hello, lieutenant?";
sleep 4;

player sideChat "Hello, sir.";
sleep 3;


_sites = [CRASH_SITE_IS_CLEAR,AA_MAGOS_IS_CLEAR,AA_AMFISSA_IS_CLEAR];
_n = 0;
{
    if (!_x) then
    {
        _n = _n + 1;
    };
} forEach _sites;

if (_n >1) then
{
    kostas sideChat "There are a couple of things I want you to do.";
    sleep 5;
};

_words = ["First, ","Second, ", "Third, "];
_wordsIndex = 0;
_needAT = false; 
if (!CRASH_SITE_IS_CLEAR) then
{
    if (_n==1) then
    {
        kostas sideChat "I have reports of enemy footmobiles in the woods near the crash site. Locate and eliminate them.";
    } 
    else
    {
        kostas sideChat (_words select _wordsIndex)+"I have reports of enemy footmobiles in the woods near the crash site. Locate and eliminate them.";
    };
    sleep 7;
    _wordsIndex = _wordsIndex + 1;
    
    player sideChat "OK, I'm on it.";
    sleep 3;

};

if (!AA_MAGOS_IS_CLEAR) then
{
    if (_n==1) then 
    {
        kostas sideChat "The Anti-Air unit overlooking Kavala needs to go.";
    }
    else
    {
        kostas sideChat (_words select _wordsIndex)+"the Anti-Air unit overlooking Kavala needs to go.";
    };
    sleep 5;
    _wordsIndex = _wordsIndex + 1;
    _needAT = true;
    
    player sideChat "Can do, sir.";
    sleep 2;
    
};

if (!AA_AMFISSA_IS_CLEAR) then
{
    if (_n==1) then
    {
        kostas sideChat "The Anti-Air unit near Amfissa must be eliminated.";
    }
    else
    {
        kostas sideChat (_words select _wordsIndex)+"the Anti-Air unit near Amfissa must be eliminated.";
    };
    sleep 5;
    _wordsIndex = _wordsIndex + 1;
    _needAT = true;
    
    player sideChat "Eliminate the AA, roger that, sir.";
    sleep 5;
    
};


"MARKER_SHED_AGIOS" setMarkerColor "ColorBLACK";
"MARKER_SHED_AGIOS" setMarkerType "mil_dot";
kostas sideChat "The spoils of war are being collected at a barn in Agios. I've updated your map with the location.";
sleep 5;

if (_needAT) then 
{
    kostas sideChat "You may want to check it out before engaging the AA.";
    sleep 3;
};


kostas sideChat "Good luck. Kostas out.";
sleep 10;



if (SHOW_CHAPTER_TITLES) then {
    null = ["Cleaning house"] execVM "scripts\show-chapter-title.sqf";
};



if (!CRASH_SITE_IS_CLEAR) then
{

    TASK_CLEAR_CRASH_SITE = player createSimpleTask ["TASKID_CLEAR_CRASH_SITE"];
    TASK_CLEAR_CRASH_SITE setSimpleTaskDescription ["We have reports of enemies patrolling the area around the crash site. Go there and eliminate them.","Clear crash site","Clear crash site"];
//  TASK_CLEAR_CRASH_SITE setSimpleTaskDestination (getMarkerPos "MARKER_PILOT_DISTRESS_SIGNAL");
    TASK_CLEAR_CRASH_SITE setTaskState "Created";
    ["TaskCreated", ["","Clear crash site"]] call BIS_fnc_showNotification;
    TASK_CLEAR_CRASH_SITE_HAS_BEEN_ASSIGNED = true;
    
    sleep 6;
    
    null = [] spawn {
        
        waitUntil{sleep 5;CRASH_SITE_IS_CLEAR};
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
        
        waitUntil{sleep 5;AA_MAGOS_IS_CLEAR};
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
        
        waitUntil{sleep 5;AA_AMFISSA_IS_CLEAR};
        TASK_CLEAR_AA_AMFISSA setTaskState "Succeeded";
        ["TaskSucceeded", ["","Neutralize AA Amfissa"]] call BIS_fnc_showNotification;
    };     

};


waitUntil{sleep 5;CRASH_SITE_IS_CLEAR};

waitUntil{sleep 5;AA_MAGOS_IS_CLEAR};

waitUntil{sleep 5;AA_AMFISSA_IS_CLEAR};


sleep 10;

player sideChat "Hey Kostas, you there?";

sleep 6;

kostas sideChat "Yes, I'm listening.";

sleep 5;

player sideChat "We are mission complete. Any chance of some R & R? It's been a long day, you know.";

sleep 9;

kostas sideChat "Good work! You have earned a few hours respite. Get back to the CP and rest up. I've got something special planned for later.";

sleep 12;



cutText ["","BLACK OUT",5,false];
5 fadeSound 0;
player allowDamage false;

_box = createVehicle ["Box_NATO_Ammo_F", getMarkerPos "MARKER_SHED_AGIOS",[],10,"NONE"]; 
_box setDir random 360;
_box addMagazineCargo ["DemoCharge_Remote_Mag",3];
_box addWeaponCargo ["arifle_TRG21_F",2];
_box addMagazineCargo ["30Rnd_556x45_Stanag_Tracer_Green",19];
_box addItemCargo ["muzzle_snds_M",4];
_box addItemCargo ["optic_ACO_grn",4];
_box addItemCargo ["acc_flashlight",2];

sleep 5;

_DateStamp = date;
setDate [_DateStamp select 0, _DateStamp select 1, _DateStamp select 2, 18, 45];

"FirePlace_burning_F" createVehicle (getMarkerPos "MARKER_FIRE_PLACE_CP_AGIOS");

{
    _x setPos getMarkerPos "MARKER_OP_AGIOS_KONSTANTINOS";
} forEach units group player;

null = [3] execVM "scripts\spawn-barn-lights-agios-konstantinos.sqf";

sleep 6;

5 fadeSound 1;
cutText ["Later that day...","BLACK IN",8,false];
player allowDamage true;



sleep 10;

kostas sideChat "Delta One, this is Kostas, come in please.";

sleep 5;

player sideChat "This is One. What's up, Kostas?";

sleep 4;

kostas sideChat "I hope you've enjoyed a couple of hours rest. Tonight, you're on a sabotage mission in preparation for the main assault on Kavala later.";

sleep 7;

player sideChat "Does it involve blowing stuff up?";

sleep 6;

kostas sideChat "You bet!";

sleep 4;

player sideChat "Allright then, what's the plan?";

sleep 4;

kostas sideChat "Tonight's objective is to blow up any vehicles present in the motor pool in the center of Kavala. Be advised that the objective is heavily guarded though.";
null = [] execVM "scripts\populate-motor-pool-kavala.sqf";
null = [] execVM "scripts\spawn-fireteams-kavala.sqf";
null = [] execVM "scripts\spawn-kavala-marids.sqf";
null = [] execVM "scripts\spawn-kavala-mortar-group.sqf";

sleep 11;

kostas sideChat "We know there are at least two APCs, many footmobiles, as well as static machine guns. I've updated your map with what little intel we got on them.";
null = [] execVM "scripts\spawn-kavala-static-defenses.sqf";
sleep 16;

kostas sideChat "I planned a diversion to deal with the APCs, but watch out for those machine guns, allright?";
sleep 10;

player sideChat "Amen to that, nobody likes close encounters of the .50 kind. So, what's the diversion?";
sleep 8;

kostas sideChat "We will first attack the power station just north of Kavala. It should be lightly guarded.";
null = [] execVM "scripts\spawn-fireteam-power-plant.sqf";
null = [] execVM "scripts\spawn-transformer-kavala.sqf";

sleep 10;

kostas sideChat "Once the power station is under our control, you blow up the transformer, causing a blackout in Kavala.";

sleep 10;

kostas sideChat "While you rig the transformer, I'll have a guy place IEDs on the access routes to the power station.";

sleep 8;

kostas sideChat "I'm hoping the blackout will lure the two APCs from Kavala.";

sleep 10;

kostas sideChat "With the APCs engaged, you are free to infiltrate Kavala, find the motor pool and rig whatever vehicles are present. There's a crate in the barn with the other stuff, just take whatever you need to cause as much mayhem as possible.";

sleep 20;

kostas sideChat "So, take over the power station, rig the transformer, then use the cover of darkness to infiltrate Kavala.";

sleep 10;

player sideChat "And blow up some more stuff. Works for me!";

sleep 8;

kostas sideChat "Good luck, soldier! You're gonna need it. Kostas out.";

sleep 10;

_nSeconds = (19.5-daytime)*3600;
if (_nSeconds>600) then {
    _nSeconds setFog [0.5,0.05,4];
    _nSeconds setRain 0;
    _nSeconds setOvercast 0.75;
};



if (SHOW_CHAPTER_TITLES) then {
    null = ["Nightstalker"] execVM "scripts\show-chapter-title.sqf";
};

