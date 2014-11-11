
_obj = _this select 0;

_theTime = time;

_thePos = getPos _obj;

_particleSource = "#particlesource" createVehicle _thePos;


// general
_spriteSize = 16;
_spriteRowIndex = 7;
_spritePlayNumberOfFrames = 1;
_doAnim = 1;
_shapeName = "A3\data_f\ParticleEffects\Universal\Universal.p3d";
_shape = [_shapeName, _spriteSize, _spriteRowIndex, _spritePlayNumberOfFrames, _doAnim];
_animationName = "";
_animationType = "BillBoard";
_timerPeriod = 1.0;
_lifeTime = 20;


// physical 
_position = [0,0,0];
_vz = 5.0;
_moveVelocity = [0,0,_vz];
_rotationVelocity = 4.0;
_weight = 0.64;
_volume = 1000;
_rubbing = 0.1;
_angle = 0.0;
_onSurface = 0.5;
_bounceOnSurface = -1;


// render
_size = [5,175,175,250];
_smokeColor = [0.05, 0.05, 0.1];
_colorTable = [ _smokeColor + [0.65],
                _smokeColor + [0.55],
                _smokeColor + [0.45],
                _smokeColor + [0.45],
                _smokeColor + [0.35],
                _smokeColor + [0.15],
                _smokeColor + [0.00] ];
                
_emissiveColor = [[0.0,0.0,0.0,0.0]];
_animationPhase = [0.1];


// randomization
_randomDirectionPeriod = 0.5;
_randomDirectionIntensity = 1.0;
_onTimer = "";
_beforeDestroy = "";
_object = _particleSource;

_parameterArray = [_shape,
                   _animationName,
                   _animationType,
                   _timerPeriod, 
                   _lifeTime,
                   _position,
                   _moveVelocity, 
                   _rotationVelocity,
                   _weight, 
                   _volume, 
                   _rubbing, 
                   _size, 
                   _colorTable, 
                   _animationPhase, 
                   _randomDirectionPeriod,
                   _randomDirectionIntensity,
                   _onTimer, 
                   _beforeDestroy, 
                   _object];


_particleSource setParticleParams _parameterArray;


while {SMOKE_ON} do {

    drop _parameterArray;
    sleep (0.25 + random 1);

};


deleteVehicle _particleSource;
player globalChat "deleted particle source";