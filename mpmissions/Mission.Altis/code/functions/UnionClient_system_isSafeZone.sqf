/*

	Filename: 	UnionClient_system_isSafeZone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};

private _return = false;

{
	if ((_unit distance getMarkerPos (_x select 0)) < _x select 1) exitWith {_return = true};
} forEach (LIFE_SETTINGSWORLD(getArray,worldName,"life_sz"));

_return;