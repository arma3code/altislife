/*
	
	Filename: 	UnionClient_tickets_Pay.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isnil "life_ticket_val" OR isNil "life_ticket_owner") exitWith {};
if (CASH < life_ticket_val) exitWith {
	if(BANK < life_ticket_val) exitWith {
		hint localize "STR_Ticket_DontHaveMoney";		
		[1,format[localize "STR_Ticket_DontHaveMoneySend",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_owner];
		closeDialog 0;
	};
	hint format[localize "STR_Ticket_Done",[life_ticket_val] call UnionClient_system_numberText];
	["atm","take",life_ticket_val] call UnionClient_system_myCash;
	life_ticket_paid = true;	
	[1,format[localize "STR_Ticket_DoneSend",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_owner];
	["atm","add",life_ticket_val] remoteExecCall ["UnionClient_system_myCash",life_ticket_owner];
	closeDialog 0;
};

hint format[localize "STR_Ticket_Done",[life_ticket_val] call UnionClient_system_numberText];

["cash","take",life_ticket_val] call UnionClient_system_myCash;
life_ticket_paid = true;

[1,format[localize "STR_Ticket_DoneSend",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_owner];
["atm","add",life_ticket_val] remoteExecCall ["UnionClient_system_myCash",life_ticket_owner];

closeDialog 0;