/*
	
	Filename: 	UnionClient_safe_Take.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if ((lbCurSel 3502) == -1) exitWith {hint localize "STR_Civ_SelectItem";};
private _ctrl = CONTROL_DATA(3502);
private _num = ctrlText 3505;
private _safeInfo = life_safeObj GVAR ["safe",0];

//Error checks
if !([_num] call UnionClient_system_isnumber) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if (_ctrl != "goldbar") exitWith {hint localize "STR_Cop_OnlyGold"};
if (_num > _safeInfo) exitWith {hint format[localize "STR_Civ_IsntEnoughGold",_num];};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call UnionClient_system_calWeightDiff;
if (EQUAL(_num,0)) exitWith {hint localize "STR_NOTF_InvFull"};


//Take it
if !([true,_ctrl,_num] call UnionClient_system_handleInv) exitWith {hint localize "STR_NOTF_CouldntAdd";};
life_safeObj SVAR ["safe",_safeInfo - _num,TRUE];
[life_safeObj] call UnionClient_safe_Inventory;