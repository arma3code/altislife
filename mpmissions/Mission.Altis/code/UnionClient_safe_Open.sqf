/*
	
	Filename: 	UnionClient_safe_Open.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,ObjNull,[ObjNull]];
if (isNull life_safeObj) exitWith {};
if !(ISPSIDE(independent)) exitWith {};
if ((life_safeObj GVAR ["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if (life_safeObj GVAR ["inUse",false]) exitWith {hint localize "STR_Civ_VaultInUse"};
private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
if (west countSide playableUnits < _minCops) exitWith {hint format[localize "STR_Civ_NotEnoughCops",_minCops]};
if !(createDialog "UnionDialogFederalSafe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call UnionClient_safe_Inventory;
life_safeObj SVAR ["inUse",true,true];
life_safeObj spawn {
	waitUntil {isNull (findDisplay 3500)};	
	[_this,"inUse"] call UnionClient_system_clearGlobalVar;
};