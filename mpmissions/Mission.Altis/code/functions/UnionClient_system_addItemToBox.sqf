/*
	
	Filename: 	UnionClient_system_addItemToBox.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_box",objNull,[objNull]],
	["_global",true,[false]]
];

if (EQUAL(_item,"") OR isNull _box) exitWith {};

private _itemInformation = [_item] call UnionClient_system_itemDetails;
private _itemCategory = _itemInformation select 4;
private _itemType = _itemInformation select 5;

if (EQUAL(_itemCategory,"")) exitWith {false};

private _added = false;
switcH (_itemCategory) do {
	case "Weapon": {
		if (_global) then {_box addWeaponCargoGlobal [_item, 1]} else {_box addWeaponCargo [_item, 1]};
		_added = true;
	};
	case "Mine",
	case "Magazine": {			
			if (_global) then {_box addMagazineCargoGlobal [_item, 1]} else {_box addMagazineCargo [_item, 1]};
			_added = true;
	};
	default {
		if (EQUAL(_itemType,"Backpack")) then {
			if (_global) then {_box addBackpackCargoGlobal [_item, 1]} else {_box addBackpackCargo [_item, 1]};			
			_added = true;
		} else {			
			if (_global) then {_box addItemCargoGlobal [_item, 1]} else {_box addItemCargo [_item, 1]};
			_added = true;
		};
	};
};

_added