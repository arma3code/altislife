/*
	
	Filename: 	UnionClient_system_changeClothes.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _control = (_this select 0) select 0;
private _selection = (_this select 0) select 1;
if (isNull _control) exitWith {hint localize "STR_Shop_NoDisplay"};
if (EQUAL(_selection,-1)) exitWith {hint localize "STR_Shop_NoSelection";};
private _price = CONTROL(3100,3102);

if (life_cMenu_lock) exitWith {};
life_cMenu_lock = true;

private _data = _control lbData _selection;
private _priceData = _control lbValue _selection;

life_clothing_purchase set [life_clothing_filter,[_data,_priceData]];

switch (life_clothing_filter) do {
	case 0: {removeUniform ShopBoxVehicle; ShopBoxVehicle forceAddUniform _data};
	case 1: {removeHeadGear ShopBoxVehicle; ShopBoxVehicle addHeadgear _data};
	case 2: {removeGoggles ShopBoxVehicle; ShopBoxVehicle addGoggles _data};
	case 3: {removeVest ShopBoxVehicle; ShopBoxVehicle addVest _data};
	case 4: {removeBackpack ShopBoxVehicle; ShopBoxVehicle addBackpack _data};
};
life_cMenu_lock = false;

private _totalPrice = 0;
{
	if ((count _x) > 0) then {
		_totalPrice = _totalPrice + (_x select 1);
	};
} foreach life_clothing_purchase;

_price ctrlSetStructuredText parseText format ["<t size='1.5' valign='middle' align='right' color='%2'>" + (localize "STR_Shop_Total") + " <t color='#3f6b00'>$%1</t></t>",[_totalPrice] call UnionClient_system_numberText,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];