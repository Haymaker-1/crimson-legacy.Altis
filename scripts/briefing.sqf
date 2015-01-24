
waitUntil {
    sleep 1;
    if (!isNull player) exitWith {true};
    false
};
player createDiaryRecord ["diary", ["Situation", "Enemy base is on gridssaws  "]];
