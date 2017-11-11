/*

	Filename: 	UnionClient_system_loadGear.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
[] call UnionClient_system_stripDownPlayer;

if (EQUAL(life_gear,[])) exitWith {
    switch (playerSide) do {
        case west: {[] call UnionClient_loadout_cop};
        case civilian: {[] call UnionClient_loadout_civ};
        case east: {[] call UnionClient_loadout_medic};
		case independent: {[] call UnionClient_loadout_reb};
    };
};

//обратная совместимость со старым форматом хранения инвентаря. Если первый элемент в архиве СТРОКА, то загрузимся по старому формату. Дальше оно сохранится уже как массив.
if ((life_gear select 0) isEqualType "") exitWith {[] call UnionClient_system_loadGearOld};

private _iItems = life_gear select 0;
private _yItems = life_gear select 1;

systemChat "Загрузка инвентаря...";

[player,_iItems] call UnionClient_inventory_load;

life_maxWeight = 100;
{
	[true,_x select 0,_x select 1] call UnionClient_system_handleInv;
} foreach _yItems;
life_maxWeight = 24;

//удаляем ключи от тюрьмы
private _keys = ["extItem_prisonKey"] call UnionClient_system_itemCount;
if !(EQUAL(_keys,0)) then {
	for "_i" from 1 to _keys do {
		["extItem_prisonKey"] call UnionClient_system_removeItem;
	};
};

//если сохранилась униформа зека
if (EQUAL(PUNIFORM,"mgsr_robe")) then {
	[] call UnionClient_system_stripDownPlayer;
	switch (playerSide) do {
        case west: {[] call UnionClient_loadout_cop};
        case civilian: {[] call UnionClient_loadout_civ};
        case east: {[] call UnionClient_loadout_medic};
		case independent: {[] call UnionClient_loadout_reb};
    };
    systemChat "У вас сохранилась форма заключенного! Загружен стандартный набор.";
} else {
	systemChat "Загрузка инвентаря завершена";
};


[] call UnionClient_system_saveGear;