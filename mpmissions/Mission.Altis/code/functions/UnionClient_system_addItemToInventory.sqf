/*

	Filename: 	UnionClient_system_addItemToInventory.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	Добавляем предмет в инвентарь.
	Если не указано куда именно, то пробует сперва в рюкзак, потом в броник, а после в форму.
	Если указано куда и при этом там нет места - вызывает саму себя и пробует добавить хоть куда-то 
	Нахуя? На случай если вместительный рюкзак заменили на маленький и чтоб вещи не пропали (или хотя бы попытались сохраниться)

*/
#include "..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_to","",[""]]
];

if (EQUAL(_item,"")) exitWith {false};
private _return = false;

if (EQUAL(_to,"")) then {
	switch (true) do {
		case (player canAddItemToBackpack _item) : {
			player addItemToBackpack _item;
			_return = true;
		};
		case (player canAddItemToVest _item) : {
			player addItemToVest _item;
			_return = true;
		}; 
		case (player canAddItemToUniform _item) : {
			player addItemToUniform _item;
			_return = true;
		};
		default {
			private _weaponHolder = nearestObject [player, "WeaponHolder"];
        	if (isNull _weaponHolder OR {player distance _weaponHolder > 2}) then {
        	    _weaponHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "NONE"];
        	    _weaponHolder setPosASL getPosASL player;
        	};
        	_return = [_item,_weaponHolder] call UnionClient_system_addItemToBox;
        	if (_return) then {
        		systemChat "У вас в инвентаре нет свободного места, поэтому предмет был сброшен на землю! Не забудьте его подобрать!";
        	};
		};
	};
} else {
	switch (_to) do {
		case "backpack" : {
			if (player canAddItemToBackpack _item) then {
				player addItemToBackpack _item;
				_return = true;
			} else {
				_return = [_item] call UnionClient_system_addItemToInventory;
			};
		};
		case "vest" : {
			if (player canAddItemToVest _item) then {
				player addItemToVest _item;
				_return = true;
			} else {
				_return = [_item] call UnionClient_system_addItemToInventory;
			}
		};
		case "uniform" : {
			if (player canAddItemToUniform _item) then {
				player addItemToUniform _item;
				_return = true;
			} else {
				_return = [_item] call UnionClient_system_addItemToInventory;
			}
		};
	};
};

_return