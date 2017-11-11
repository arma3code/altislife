/*

	Filename: 	UnionClient_evh_init.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
player addEventHandler["Killed", {_this spawn UnionClient_evh_onPlayerKilled}];
player addEventHandler["HandleDamage",{_this call UnionClient_evh_damageHandle}];
player addEventHandler["Respawn", {_this call UnionClient_evh_onPlayerRespawn}];
player addEventHandler["Take",{_this call UnionClient_system_onTakeItem}];
player addEventHandler["Put",{_this call UnionClient_system_onPutItem}];
player addEventHandler["Fired",{_this call UnionClient_system_onFired}];
player addEventHandler["InventoryClosed", {_this call UnionClient_evh_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call UnionClient_evh_inventoryOpened}];
player addEventHandler["WeaponAssembled", {_this call UnionClient_system_WeaponAssembled}];

["cameraView", {_this call UnionClient_evh_cameraView}] call CBA_fnc_addPlayerEventHandler;
["vehicle", {_this call UnionClient_evh_vehicleChange}] call CBA_fnc_addPlayerEventHandler;