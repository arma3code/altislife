/*

	Filename: 	UnionClient_system_getModelName.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _object = param [0,ObjNull,[ObjNull]];
private _array = (str(_object)) splitString ": .";

private _return = "";
{
	if (EQUAL(_x,"p3d")) exitWith {
		_return = _array select (_forEachIndex - 1);
	};
} forEach _array;

_return