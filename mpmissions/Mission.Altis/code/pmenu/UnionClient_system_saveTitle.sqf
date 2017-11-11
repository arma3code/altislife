/*
	
	Filename: 	UnionClient_system_saveTitle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 2978),-1)) exitWith {hint "Вы не выбрали приписку"};
life_myTitleID = CONTROL_DATA(2978);
[] call UnionClient_system_setTitle;
private _info = [] call UnionClient_system_getPassportText;
hintSilent parseText _info;