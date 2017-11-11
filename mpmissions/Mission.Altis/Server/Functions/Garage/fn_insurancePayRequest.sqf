/*
	Filename: 	fn_insurancePayRequest.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

#include "\UnionServer\script_macros.hpp"
private ["_vid","_pid","_unit","_price","_vehicle","_type"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
_vehicle = [_this,4,"",[""]] call BIS_fnc_param;

if (_vehicle isEqualTo "" ||  isNull _unit || _pid isEqualTo "" || _vid isEqualTo -1) exitWith {
	life_action_inUse = false;
	(owner _unit) publicVariableClient "life_action_inUse";
	["Error. Что то пошло не так","error"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
};

_query = format ["UPDATE vehicles SET alive='0', insure='0' WHERE pid='%1' AND id='%2' AND type='%3'",_pid,_vid,_type];
[_query,1] call DB_fnc_asyncCall;

_query = format ["SELECT baseprice FROM vehicles WHERE pid='%1' AND id='%2' AND type='%3'",_pid,_vid,_type];
private _price = [_query,2,true] call DB_fnc_asyncCall;

_price = _price select 0 select 0;
if (_price isEqualTo 0) exitWith {
	life_action_inUse = false;
	(owner _unit) publicVariableClient "life_action_inUse";
	["У техники не указана цена, обратитесь к администрации за компенсацией","warning"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
};

[_vehicle,_price] remoteExecCall ["UnionClient_system_insurancePayDone",(owner _unit)];