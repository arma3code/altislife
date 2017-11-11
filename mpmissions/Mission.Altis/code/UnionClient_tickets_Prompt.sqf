/*
	
	Filename: 	UnionClient_tickets_Prompt.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (!isNull (findDisplay 5300)) exitwith {}; //Already at the ticket menu, block for abuse?

private _owner = param [0,objNull,[objNull]];
if (isNull _owner) exitWith {};
private _val = param [1,-1,[0]];
if (EQUAL(_val,-1)) exitWith {};

createDialog "UnionDialogFreeTicketPay";
disableSerialization;
waitUntil {!isnull (findDisplay 5300)};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_owner = _owner;

(CONTROL(5300,5301)) ctrlSetStructuredText parseText format[localize "STR_Ticket_FormText",GVAR_RNAME(_owner),_val,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

[] spawn {
	disableSerialization;
	waitUntil {uiSleep 0.3; life_ticket_paid OR (isNull (findDisplay 5300))};
	if(isNull (findDisplay 5300) && !life_ticket_paid) then {
		[1,format[localize "STR_Ticket_Refuse",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",life_ticket_owner];
	};
};