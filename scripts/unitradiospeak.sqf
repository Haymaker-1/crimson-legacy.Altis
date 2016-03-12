

private "_emitter";
private "_soundId";
private "_addVolume";
private "_emitterObj";
private "_emitterPos";
private "_relPath";
private "_subtitle";
private "_duration";
private "_choice";
private "_chatterFile";
private "_chatterFileDuration";
private "_acc";
private "_isInside";
private "_voicePitch";
private "_voiceVolume";
private "_decay";


_emitter = _this select 0;
_soundId = _this select 1;
_addVolume = _this select 2;

_emitterObj = player;
_emitterPos = eyePos _emitterObj;

_relPath = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "sound")) select 0;
_subtitle = (getArray (missionConfigFile >> "CfgSounds" >> _soundId >> "titles")) select 1;
_duration = getNumber (missionConfigFile >> "CfgSounds" >> _soundId >> "duration");

_choice = ["RadioAmbient2","RadioAmbient6","RadioAmbient8"] call BIS_fnc_selectRandom;
_chatterFile = (getArray (ConfigFile >> "CfgSounds" >> _choice >> "sound") select 0) + ".wss";
_chatterFileDuration = getNumber (ConfigFile >> "CfgSounds" >> _choice >> "duration");

_acc = accTime;
_isInside = false;

_voicePitch = 1.0*_acc;
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
};
_voiceVolume = _voiceVolume + _addVolume;

_decay = 0;

if (_emitter isKindOf "Man" AND alive _emitter) then {


    _emitter setRandomLip true;

    if ("ItemRadio" in assignedItems _emitter AND
        "ItemRadio" in assignedItems player) then {

        private "_cond1";
        private "_cond2";

        playSound3D [HAYMAKER_GLOBALS getVariable "MISSION_TOP_LEVEL_DIRECTORY" + _relPath,
                     _emitterObj,
                     _isInside,
                     _emitterPos,
                     _voiceVolume,
                     _voicePitch,
                     _decay];

        _cond1 = (_duration/_voicePitch) > 4.0;
        _cond2 = (random 1.0) < 0.5;

        if (_cond1 AND _cond2) then {

            null = [_chatterFile,_emitterObj,_isInside,_emitterPos,_voiceVolume,_voicePitch,_decay] spawn {

                _chatterFile = _this select 0;
                _emitterObj  = _this select 1;
                _isInside    = _this select 2;
                _emitterPos  = _this select 3;
                _voiceVolume = _this select 4;
                _voicePitch  = _this select 5;
                _decay       = _this select 6;

                sleep (random 2.0);

                playSound3D [_chatterFile,
                             _emitterObj,
                             _isInside,
                             _emitterPos,
                             _voiceVolume * 0.025,
                             _voicePitch,
                             _decay];
             };
        };

        _emitter sideChat _subtitle;

        player createDiaryRecord ["varTranscript",["Transcript","<font color='#00FFFF'>" + (groupID group _emitter) + "</font>: " + _subtitle]];
    };

    sleep (_duration / _voicePitch);

    _emitter setRandomLip false;

};
sleep 1;


