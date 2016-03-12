

private "_emitter";
private "_soundId";
private "_addVolume";
private "_emitterObj";
private "_emitterPos";
private "_relPath";
private "_subtitle";
private "_duration";
private "_audibleDistance";
private "_acc";
private "_isInside";
private "_voicePitch";
private "_voiceVolume";


_emitter = _this select 0;
_soundId = _this select 1;
_addVolume = _this select 2;

_emitterObj = _emitter;
_emitterPos = eyePos _emitter;

_relPath = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "sound")) select 0;
_subtitle = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "titles")) select 1;
_duration = getNumber (missionConfigFile >> "CfgSounds" >> _soundId >> "duration");

_audibleDistance = nil;
if (_emitter == player) then {
    // Setting sound decay parameter to 0 means there is no decay. This
    // way, the player can always hear himself equally well. Without this
    // tweak, you can have a strong decay on your own speech when traveling
    // at speed, for instance when flying in a helicopter.
    _audibleDistance = 0;
}
else {
    _audibleDistance = HAYMAKER_GLOBALS getVariable "SPEECH_AUDIBLE_DISTANCE";
    _emitter doWatch player;
};

_acc = accTime;
_isInside = false;

_voicePitch = 1.0 * _acc;
{
    if ((_x select 0) == _emitter) then {
        _voicePitch = (_x select 1)*_acc;
    };
} forEach HAYMAKER_GLOBALS getVariable "VOICE_PITCH";

_voiceVolume = 1.0;
{
    if ((_x select 0) == _emitter) then {
        _voiceVolume = _x select 1;
    };
} forEach HAYMAKER_GLOBALS getVariable "VOICE_VOLUME";

if (isNil "_addVolume") then {
    _addVolume = [] call HAYMAKER_fnc_calcAddVolume;
    if (_emitter == player) then {
        _addVolume = _addVolume * 0.1;
    };
};
_voiceVolume = _voiceVolume + _addVolume;

if (_emitter isKindOf "Man" AND alive _emitter) then {

    _emitter setRandomLip true;

    playSound3D [HAYMAKER_GLOBALS getVariable "MISSION_TOP_LEVEL_DIRECTORY" + _relPath,
                _emitterObj,
                _isInside,
                _emitterPos,
                _voiceVolume,
                _voicePitch,
                _audibleDistance];

    _emitter sideChat _subtitle;

    player createDiaryRecord ["varTranscript",["Transcript","<font color='#00FFFF'>" + (groupID group _emitter) + "</font>: " + _subtitle]];

    sleep (_duration/_voicePitch);

    _emitter setRandomLip false;
};

sleep 1;

_emitter doWatch objNull;
