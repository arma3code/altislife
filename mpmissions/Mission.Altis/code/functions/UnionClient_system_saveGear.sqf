/*

	Filename: 	UnionClient_system_saveGear.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL(PUNIFORM,"U_B_CombatUniform_mcam_tshirt") && ISPSIDE(west)) exitWith {};
if (EQUAL(PUNIFORM,"U_O_CombatUniform_ocamo") && ISPSIDE(east)) exitWith {};

private _type = param [0,"",[""]];
private _oldGear = +life_gear;
private _iItems = [player] call UnionClient_inventory_save;

private _yItems = [];
private ["_value","_item"];
{
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	if (_value > 0) then {
		_yItems pushBack [_item,_value];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

life_gear = [_iItems,_yItems];

private _loot = format ["%1_loot",steamid];
SVAR_MNS [_loot,life_gear];
PVAR_SERV(_loot);
//[20] call UnionClient_session_updatePartial