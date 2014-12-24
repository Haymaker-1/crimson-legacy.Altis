
_emitter = _this select 0;
_soundId = _this select 1;
_addVolume = _this select 2;

_emitterObj = player;
_emitterPos = eyePos _emitterObj;

_relPath = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "sound")) select 0;
_subtitle = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "titles")) select 1;
_duration = getNumber (missionConfigFile >> "CfgSounds" >> _soundId >> "duration");


_acc = accTime;
_isInside = cameraView != "EXTERNAL";


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
if (isNil "_addVolume") then {
    _addVolume = [] call HAYMAKER_fnc_calcAddVolume;
};
_voiceVolume = _voiceVolume + _addVolume;


// player globalChat format ["volume = %1",_voiceVolume];


if (_emitter isKindOf "Man" AND alive _emitter) then {

    _emitter setRandomLip true;
    
    if ("ItemRadio" in assignedItems _emitter AND 
        "ItemRadio" in assignedItems player) then {

        playSound3D [MISSION_TOP_LEVEL_DIRECTORY + _relPath,
                     _emitterObj, 
                     _isInside, 
                     _emitterPos, 
                     _voiceVolume,
                     _voicePitch,
                     0];  
                     
        _emitter sideChat _subtitle;

        player createDiaryRecord ["varTranscript",["Transcript","<font color='#00FFFF'>" + (groupID group _emitter) + "</font>: " + _subtitle]];
    };
        
    sleep (_duration/_voicePitch);
    
    _emitter setRandomLip false;
    
};
sleep 1;
