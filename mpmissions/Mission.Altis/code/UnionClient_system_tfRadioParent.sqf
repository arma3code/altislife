/*

	Filename: 	UnionClient_system_tfRadioParent.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {""};

private _return = _item;

if (getText (configFile >> "CfgWeapons" >> _item >> "simulation") isEqualTo "ItemRadio") then {
	if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
		private _radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
		if !(EQUAL(_radio,"")) then {_return = _radio};
	};
};

_return