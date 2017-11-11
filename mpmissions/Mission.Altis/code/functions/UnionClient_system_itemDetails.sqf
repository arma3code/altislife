/*

	Filename: 	UnionClient_system_itemDetails.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	old format: [_entity,_displayName,_picture,_scope,_type,_itemInfo,_cfg,_magazines,_muzzles,_desc,_acc_p,_acc_o,_acc_m,_base,_slotclasses,_AGMItem,_acc_u]
	new format: [_item,_displayName,_picture,_desc,_category,_type,_weight,_magazines,_muzzles,_optics,_pointers,_bipods]

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {[]};

if !(isNil {GVAR_MNS format ["EIDC_%1",_item]}) exitWith {GVAR_MNS format ["EIDC_%1",_item]}; //проверяем кэщ

private _cfg = switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _item)) : {"CfgMagazines"};
	case (isClass (configFile >> "CfgWeapons" >> _item)) : {"CfgWeapons"};
	case (isClass (configFile >> "CfgVehicles" >> _item)) : {"CfgVehicles"};
	case (isClass (configFile >> "CfgGlasses" >> _item)) : {"CfgGlasses"};
	default {""};
};

if (EQUAL(_cfg,"")) exitWith {[]};
if !(_cfg isEqualType "") exitWith {[]};
if !(isClass (configFile >> _cfg >> _item)) exitWith {[]};

private _config = configFile >> _cfg >> _item;
private _displayName = getText (_config >> "displayName");
private _picture = getText (_config >> "picture");
private _desc = getText (_config >> "descriptionshort");

private _bis_ItemType = [_item] call BIS_fnc_itemType;
private _category = _bis_ItemType select 0;
private _type = _bis_ItemType select 1;

private _weight = switch (_category) do {
	case "Weapon" : {
		switch (_type) do {
			case "AssaultRifle"; 
			case "Shotgun"; 
			case "Rifle";
			case "SniperRifle" : {10};
			case "BombLauncher";
			case "Cannon";
			case "GrenadeLauncher";
			case "Launcher";
			case "Mortar";
			case "RocketLauncher" : {20};
			case "MachineGun";
			case "SubmachineGun" : {15};
			case "Handgun" : {5};
			default {5}; 
		};
	};
	case "Equipment" : {
		switch (_type) do {
			case "Glasses": {1};
			case "Headgear": {2};
			case "Vest";
			case "Uniform": {3};
			case "Backpack": {4};
			default {1};
		};
	};
	case "Magazine": {1};
	case "Item": {1};
	default {1};
};

private ["_magazines","_muzzles","_optics","_pointers","_bipods","_underBarrels"];
if (EQUAL(_cfg,"CfgWeapons")) then {
	_muzzles = [_item, "muzzle"] call BIS_fnc_compatibleItems;
	_optics = [_item, "optic"] call BIS_fnc_compatibleItems;
	_pointers = [_item, "pointer"] call BIS_fnc_compatibleItems;
	_bipods = [_item, "bipod"] call BIS_fnc_compatibleItems;

	_magazines = getArray (_config >> "magazines");
	private _muzzlesCfg = getArray (_config >> "muzzles");
	if !(EQUAL(_muzzlesCfg,[])) then {
		private _base = inheritsFrom _config;
		private _tmp = [];
		{
			if !(EQUAL(_x,"this")) then {
				_tmp = getArray (_base >> _x >> "magazines");
				{
					_magazines set[count _magazines, _x];
				} foreach (_tmp);
			};
		} foreach _muzzlesCfg;
	};
} else {
	_magazines = [];
	_muzzles = [];
	_optics = [];
	_pointers = [];
	_bipods = [];
};

private _return = [_item,_displayName,_picture,_desc,_category,_type,_weight,_magazines,_muzzles,_optics,_pointers,_bipods];

SVAR_MNS [format ["EIDC_%1",_item],_return]; //кэшируем

_return