/*
	Filename: 	fn_GetPrices.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

_queryResult = ["SELECT resource, sellprice, buyprice, legal FROM economy",2,true] call DB_fnc_asyncCall;
_queryResult;