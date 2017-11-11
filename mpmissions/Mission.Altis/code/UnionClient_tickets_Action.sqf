/*

	Filename: 	UnionClient_tickets_Action.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitwith {};
if (!isPlayer _unit) exitwith {};
disableSerialization;
if !(createDialog "UnionDialogFreeTicketGive") exitWith {hint "Ошибка"};
ctrlSetText [5201,format[localize "STR_Ticket_For",GVAR_RNAME(_unit)]];
life_ticket_unit = _unit;