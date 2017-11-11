/*

	Filename: 	UnionClient_system_loadGearOld.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _itemArray = life_gear;

_itemArray params [
	["_uniform","",[""]],
	["_vest","",[""]],
	["_backpack","",[""]],
	["_goggles","",[""]],
	["_headgear","",[""]],
	["_items",[],[[]]],
	["_prim",[],[[]]],
	["_seco",[],[[]]],
	["_launch",[],[[]]],
	["_uItems",[],[[]]],
	["_bItems",[],[[]]],
	["_vItems",[],[[]]],
	["_pItems",[],[[]]],
	["_hItems",[],[[]]],
	["_yItems",[],[[]]]
];

if (EQUAL(_uniform,"U_B_CombatUniform_mcam_tshirt") && ISPSIDE(west)) exitWith {
	systemchat "У вас сохранилась форма фракции. Будет загружена стандартная форма полиции.";
	[] call UnionClient_loadout_cop;
};

if (EQUAL(_uniform,"U_O_CombatUniform_ocamo") && ISPSIDE(east)) exitWith {
	systemchat "У вас сохранилась форма фракции. Будет загружена стандартная форма медиков.";
	[] call UnionClient_loadout_medic;
};

systemChat "Ваш инвентарь сохранен в старом формате. Не забудьте после входа сохраниться через планшет, чтобы в следующий раз загрузиться по новой схеме!";

if !(EQUAL(_uniform,"")) then {[_uniform] call UnionClient_system_addItem};
if !(EQUAL(_backpack,"")) then {[_backpack] call UnionClient_system_addItem};
if !(EQUAL(_vest,"")) then {[_vest] call UnionClient_system_addItem};
if !(EQUAL(_goggles,"")) then {[_goggles] call UnionClient_system_addItem};
if !(EQUAL(_headgear,"")) then {[_headgear] call UnionClient_system_addItem};

{[_x] call UnionClient_system_addItem} foreach _items;

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if !(EQUAL((_prim select 0),"")) then {
	[_prim select 0] call UnionClient_system_addItem;
	if (!(EQUAL((_prim select 1),""))) then {player addPrimaryWeaponItem (_prim select 1);};
};

if !(EQUAL((_seco select 0),"")) then {
	[_seco select 0] call UnionClient_system_addItem;
	if (!(EQUAL((_seco select 1),""))) then {player addHandgunItem (_seco select 1);};
};

if !(EQUAL((_launch select 0),"")) then {
	[_launch select 0] call UnionClient_system_addItem;
	if (!(EQUAL((_launch select 1),""))) then {player addSecondaryWeaponItem (_launch select 1);};
};

if !(EQUAL((_uItems select 0),[])) then {
	systemChat "Добавляем вещи в униформу...";
	_uItemsName = _uItems select 0;
	_uItemsCount = _uItems select 1;

	for "_x" from 0 to ((count _uItemsName) - 1) do {
		(uniformContainer player) addItemCargoGlobal [_uItemsName select _x,_uItemsCount select _x];
	};
};

if !(EQUAL((_bItems select 0),[])) then {
	systemChat "Добавляем вещи в рюкзак...";
	_bItemsName = _bItems select 0;
	_bItemsCount = _bItems select 1;

	for "_x" from 0 to ((count _bItemsName) - 1) do {
		(backpackContainer player) addItemCargoGlobal [_bItemsName select _x,_bItemsCount select _x];
	};
};

if !(EQUAL((_vItems select 0),[])) then {
	systemChat "Добавляем вещи в бронежилет...";
	_vItemsName = _vItems select 0;
	_vItemsCount = _vItems select 1;

	for "_x" from 0 to ((count _vItemsName) - 1) do {
		(vestContainer player) addItemCargoGlobal [_vItemsName select _x,_vItemsCount select _x];
	};
};

{
	if !(EQUAL(_x,"")) then {
		player addPrimaryWeaponItem _x;
	};
} foreach _pItems;

{
	if !(EQUAL(_x,"")) then {
		player addHandgunItem _x;
	};
} foreach _hItems;

life_maxWeight = 100;

{
	[true,_x select 0,_x select 1] call UnionClient_system_handleInv;
} foreach _yItems;

life_maxWeight = 24;

systemChat "Загрузка инвентаря завершена";