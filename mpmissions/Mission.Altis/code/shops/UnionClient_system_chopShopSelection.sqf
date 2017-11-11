/*

	Filename: 	UnionClient_system_chopShopSelection.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
private _selection = [_this,1,-1,[0]] call BIS_fnc_param;

//Error checks
if(isNull _control OR _selection == -1) exitWith {};

private _vehicle = _control lbData _selection;
_vehicle = call compile format["%1", _vehicle];
private _nearVehicles = nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck","Air"],25];
_vehicle = _nearVehicles select _vehicle;

private _BtnOwn = CONTROL(39400,39404);
private _BtnSell = CONTROL(39400,39405);

_BtnOwn ctrlEnable true;
_BtnSell ctrlEnable true;

if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle)) exitWith {
	hint "У техники нет стоимости и серийного номера. Ее нельзя перебить или продать."; 
	_BtnOwn ctrlEnable false;
	_BtnSell ctrlEnable false;
};
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price");
if (EQUAL(_basePrice,-1)) exitWith {
	hint "У техники нет стоимости и серийного номера. Ее нельзя перебить или продать."; 
	_BtnOwn ctrlEnable false;
	_BtnSell ctrlEnable false;
};

private _price = round (_basePrice - (_basePrice*0.7)); //цена продажи
private _vehicleSide = _vehicle GVAR ["tf_side",sideUnknown];
private _price2 = if (_vehicleSide == west) then {round (_basePrice * 5)} else {round (_basePrice + (_basePrice*0.15))};

if (FETCH_CONST(life_donator) > 0) then {_price2 = [_price2] call UnionClient_system_discount;};

private _priceTag = CONTROL(39400,39401);
private _priceTagOwn = CONTROL(39400,39403);
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>" +(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%1</t></t>",[(_price)] call UnionClient_system_numberText];	
_priceTagOwn ctrlSetStructuredText parseText format ["<t size='0.8'>Перебивка: <t color='#c20c15'>$%1</t></t>", [_price2] call UnionClient_system_numberText];