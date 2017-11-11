/*
	
	Filename: 	UnionClient_system_savePassport.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 2977),-1)) exitWith {hint "Вы не выбрали паспорт"};
life_myPassportID = CONTROL_DATA(2977);
private _info = [] call UnionClient_system_getPassportText;
hintSilent parseText _info;