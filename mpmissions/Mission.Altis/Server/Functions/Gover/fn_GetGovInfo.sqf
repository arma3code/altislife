/*
	Filename: 	fn_GetGovInfo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

_queryResult = ["SELECT serverbank, servertax, credittax, mar_legal, slavery, server_poor FROM rules",2] call DB_fnc_asyncCall;
_queryResult;