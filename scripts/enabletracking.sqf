
private "_nGpsPositions";
private "_gpsTrack";
private "_iGps";
private "_gpsMarkerIndex";
private "_gpsMarkerIndexPrev";
private "_playerHasGPS";
private "_maxTimeSinceLastGpsFix";
private "_maxDistSinceLastGpsFix";
private "_minDistSinceLastGpsFix";


_maxTimeSinceLastGpsFix = 15;
_maxDistSinceLastGpsFix = 50;
_minDistSinceLastGpsFix = 5;


_nGpsPositions = 5000;
_gpsTrack = [];
_gpsTrack resize _nGpsPositions;
_iGps = 0;
{
    private "_markerName";
    private "_marker";
    _markerName = format ["PLAYER_GPS_LOCATION_%1", _iGps];
    _marker = createMarker [_markerName, [0, 0]];
    _markerName setMarkerType "Empty";
    _iGps = _iGps + 1;
} forEach _gpsTrack;

_gpsMarkerIndex = 0;
_gpsMarkerIndexPrev = _gpsMarkerIndex;

_gpsTrack set [_gpsMarkerIndex, getPos player];
_timeOfLastGpsFix = time;
_gpsMarkerIndex = (_gpsMarkerIndex + 1) % _nGpsPositions;


_playerHasGPS = true;
while {alive player && _playerHasGPS} do {

    private "_currentPos";
    private "_currentTime";
    private "_timeSinceLastGpsFix";
    private "_distSinceLastGpsFix";
    private "_condTimeMax";
    private "_condDistMin";
    private "_condDistMax";

    _currentPos = getPos player;
    _currentTime = time;
    _playerHasGPS = "ItemGPS" in assignedItems player;
    _timeSinceLastGpsFix = _currentTime - _timeOfLastGpsFix;
    _distSinceLastGpsFix = (_gpsTrack select (_gpsMarkerIndex - 1 + _nGpsPositions) % _nGpsPositions) distance _currentPos;

    _condTimeMax = _timeSinceLastGpsFix > _maxTimeSinceLastGpsFix;
    _condDistMin = _distSinceLastGpsFix > _minDistSinceLastGpsFix;
    _condDistMax = _distSinceLastGpsFix > _maxDistSinceLastGpsFix;

    if (_playerHasGPS AND _condDistMin AND (_condTimeMax OR _condDistMax)) then {
        private "_markerName";
        _gpsTrack set [_gpsMarkerIndex, _currentPos];
        _markerName = format ["PLAYER_GPS_LOCATION_%1", _gpsMarkerIndex];
        _markerName setMarkerColor "ColorYellow";
        _markerName setMarkerType "mil_triangle";
        _markerName setMarkerPos (_gpsTrack select _gpsMarkerIndex);
        _markerName setMarkerSize [0.25, 0.25];
        _markerName setMarkerDir ([_gpsTrack select _gpsMarkerIndexPrev, _gpsTrack select _gpsMarkerIndex] call HAYMAKER_fnc_calcDirection);
        _gpsMarkerIndexPrev = _gpsMarkerIndex;
        _gpsMarkerIndex = (_gpsMarkerIndex + 1) % _nGpsPositions;
        _timeOfLastGpsFix = _currentTime;
    };
    sleep 1;
};


