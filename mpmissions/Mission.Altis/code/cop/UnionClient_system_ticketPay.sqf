/*
	
	Filename: 	UnionClient_system_ticketPay.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (isnil "life_ticket_val" OR isNil "life_ticket_cop") exitWith {};
if (CASH < life_ticket_val) exitWith {
	if(BANK < life_ticket_val) exitWith {
		hint localize "STR_Cop_Ticket_NotEnough";		
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call UnionClient_system_numberText];	
	["atm","take",life_ticket_val] call UnionClient_system_myCash;
	life_ticket_paid = true;	
	[0,"STR_Cop_Ticket_PaidNOTF",true,[GVAR_RNAME(player),[life_ticket_val] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",west];	
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_cop];	
	
	[[steamid],"wantedRemove"] call UnionClient_system_hcExec;

	["atm","add",life_ticket_val] remoteExecCall ["UnionClient_system_myCash",life_ticket_cop];
	closeDialog 0;
};

["cash","take",life_ticket_val] call UnionClient_system_myCash;
life_ticket_paid = true;

[0,"STR_Cop_Ticket_PaidNOTF",true,[GVAR_RNAME(player),[life_ticket_val] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",west];
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_cop];

[[steamid],"wantedRemove"] call UnionClient_system_hcExec;

["atm","add",life_ticket_val] remoteExecCall ["UnionClient_system_myCash",life_ticket_cop];

closeDialog 0;