/*

	Filename: 	UnionClient_system_makeHimUnBlind.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};
if !(_unit GVAR ["isBlind",false]) exitWith {};

[_unit,"isBlind"] call UnionClient_system_clearGlobalVar;
player say3D "blind";