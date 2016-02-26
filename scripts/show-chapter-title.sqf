

private "_chapterTitle";

_chapterTitle = _this select 0;

//hintSilent parseText format["<t size='1.5' color='#ffffff'>&quot;%1&quot;</t>", _chapterTitle];

null = [_chapterTitle] execVM "scripts\show-dynamic-text.sqf";
