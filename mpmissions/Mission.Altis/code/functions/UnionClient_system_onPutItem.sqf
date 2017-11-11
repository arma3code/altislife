/*
	
	Filename: 	UnionClient_system_onPutItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_container",ObjNull,[ObjNull]],
	["_item","",[""]]
];

if (isNull _unit OR isNull _container OR EQUAL(_item,"") OR ISPSIDE(independent) OR ISPSIDE(west)) exitWith {};

playSound "click";
[] call UnionClient_system_saveGear;