
SNIPER_DATA_NEGADES = [];    


_trg = createTrigger["EmptyDetector",getPos player];
_trg setTriggerArea[5,5,0,false];
_trg setTriggerActivation["ALPHA","PRESENT",true];
_trg setTriggerStatements["this", "_n = count SNIPER_DATA_NEGADES; 
SNIPER_DATA_NEGADES resize _n+1;
_arr = [getPosATL player select 0,
        getPosATL player select 1,
        getPosATL player select 2,
        round(getDir player)];
SNIPER_DATA_NEGADES set [_n,_arr];
copyToClipBoard (str(SNIPER_DATA_NEGADES));", ""]; 



