/*

	Filename: 	UnionClient_system_addItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	Улучшаем скрипт добавления вещей с ПРОВЕРКОЙ на успех

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
	//оружие самое ценное, поэтому не допускаем пропадания и замены
	case "Weapon": {
		private _config = configFile >> "CfgWeapons" >> _item;
		if (!isClass _config OR {getNumber (_config >> "scope") < 1}) exitWith {_return};
		//можем ли добавить прямо в руки
		private _canAdd = switch (getNumber (_config >> "type")) do {
			case (1): {EQUAL(RIFLE,"")};
			case (2): {EQUAL(PISTOL,"")};
			case (4): {EQUAL(LAUNCHER,"")};
			default {false};
		};
		//добавляем, если нужнй слот свободен
		if (_canAdd) then {
			player addWeapon _item;
			if (_item in LIFE_SETTINGS(getArray,"life_gatherTools")) then {
				if (EQUAL((secondaryWeaponMagazine player),[])) then {
					player addSecondaryWeaponItem "Extremo_Magazine_Swing";
				};
			};
			_return = true;
		} else {
			//попытаемся добавить в инвентарь
			_return = [_item] call UnionClient_system_addItemToInventory;
		};
	};
	//со шмотками у нас попроще, главное сохранить содержимое
	case "Equipment": {
		switch (_type) do {
			case "Glasses": {
				if (EQUAL(PGOOGLES,"")) then {
					player addGoggles _item;
					_return = true;
				} else {
					[PGOOGLES] call UnionClient_system_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					removeGoggles player;
					player addGoggles _item;
					_return = true;
				};
			};
			case "Headgear": {
				if (EQUAL(PHEADGEAR,"")) then {
					player addHeadGear _item;
					_return = true;
				} else {
					[PHEADGEAR] call UnionClient_system_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					removeHeadGear player;
					player addHeadgear _item;
					_return = true;
				};
			};
			case "Vest": {
				if (EQUAL(PVEST,"")) then {
					player addVest _item;
					_return = true;
				} else {
					[PVEST] call UnionClient_system_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					private _items = PVEST_ITEMS;
					removeVest player;
					player addVest _item;
					{
						[_x,"vest"] call UnionClient_system_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			case "Uniform": {
				if (EQUAL(PUNIFORM,"")) then {
					player forceAddUniform _item;
					_return = true;
				} else {
					[PUNIFORM] call UnionClient_system_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					private _items = PUNIFORM_ITEMS;
					removeUniform player;
					player forceAddUniform _item;
					{
						[_x,"uniform"] call UnionClient_system_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			case "Backpack": {
				if (EQUAL(PBACKPACK,"")) then {
					player addBackpack _item;
					clearAllItemsFromBackpack player;
					_return = true;
				} else {
					private _items = PBACKPACK_ITEMS;
					removeBackpack player;
					player addBackpack _item;
					clearAllItemsFromBackpack player;
					{
						[_x,"backpack"] call UnionClient_system_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			default {};
		};
	};
	//обоймы. пока просто кидаем в инвентарь
	case "Magazine": {
		_return = [_item] call UnionClient_system_addItemToInventory;
	};
	//теперь со всяким хламом
	case "Item": {
		switch (true) do {
			//сошки, глушаки, прицелы
			case (_type in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				_return = [_item] call UnionClient_system_addItemToWeapon;
			};
			//карта, бинокль и т.д.
			case (_type in ["Compass","GPS","Map","Radio","Watch","NVGoggles","UAVTerminal","MineDetector","LaserDesignator","Binocular"]) : {
				if (_item in (assignedItems player)) then {
					_return = [_item] call UnionClient_system_addItemToInventory;
				} else {
					switch (true) do { 
						case (EQUAL(_type,"Binocular")) : {
							player addWeapon _item; _return = true;
						};
						default {
							_return = [_item] call UnionClient_system_addItemToInventory;
							player assignItem _item;
						}; 
					};
				};
			}; 
			default {_return = [_item] call UnionClient_system_addItemToInventory};
		};
	};
	default {};
};

_return