/*
	
	Filename: 	UnionClient_system_virt_menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _shop = param [3,"",[""]];
if !(isClass(missionConfigFile >> "LifeCfgVirtualItemsShops" >> _shop)) exitWith {};

life_shop_type = _shop;
life_shop_npc = param [0,objNull,[objNull]];

private _conditions = M_CONFIG(getText,"LifeCfgVirtualItemsShops",_shop,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {hint "У вас нет доступа к этому магазину или он закрыт"};

private _legal = M_CONFIG(getNumber,"LifeCfgVirtualItemsShops",_shop,"legal");
private _exit = "";
if (EQUAL(_legal,0)) then {
	private _waitForOpen = life_shop_npc GVAR ["waitForOpen",0];
	private _cop_min_illegal = [] call UnionClient_system_copsForIllegal;
	if ((west countSide playableUnits) < _cop_min_illegal) exitWith {_exit = format["Этот продавец доступен только при наличии %1 и более полицейских на острове!",_cop_min_illegal]};
	if (time - _waitForOpen < 1200) exitWith {_exit = format["Этот продавец еще не приехал на остров. Ожидается через %1 минут(ы)",round(((_waitForOpen + 1200) - time)/60)]};
};
if !(EQUAL(_exit,"")) exitWith {hint _exit};

createDialog "UnionDialogVirtualItemShop";
[] call UnionClient_system_virt_update;