/*

	Filename: 	UnionClient_system_shopBoxWeaponRotate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_itemCategory","",[""]]
];

if (!isNull ShopBoxWeapHolder) then {deleteVehicle ShopBoxWeapHolder};
if (!isNull ShopBoxWeapTurnItem) then {deleteVehicle ShopBoxWeapTurnItem};

ShopBoxWeapTurnItem = "Land_Can_V3_F" createVehicleLocal getPosASL ShopBoxTable;
ShopBoxWeapTurnItem setPosATL getPosASL ShopBoxTable;
ShopBoxWeapTurnItem attachTo [ShopBoxTable, [0, 0, 0] ];
ShopBoxWeapTurnItem hideObject true;
detach ShopBoxWeapTurnItem;

ShopBoxWeapHolder = "WeaponHolderSimulated" createVehicleLocal getPosASL ShopBoxTable;
switcH (_itemCategory) do {
	case "Weapon": {
		ShopBoxWeapHolder addWeaponCargo [_item, 1];
	};
	case "Mine",
	case "Magazine": {
		ShopBoxWeapHolder addMagazineCargo [_item, 1];
	};
	default {
		ShopBoxWeapHolder addItemCargo [_item, 1];
	};
};
ShopBoxWeapHolder attachTo [ShopBoxWeapTurnItem, [0,-0.63,0.7]];
ShopBoxWeapHolder setVectorDirAndUp [[0,0,1],[0,-1,0]];

life_weaponShopItemRotate = _item;

private _dir = getDir ShopBoxWeapTurnItem;

waitUntil {
	_dir = _dir + (
		if (_dir > 360) then [{-360},{0.5}]
	);
	//ShopBoxWeapTurnItem setDir _dir;
	isNull ShopBoxWeapTurnItem OR isNull ShopBoxWeapHolder
};