/*

	Filename: 	UnionClient_system_govBank.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _mode = [_this,0,"",[""]] call BIS_fnc_param;
private _val = parseNumber(ctrlText 3902);
closeDialog 0;
if(_val <= 0) exitwith {};
if(_val > 999999) exitWith {hint "Нельзя за раз снять или положить больше $999,999"};
if(!([str(_val)] call UnionClient_system_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

if (_mode == "") exitWith {hint "Операция не указана"};
if (life_action_inUse) exitWith {};

call UnionClient_actions_inUse;

switch (_mode) do {
	case "add": {
		if (BANK < _val) exitWith {hint "У вас нет такой суммы на счету, чтобы внести их в казну"; life_action_inUse = false;};
		["atm","take",_val] call UnionClient_system_myCash;
		[player,"add",_val] remoteExecCall ["TON_fnc_serverBank",RSERV];
	};
	
	case "take": {
		if (server_bank < _val) exitWith {hint "В казне нет такого количества валюты..."; life_action_inUse = false;};
		[player,"take",_val] remoteExecCall ["TON_fnc_serverBank",RSERV];
	};
};