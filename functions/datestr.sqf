
private "_theDate";
private "_year";
private "_month";
private "_day";
private "_hour";
private "_minute";
private "_second";
private "_monthStr";
private "_hourStr";
private "_minuteStr";


_theDate = _this select 0;

if (isNil "_theDate") then {

    _theDate = date;

};


_year = _theDate select 0;
_month = _theDate select 1;
_day = _theDate select 2;
_hour = _theDate select 3;
_minute = _theDate select 4;
_second = _theDate select 5;

_monthStr = "";

switch (_month) do {
    case 1: { _monthStr = "January" };
    case 2: { _monthStr = "February" };
    case 3: { _monthStr = "March" };
    case 4: { _monthStr = "April" };
    case 5: { _monthStr = "May" };
    case 6: { _monthStr = "June" };
    case 7: { _monthStr = "July" };
    case 8: { _monthStr = "August" };
    case 9: { _monthStr = "September" };
    case 10: { _monthStr = "October" };
    case 11: { _monthStr = "November" };
    case 12: { _monthStr = "December" };
};


_hourStr = "";
if (_hour <= 9) then {
    _hourStr = "0" + (str _hour);
} else {
    _hourStr = str _hour;
};

_minuteStr = "";
if (_minute <= 9) then {
    _minuteStr = "0" + (str _minute);
} else {
    _minuteStr = str _minute;
};


_dateStr = _monthStr + " " + (str _day) + ", " + (str _year) + " // " + _hourStr + ":" + _minuteStr;

_dateStr
