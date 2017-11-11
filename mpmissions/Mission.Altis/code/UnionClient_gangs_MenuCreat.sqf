/*
	
	Filename: 	UnionClient_gangs_MenuCreat.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_action_gangInUse) exitWith {};
disableSerialization;
createDialog "UnionDialogMyGangCreate";
waitUntil {!isNull (findDisplay 2520)};
(CONTROL(2520,2523)) ctrlSetText format[localize "STR_Gang_PriceTxt",[LIFE_SETTINGS(getNumber,"life_gangPrice")] call UnionClient_system_numberText];