/*

	Filename: 	UnionClient_system_myCash.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_type","",[""]],
	["_modifier","",[""]],
	["_amount",0,[0]],
	["_from","NoData",[""]],
	["_extInfo","",[""]]
];

if (call UnionClient_system_myCashCheck) exitWith {
	[steamid,0,"Money Hack Detect",format["Money Hack Detect! Amount: %1",_amount]] remoteExecCall ["TON_fnc_rcon",RSERV];
	["DUPE",[format["Money Hack Detect! Amount: %1 || %2 (%3)",_amount,GVAR_RNAME(player),steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV];
	false
};

switch (_type) do {
	case "cash": {
		switch (_modifier) do {
			case "add": {ADD(CASH,_amount)};
			case "take": {
				SUB(CASH,_amount);
				if (CASH < 0) then {CASH = 0};
			};
			case "swap": {
				SUB(CASH,_amount);
				if (CASH < 0) then {CASH = 0};
				ADD(BANK,_amount);
				BANK = round BANK;
			};
			case "set": {CASH = _amount};
			case "drop": {CASH = 0};
		};

		CASH = round CASH;
	};
	case "atm": {
		switch (_modifier) do {
			case "add": {ADD(BANK,_amount)};
			case "take": {
				SUB(BANK,_amount);
				if (BANK < 0) then {BANK = 0};
			};
			case "swap": {
				SUB(BANK,_amount);
				if (BANK < 0) then {BANK = 0};
				ADD(CASH,_amount);
				CASH = round CASH;
			};
			case "set": {BANK = _amount};
			case "drop": {BANK = 0};
		};

		BANK = round BANK;
	};
	case "dcash": {
		switch (_modifier) do {
			case "add": {ADD(DCASH,_amount)};
			case "take": {
				SUB(DCASH,_amount);
				if (DCASH < 0) then {DCASH = 0};
			};
			case "set": {DCASH = _amount};
			case "drop": {DCASH = 0};
		};

		DCASH = round DCASH;

	};
};

life_moneyCache = (CASH / 2) + life_cashX;
life_dmoneyCache = (DCASH / 2) + life_dcashX;
life_atmmoneyCache = (BANK / 2) + life_atmX;

if !(EQUAL(_modifier,"set")) then {
	private _rnd = round(random(9999));
	switch (true) do {
		case (EQUAL(_from,"MS")) : {
			private _message = format["%1 -> $%2 [#%3]",_extInfo,[_amount] call UnionClient_system_numberText,_rnd];
			//[[CASH, DCASH, BANK, _message, GVAR_RNAME(player), steamid, "MoneySend"],"moneyUpdateLog"] call UnionClient_system_hcExec;
			["MONEYUPDATELOG",[CASH, DCASH, BANK, _message, GVAR_RNAME(player), steamid, "MoneySend"]] remoteExecCall ["TON_fnc_customLog",RSERV];
		};
		case (EQUAL(_from,"VB")) : {
			private _message = format["%1 [#%2]",_extInfo,_rnd];
			//[[CASH, DCASH, BANK, _message, GVAR_RNAME(player), steamid, "Vehicle"],"moneyUpdateLog"] call UnionClient_system_hcExec;
			["MONEYUPDATELOG",[CASH, DCASH, BANK, _message, GVAR_RNAME(player), steamid, "Vehicle"]] remoteExecCall ["TON_fnc_customLog",RSERV];
		};
		default {
			if (_amount > 10000 OR (EQUAL(_modifier,"drop"))) then {
				private _message = format["Amount = %1 -> Type = %2 -> Modifier = %3 -> [%4][#%5]",[_amount] call UnionClient_system_numberText,_type,_modifier,_from,_rnd];
				//[[CASH, DCASH, BANK, _message, GVAR_RNAME(player), steamid, "Money"],"moneyUpdateLog"] call UnionClient_system_hcExec;
				["MONEYUPDATELOG",[CASH, DCASH, BANK, _message, GVAR_RNAME(player), steamid, "Money"]] remoteExecCall ["TON_fnc_customLog",RSERV];
			};
		};
	};
};
[6] call UnionClient_session_updatePartial;
[3] call UnionClient_session_updatePartial;
true