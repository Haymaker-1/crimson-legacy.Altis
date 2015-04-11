
_titleText = _this select 0;


_iMonth = date select 1;

_monthStr = switch (_iMonth) do {
    case 1: {"January"};
    case 2: {"February"};
    case 3: {"March"};
    case 4: {"April"};
    case 5: {"May"};
    case 6: {"June"};
    case 7: {"July"};
    case 8: {"August"};
    case 9: {"September"};
    case 10: {"October"};
    case 11: {"November"};
    case 12: {"December"};
};

//_structuredText = parseText format 
//        [
//            ("<t align = 'right'>%2 %3, %1  %4:%5</t><br/>"+
//             "<t align='center' size='1.5'>&quot;%6&quot;</t><br/>"),
//            date select 0,  // year
//            _monthStr,      // month
//            date select 2,  // day
//            date select 3,  // hour
//            date select 4,  // minute
//            _titleText
//        ];

_structuredText = parseText format 
        [
            ("<t align='center' size='1.5' color='ffffff' shadow='0'>&quot;%1&quot;</t>"),
            _titleText
        ];

_width = 0.5;
_height = 0.1;
        
        
_useMissionTextArea = false;
_showAt = null;
if (_useMissionTextArea) then {
    _showAt = true;
} 
else {
    _showAt = [
                0.75,//safeZoneX + safeZoneW * 0.50 - _height * 0.50,
                0.25,//safeZoneY + safeZoneH * 0.75 - _width  * 0.50,
                _width,
                _height
               ];
};

_nCols = 9;
_nRows = 7;

_showDuration = 7.0;
_fadeDuration = 0.4;
_transparency = 0.0;


null = [
        _structuredText, 
        _showAt, 
        [_nCols, _nRows],
        _showDuration,
        _fadeDuration,
        _transparency
       ] spawn BIS_fnc_textTiles;


