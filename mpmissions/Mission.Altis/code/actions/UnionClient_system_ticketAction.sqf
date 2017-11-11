/*

	Filename: 	UnionClient_system_ticketAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
if !(createDialog "UnionDialogTicketGive") exitWith {hint localize "STR_Cop_TicketFail"};
if (isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[localize "STR_Cop_Ticket",GVAR_RNAME(_unit)]];
life_ticket_unit = _unit;