/*

	Filename: 	UnionClient_system_sellHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];

if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
if (isNil {_house GVAR "house_owner"}) exitWith {hint "There is no owner for this house."};
//if !(EQUAL(life_haveCredit,[])) exitWith {hint "Вы не можете продать недвижимость, так как у вас есть активный кредит."};

closeDialog 0;

if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {};
private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
_sellPrice = round(_price/3);

private _action = [
	format[localize "STR_House_SellHouseMSG",[_sellPrice] call UnionClient_system_numberText,_price],
	localize "STR_pInAct_SellHouse",
	localize "STR_Global_Sell",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	hint "Отправка запроса о продаже на сервер...";

	[[_house,_sellPrice,player,steamid],"sellHouse","TON",false] call UnionClient_system_hcExec;
};
