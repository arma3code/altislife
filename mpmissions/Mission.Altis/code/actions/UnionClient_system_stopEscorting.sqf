/*

	Filename: 	UnionClient_system_stopEscorting.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];

if (isNull _unit) exitWith {}; //Not valid
if (NOTATTACHED(_unit)) exitWith {};

detach _unit;