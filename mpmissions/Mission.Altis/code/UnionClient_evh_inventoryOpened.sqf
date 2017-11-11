/*

	Filename: 	UnionClient_evh_inventoryOpened.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params ["_unit","_container","_secondaryContainer"];
private _isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if (EQUAL(_isPack,1)) exitWith {
	hint localize "STR_MISC_Backpack";
	true;
};
if ([_container] call UnionClient_system_isVehicleKind && {!(_container in life_vehicles) && {EQUAL((locked _container),2)}} ) exitWith {
	hint localize "STR_MISC_VehInventory";
	"Container BLOCK" call UnionClient_system_log;
	true;
};

if ([_secondaryContainer] call UnionClient_system_isVehicleKind && {!(_secondaryContainer in life_vehicles) && {EQUAL((locked _secondaryContainer),2)}} ) exitWith {
	hint localize "STR_MISC_VehInventory";
	"SecondaryContainer BLOCK" call UnionClient_system_log;
	true;
};

if (life_action_inUse OR ([] call UnionClient_system_isInputBlocked)) exitWith {
	hint "Дождитесь окончания действия";
	true;
};

if ([_container] call UnionClient_system_isContainerInUse) exitWith {
	hint "Уже кем-то открыто";
	true;
};

playSound "zipper";
life_currentContainer = _container;
life_ContainerOpened = true;
[life_currentContainer,"openedByUnit",steamid] call CBA_fnc_setVarNet;

life_currentContainer spawn {
	sleep 0.5;
	while {!isNull _this} do {
		if (isNil {_this GVAR "openedByUnit"}) exitWith {closeDialog 0};
		if (_this GVAR ["openedByUnit",""] != steamid) exitWith {["DUPE",[format["Inventory dupe possible OpenedByUnit - %1 But STEAMID - %2",_this GVAR ["openedByUnit",""],steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV]; closeDialog 0};
		uiSleep 0.03;
	};
};

false;