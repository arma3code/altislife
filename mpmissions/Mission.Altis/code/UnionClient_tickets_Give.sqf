/*
	
	Filename: 	UnionClient_tickets_Give.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNil {life_ticket_unit}) exitWith {hint localize "STR_Global_Error"};
if (isNull life_ticket_unit) exitWith {hint localize "STR_Global_Error"};
private _val = ctrlText 5202;
if !([_val] call UnionClient_system_isnumber) exitWith {hint localize "STR_Cop_TicketNum"};
if ((parseNumber _val) > 500000) exitWith {hint format[localize "STR_Ticket_TooMuch",[500000] call UnionClient_system_numberText]};
[0,format[localize "STR_Ticket_ForLongText",GVAR_RNAME(player),[(parseNumber _val)] call UnionClient_system_numberText,GVAR_RNAME(life_ticket_unit)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["UnionClient_tickets_Prompt",life_ticket_unit];
closeDialog 0;