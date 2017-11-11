/*

	Filename: 	UnionClient_system_convertSide.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _side = param [0,sideUnknown,[civilian]];
if (EQUAL(_side,sideUnknown)) exitWith {"Error"};

private _ret = switch (_side) do {
	case west: {"cop"};
	case civilian: {"civ"};
	case east: {"med"};
	case independent: {"reb"};
	default {"Error"};
};

_ret;