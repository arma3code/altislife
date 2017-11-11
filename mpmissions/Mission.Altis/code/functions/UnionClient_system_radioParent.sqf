/*

	Filename: 	UnionClient_system_radioParent.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {""};

if (EQUAL(getText (configFile >> "CfgWeapons" >> _item >> "simulation"),"ItemRadio")) then {
	if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
		_radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
		if ((_radio isEqualType "") && !(EQUAL(_radio,""))) then {_item = _radio};
	};
};

_item