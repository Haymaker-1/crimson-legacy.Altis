
_emitter = _this select 0;
_soundId = _this select 1;
_amplifier = _this select 2;

_emitterObj = _emitter;
_emitterPos = getPosASL _emitter;

_relPath = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "sound")) select 0;
_subtitle = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "titles")) select 1;
_duration = getNumber (missionConfigFile >> "CfgSounds" >> _soundId >> "duration");

if (isNil "_amplifier") then {

    _amplifier = VOICE_AMPLIFIER_DEFAULT; //default value
    
    _veh = assignedVehicle player;
    if (!isNull (_veh)) then {
        if (player in crew _veh) then {
            if (isEngineOn _veh) then {
                if (_veh isKindOf "Helicopter") then {
                    _amplifier = 30.0;
                };
                if (_veh isKindOf "Car") then {
                    _amplifier = 20.0;
                };
            };
        };
    };
};

_acc = accTime;

_isInside = false;

_voicePitch = 1.0*_acc;
{
    if ((_x select 0) == _emitter) then {
        _voicePitch = (_x select 1)*_acc;
    };
} forEach VOICE_PITCH;

_voiceVolume = 1.0;
{
    if ((_x select 0) == _emitter) then {
        _voiceVolume = _x select 1;
    };
} forEach VOICE_VOLUME;
_voiceVolume = _voiceVolume * _amplifier;



if (_emitter isKindOf "Man" AND alive _emitter) then {
    _emitter setRandomLip true;

    playSound3D [MISSION_TOP_LEVEL_DIRECTORY + _relPath,
                 _emitterObj, 
                 _isInside, 
                 _emitterPos, 
                 _voiceVolume,
                 _voicePitch,
                 SPEECH_AUDIBLE_DISTANCE];  
                 
    _emitter sideChat _subtitle;


    sleep (_duration/_voicePitch);
    _emitter setRandomLip false;
};
sleep 1;
