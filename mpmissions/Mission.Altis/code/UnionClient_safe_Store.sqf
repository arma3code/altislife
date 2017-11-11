/*
	
	Filename: 	UnionClient_safe_Store.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _ctrl = CONTROL_DATA(3503);
private _num = ctrlText 3506;

//Error checks
if !([_num] call UnionClient_system_isnumber) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if (_ctrl != "goldbar") exitWith {hint localize "STR_Cop_OnlyGold"};
if (_num > life_inv_goldbar) exitWith {hint format[localize "STR_Cop_NotEnoughGold",_num];};

//Store it.
if !([false,_ctrl,_num] call UnionClient_system_handleInv) exitWith {hint localize "STR_Cop_CantRemove";};
private _safeInfo = life_safeObj GVAR ["safe",0];
life_safeObj SVAR ["safe",_safeInfo + _num,true];

[life_safeObj] call UnionClient_safe_Inventory;