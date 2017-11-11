/*

	Filename: 	UnionClient_system_itemCount.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	//пока что считаем чисто обоймы и предметы типа еда-вода, которые тоже обоймы, а потом расширем

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {0};

{EQUAL(_x,_item)} count magazines player