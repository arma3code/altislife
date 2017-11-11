#include "..\..\script_macros.hpp"
/*
    File: fn_wantedCheck.sqf
    Author: Merrick
    Description:
    Checks if there is a player in wanted database or not.
*/
private ["_pid","_unit","_query","_queryResult"];
_pid = param [0,"",[""]];
_unit = param [1,ObjNull,[ObjNull]];

_query = format ["SELECT wantedID FROM wanted WHERE active='1' AND wantedID = '%1'",_pid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if (_pid in (_queryResult select 0)) exitWith {
	["Вы находитесь в базе розыска. За подробностями обратитесь в ближайший полицейский участок","warning"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
};

if !(_queryResult isEqualTo "[]") exitWith {
	["Вы не находитесь в базе розыска.","done"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
};