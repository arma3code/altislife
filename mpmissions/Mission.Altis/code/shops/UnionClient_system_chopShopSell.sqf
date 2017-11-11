/*

	Filename: 	UnionClient_system_chopShopSell.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _control = CONTROL(39400,39402);
private _vehicle = _control lbData (lbCurSel _control);

closeDialog 0;

private _vehicle = call compile format["%1", _vehicle];
private _nearVehicles = nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck","Air"],25];
_vehicle = _nearVehicles select _vehicle;

if (isNull _vehicle) exitWith {hint "Не найдена техника"};

private _vehicleSide = _vehicle GVAR ["tf_side",sideUnknown];
if (_vehicleSide == east) exitWith {hint "Нельзя продавать технику МЧС"};

private _check = false;
{
	if (player distance _x < 1000 && side _x == west) exitWith {
		_check = true;
	};
} forEach playableUnits;
if(_check) exitWith {hint "Дружище, у тебя копы на хвосте! Избавься от них, иначе я не успею продать машину!";};

if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle)) exitWith {hint "У техники нет стоимости и серийного номера. Ее нельзя перебить или продать."};
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price");
if (_basePrice <= 0) exitWith {hint "У техники нет стоимости и серийного номера. Ее нельзя перебить или продать."};

private _price = round (_basePrice*0.3);

hint localize "STR_Shop_ChopShopSelling";
call UnionClient_actions_inUse;
[player,_vehicle,_price,GVAR_RNAME(player),steamid] remoteExecCall ["TON_fnc_chopShopSell",RSERV];