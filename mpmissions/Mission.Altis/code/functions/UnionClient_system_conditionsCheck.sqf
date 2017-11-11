/*

	Filename: 	UnionClient_system_conditionsCheck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _conditions = param [0,"",[""]];
if (EQUAL(_conditions,"")) exitWith {true};

_conditions = call compile _conditions;

if (_conditions isEqualType true) then {
    if (_conditions) then {true} else {false};
} else {true};