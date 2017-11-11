/*
	
	Filename: 	UnionClient_system_ticketGive.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call UnionClient_system_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 500000) exitWith {hint localize "STR_Cop_TicketOver100"};
[0,"STR_Cop_TicketGive",true,[GVAR_RNAME(player),[(parseNumber _val)] call UnionClient_system_numberText,GVAR_RNAME(life_ticket_unit)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["UnionClient_system_ticketPrompt",life_ticket_unit];
closeDialog 0;