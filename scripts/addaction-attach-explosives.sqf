
private "_title";
private "_script";
private "_arguments";
private "_priority";
private "_showWindow";
private "_hideOnUse";
private "_shortcut";
private "_condition";



_title = "Attach explosives";
_script = "scripts\bomb-placement.sqf";
_arguments = nil;
_priority = 1.5;
_showWindow = true;
_hideOnUse = true;
_shortcut = "";
_condition = "true"; // FIXME add calling unit has explosives condition

ACTION_ATTACH_EXPLOSIVES = player addAction [_title,_script,_arguments,
                                             _priority,_showWindow,_hideOnUse,
                                             _shortcut,_condition];
