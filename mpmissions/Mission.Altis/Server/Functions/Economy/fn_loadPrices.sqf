/*
	Filename: 	fn_loadprices.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

#include "\UnionServer\script_macros.hpp"

//                             0           1       2         3 
private _GetPrices = ["SELECT resource, sellprice, buyprice, legal FROM economy",2,true] call DB_fnc_asyncCall;
private _sell_array = [];
private _buy_array = [];
private _illegal_items = [];

{
    if (_x select 1 > 0) then {
		_sell_array pushBack [_x select 0, _x select 1];
	};

	if (_x select 2 > 0) then {
		_buy_array pushBack [_x select 0, _x select 2];
	};

	if (_x select 3 isEqualTo 1) then {
		private _rew = if (_x select 1 <= 0) then {2} else {round((_x select 1) / 1.3)};
		_illegal_items pushBack [_x select 0, _rew];
	};
} forEach _GetPrices;

missionNamespace setVariable ["sell_array",_sell_array,true];
missionNamespace setVariable ["buy_array",_buy_array,true];
missionNamespace setVariable ["life_illegal_items",_illegal_items,true];
