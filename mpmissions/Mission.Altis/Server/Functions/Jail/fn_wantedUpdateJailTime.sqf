#include "\UnionServer\script_macros.hpp"
private ["_unit","_bad","_id","_ret"];
_playeruid = [_this,0,"",[""]] call BIS_fnc_param;
_time = [_this,1,0,[0]] call BIS_fnc_param;
if (_playeruid == "") exitWith {};
_query = format ["UPDATE players SET jail_time='%1' WHERE playerid='%2'", _time,_playeruid];

[_query,1] call DB_fnc_asyncCall;