/*
	
	Filename: 	UnionClient_system_showPassportTo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_info","_ret"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _ret) exitWith {};

_info = [] call UnionClient_system_getPassportText;
[_info,steamid] remoteExecCall ["UnionClient_system_lookPassport",_ret];