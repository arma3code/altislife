/*
	
	Filename: 	UnionClient_system_clothingMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _shop = param [3,"",[""]];
if !(isClass(missionConfigFile >> "LifeCfgClothShops" >> _shop)) exitWith {};
if (server_restartSoon) exitWith {hint "Надвигается буря. Все магазины закрыты."};

private _shopSide = M_CONFIG(getText,"LifeCfgClothShops",_shop,"side");
private _flag = [playerSide] call UnionClient_system_convertSide;
if !(EQUAL(_flag,_shopSide)) exitWith {hint "Магазин недоступен для вашей фракции"};

private _conditions = M_CONFIG(getText,"LifeCfgClothShops",_shop,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgClothShops",_shop,"conditionsMessage")];
};

disableSerialization;
createDialog "UnionDialogClothingShop";
waitUntil {!isNull (findDisplay 3100)};

ctrlSetText [3103,M_CONFIG(getText,"LifeCfgClothShops",_shop,"displayName")];
ctrlSetText [601,format["Наличность: $%1       ",[CASH] call UnionClient_system_numberText]];

life_clothing_purchase = [[],[],[],[],[]];
life_clothing_store = _shop;

life_oldClothes = PUNIFORM;
life_olduniformItems = PUNIFORM_ITEMS;
life_oldBackpack = PBACKPACK;
life_oldBackpackItems = PBACKPACK_ITEMS;
life_oldVest = PVEST;
life_oldVestItems = PVEST_ITEMS;
life_oldGlasses = PGOOGLES;
life_oldHat = PHEADGEAR;

call UnionClient_system_shopBoxClothesCreate;

(findDisplay 3100) displayAddEventHandler ["MouseButtonDown","if ((_this select 1) == 1) then {life_rbm = true}"];
(findDisplay 3100) displayAddEventHandler ["MouseButtonUp","if ((_this select 1) == 1) then {life_rbm = false}"];
(findDisplay 3100) displayAddEventHandler ["MouseMoving", "_this call UnionClient_system_shopBoxCameraRotate"];
(findDisplay 3100) displayAddEventHandler ["MouseZChanged", "_this call UnionClient_system_shopBoxCameraZoom"];

life_cMenu_lock = false;

private _filter = CONTROL(3100,3105);
lbClear _filter;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

[] spawn {
	while {true} do {
		if (isNull (findDisplay 3100)) exitWith {
			call UnionClient_system_shopBoxDestroy;
		};
		uiSleep 0.1;
	};
};