

_s = loadFile "data\sniper-positions.sqf";
_s = "SNIPER_POSITIONS=" + _s;

call compile _s;

_n = count SNIPER_POSITIONS;

_i = floor(random _n);

_data = SNIPER_POSITIONS select _i;
_pos = [_data select 0, _data select 1, _data select 2];

_group = createGroup east;

_sniperdir = _data select 3;
_dx = sin _sniperdir * 400;
_dy = cos _sniperdir * 400; 
_watchPos = [_pos select 0 + _dx,_pos select 1 + _dy,0];

"O_sniper_F" createUnit [_pos,_group,"negades_sniper = this;this removeWeapon 'srifle_GM6_LRPS_F'; this removeMagazines '5Rnd_127x108_Mag'; this removeMagazines '5Rnd_127x108_APDS_Mag';this addWeapon 'srifle_LRR_SOS_F'; this selectWeapon 'srifle_LRR_SOS_F'; this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this addMagazine '7Rnd_408_Mag';this setUnitPos 'DOWN';this setPos _pos; this setDir (_data select 3); this doWatch _watchPos; this removeWeapon 'NVGoggles_OPFOR'; this setSkill ['spotDistance',1];this setSkill ['spotTime',1];"];

null = [] execVM "scripts\monitor-if-srifle-seized.sqf";
















