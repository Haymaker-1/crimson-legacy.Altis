
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
_vz = 0.5;
_dropInterval = 0.05;
_moveVelocity = [0,0,_vz];
_rotationVelocity = 4.0;
_weight = 0.1;
_volume = 100;
_rubbing = 0.1;
_angle = 0.0;
_onSurface = 0.5;
_bounceOnSurface = -1;


// render
_size = [25,50];
_smokeColor = [0.05, 0.05, 0.1];
_colorTable = [ _smokeColor + [0.85],
                _smokeColor + [0.75],
                _smokeColor + [0.55],
                _smokeColor + [0.55],
                _smokeColor + [0.45],
                _smokeColor + [0.25],
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

                                   
//_particleSource setDropInterval _dropInterval;

while {(time-_theTime)<60} do {

    drop _parameterArray;
    sleep (0.5 + random 2);

};


deleteVehicle _particleSource;
player globalChat "deleted particle source";