/*

	Filename: 	UnionClient_system_isUIDActive.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _uid = param [0,"",[""]];
if (EQUAL(_uid,"")) exitWith {false}; //Bad UID
private _ret = false;

{
	if (EQUAL(getPlayerUID _x,_uid)) exitWith {_ret = true};
} foreach playableUnits;

_ret;