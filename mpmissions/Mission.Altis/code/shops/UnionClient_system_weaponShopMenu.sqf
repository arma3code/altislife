/*

	Filename: 	UnionClient_system_weaponShopMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (server_restartSoon) exitWith {hint "Надвигается буря. Все магазины закрыты."};
if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >> _this select 3)) exitWith {};

private _exit = false;
private _shopSide = M_CONFIG(getText,"LifeCfgWeaponShops",_this select 3,"side");
if !(EQUAL(_shopSide,"")) then {
	private _side = [playerSide] call UnionClient_system_convertSide;
	if !(EQUAL(_shopSide,_side)) then {
		_exit = true;
	};
};

if (_exit) exitWith {hint "Магазин недоступен для вашей фракции"};

private _conditions = M_CONFIG(getText,"LifeCfgWeaponShops",_this select 3,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {hint M_CONFIG(getText,"LifeCfgWeaponShops",_this select 3,"conditionMessage")};

SVAR_UINS ["Weapon_Shop",_this select 3];

disableSerialization;
if !(createDialog "UnionDialogWeaponShop") exitwith {};
ctrlSetText[601,format["Наличность: $%1       ",[CASH] call UnionClient_system_numberText]];
ctrlSetText[38401,M_CONFIG(getText,"LifeCfgWeaponShops",_this select 3,"displayName")];

private _filters = CONTROL(38400,38402);

lbClear _filters;
_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";
_filters lbSetCurSel 0;

call UnionClient_system_shopBoxWeaponCreate;

[] spawn {
	while {true} do {
		if (isNull (findDisplay 38400)) exitWith {
			[] call UnionClient_system_saveGear;
			call UnionClient_system_shopBoxDestroy;
		};
		uiSleep 0.3;
	};
};