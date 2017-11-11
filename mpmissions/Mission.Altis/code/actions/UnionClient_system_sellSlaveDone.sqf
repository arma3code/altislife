/*

	Filename: 	UnionClient_system_sellSlaveDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_slave",objNull,[objNull]],
	["_rate",0,[0]]
];

if (isNull _slave) exitWith {life_action_inUse = false};

["cash","add",_rate] call UnionClient_system_myCash;
hint format [localize "STR_NOTF_SellSlaveDone",[_rate] call UnionClient_system_numberText,GVAR_RNAME(_slave)];
["SLAVERY",[format["%1 (%2) Sold %3 (%4) in slavery",GVAR_RNAME(player),steamid,GVAR_RNAME(_slave),getPlayerUID _slave]]] remoteExecCall ["TON_fnc_customLog",RSERV];

life_action_inUse = false;