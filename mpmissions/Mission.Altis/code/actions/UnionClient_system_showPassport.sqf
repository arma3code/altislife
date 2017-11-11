/*
	
	Filename: 	UnionClient_system_showPassport.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_target","_info"];
_target = cursorObject;

if((isNull _target) OR !(_target isKindOf "Man") OR !(alive _target)) exitWith{};
_info = [] call UnionClient_system_getPassportText;

[_info,steamid] remoteExecCall ["UnionClient_system_lookPassport",_target];