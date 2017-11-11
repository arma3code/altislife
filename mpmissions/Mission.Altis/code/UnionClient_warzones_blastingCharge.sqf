/*

	Filename: 	UnionClient_warzones_blastingCharge.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"]};

private _box = param [0,ObjNull,[ObjNull]];
if (isNull _box) exitWith {};
if !((typeOf _box) isEqualTo WZ_SETTINGS(getText,"boxClass")) exitWith {};
if (_box GVAR ["chargePlaced",false]) exitWith {titleText["Уже установлен заряд","PLAIN"]};
if !(["extItem_blastingcharge"] call UnionClient_system_removeItem) exitWith {titleText["В инвентаре нет необходимых предметов","PLAIN"]};

[_box,"chargePlaced",true] call CBA_fnc_setVarNet;
titleText["Устанавливаем заряд...","PLAIN"];