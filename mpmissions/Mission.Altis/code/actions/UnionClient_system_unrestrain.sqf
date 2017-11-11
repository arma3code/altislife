/*
	
	Filename: 	UnionClient_system_unrestrain.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR !(GVAR_RESTRAINED(_unit))) exitWith {};

[_unit,"restrained"] call UnionClient_system_clearGlobalVar;
[_unit,"isBlind"] call UnionClient_system_clearGlobalVar;

detach _unit;
titleText[format ["Вы освободили руки %1",GVAR_RNAME(_unit)],"PLAIN"];