/*
	
	Filename: 	UnionClient_system_buyHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
if (_house GVAR["house_owned",false]) exitWith {hint "This house is already owned even though you shouldn't be seeing this hint..."};
if (!isNil {_house GVAR "house_sold"}) exitWith {hint localize "STR_House_Sell_Process"};

private _homeLic = switch(true) do {
	case (ISPSIDE(civilian) && {license_civ_home}): {true};
	case (ISPSIDE(independent) && {license_reb_home}): {true};
	default {false};
};

if !(_homeLic) exitWith {hint localize "STR_House_License"};

private _housesLimit = if (FETCH_CONST(life_donator) > 0) then {
	LIFE_SETTINGS(getNumber,"life_houseLimitDonat")
} else {
	LIFE_SETTINGS(getNumber,"life_houseLimit")
};

if (life_houses_count >= _housesLimit) exitWith {hint format[localize "STR_House_Max_House",_housesLimit]};

closeDialog 0;

if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {hint "Здание не продается"};
private _conditions = M_CONFIG2(getText,"LifeCfgHousing",worldName,typeOf _house,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {hint "Этот дом нельзя купить"};

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");

private _action = [
	format[localize "STR_House_BuyMSG",[_price] call UnionClient_system_numberText,_numberCrates],
	localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _price) exitWith {hint format [localize "STR_House_NotEnough"]};
	hint "Отправка запроса о покупке на сервер...";	
	[[_house,player],"checkHouse","TON",false] call UnionClient_system_hcExec;	
};