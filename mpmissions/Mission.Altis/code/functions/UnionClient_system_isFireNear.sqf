/*

	Filename: 	UnionClient_system_isFireNear.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_position",[],[[]]],
	["_radius",-1,[0]]
];

if (EQUAL(_position,[]) OR (EQUAL(_radius,-1))) exitWith {false};
private _objectsNearby = _position nearObjects _radius;
private _result = {inflamed _x} count _objectsNearby > 0;

_result;