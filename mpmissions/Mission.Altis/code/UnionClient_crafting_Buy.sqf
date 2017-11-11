/*
	
	Filename: 	UnionClient_crafting_Buy.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 669),-1)) exitWith {};

private _recipe = CONTROL_DATA(669);
if (RECIPE_VALUE(_recipe)) exitWith {hint "У вас уже есть такой рецепт"};

private _vip = M_CONFIG(getNumber,"LifeCfgRecipes",_recipe,"vip");
if (FETCH_CONST(life_donator) < _vip) exitWith {hint format ["Данный рецепт доступен с %1 уровня донатора",_vip]};

private _price = M_CONFIG(getNumber,"LifeCfgRecipes",_recipe,"price");
if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};
if (CASH < _price) exitWith {hint "У вас недостаточно денег на руках"};

["cash","take",_price] call UnionClient_system_myCash;

SVAR_MNS [RECIPE_VARNAME(_recipe),true];
[10] call UnionClient_session_updatePartial;

hint format["Поздравляем! Вы научились создавать %1", localize (M_CONFIG(getText,"LifeCfgRecipes",_recipe,"displayName"))];

[nil,(GVAR_UINS["Craft_Shop_Filter",0])] call UnionClient_crafting_ShopFilter;