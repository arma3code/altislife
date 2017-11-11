/*

	Filename: 	UnionClient_system_jail.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
/*params [
	["_unit",ObjNull,[ObjNull]],
	["_bad",false,[false]],
	["_jail_time",15,[0]]
];*/

private _unit = param [0];
private _bad = param [1];
private _jail_time = param [2];

life_jail_time = _jail_time;
if (isNull _unit OR !(EQUAL(_unit,player)) OR life_is_arrested) exitWith {};

[[player,_bad],"JailSys"] call UnionClient_system_hcExec;