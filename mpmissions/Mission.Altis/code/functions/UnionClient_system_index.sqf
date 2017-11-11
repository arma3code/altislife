/*

	Filename: 	UnionClient_system_index.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_item","_stack"];
private _return = -1;

{
	if (_item in _x) exitWith {
		_return = _forEachIndex;
	};
} foreach _stack;

_return;