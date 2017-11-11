/*

	Filename: 	UnionClient_system_removeItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {false};

private _itemInfo = [_item] call UnionClient_system_itemDetails;
private _category = _itemInfo select 4;
private _type = _itemInfo select 5;

if (EQUAL(_category,"")) exitWith {false};

private _return = false;
switch (_category) do {
	case "Weapon": {
		_return = [_item] call UnionClient_system_removeItemFromInventory;
		if !(_return) then {
			switch (true) do {
				case (EQUAL(RIFLE,_item)) : {
					{
						if !(EQUAL(_x,"")) then {
							[_x] call UnionClient_system_addItemToInventory;
							player removePrimaryWeaponItem _x;
						};
					} forEach RIFLE_ITEMS;
					player removeWeapon _item;
					_return = true;
				};
				case (EQUAL(PISTOL,_item)) : {
					{
						if !(EQUAL(_x,"")) then {
							[_x] call UnionClient_system_addItemToInventory;
							player removeHandgunItem _x;
						};
					} forEach PISTOL_ITEMS;
					player removeWeapon _item;
					_return = true;
				};
				case (EQUAL(LAUNCHER,_item)) : {
					{
						if !(EQUAL(_x,"")) then {
							[_x] call UnionClient_system_addItemToInventory;
							player removeSecondaryWeaponItem _x;
						};
					} forEach LAUNCHER_ITEMS;
					player removeWeapon _item;
					_return = true;
				};
			};
		};
	};
	case "Equipment": {
		switch (_type) do {			
			case "Glasses": {
				_return = [_item] call UnionClient_system_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PGOOGLES,_item)) then {
						removeGoggles player;
						_return = true;
					};
				};				
			};
			case "Headgear": {
				_return = [_item] call UnionClient_system_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PHEADGEAR,_item)) then {
						removeHeadgear player;
						_return = true;
					};
				};
			};
			case "Vest": {
				_return = [_item] call UnionClient_system_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PVEST,_item)) then {
						removeVest player;
						_return = true;
					};
				};
			};
			case "Uniform": {
				_return = [_item] call UnionClient_system_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PUNIFORM,_item)) then {
						removeUniform player;
						_return = true;
					};
				};
			};
			case "Backpack": {
				private _backpacsIn = (getBackpackCargo (backpackContainer player)) select 0;
				if (_item in _backpacsIn) then {
					//если рюкзак в рюкзаке
					_return = [backpackContainer player, _item] call CBA_fnc_removeBackpackCargo;				
				};				
				//если их там не было, то видимо рюкзак одет на игроке - удаляем			
				if !(_return) then {
					if (EQUAL(PBACKPACK,_item)) then {
						removeBackpack player;
						_return = true;
					};
				};
			};
		};
	};
	case "Magazine": {
		_return = [_item] call UnionClient_system_removeItemFromWeapon;
		if !(_return) then {
			_return = [_item] call UnionClient_system_removeItemFromInventory;
		};
	};
	case "Item": {
		switch (true) do {
			//сошки, глушаки, прицелы
			case (_type in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				_return = [_item] call UnionClient_system_removeItemFromWeapon;
				if !(_return) then {
					_return = [_item] call UnionClient_system_removeItemFromInventory;
				};
			};
			default {
				_return = [_item] call UnionClient_system_removeItemFromInventory;
			};
		};
	};
};

_return