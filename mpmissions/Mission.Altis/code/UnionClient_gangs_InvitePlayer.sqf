/*

	Filename: 	UnionClient_gangs_InvitePlayer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;

if (EQUAL((lbCurSel 2632),-1)) exitWith {hint localize "STR_GNOTF_SelectPerson"};
private _unit = call compile format["%1",CONTROL_DATA(2632)];
if (isNull _unit) exitWith {}; //Bad unit?
if (EQUAL(_unit,player)) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if !(EQUAL((side _unit),playerside)) exitWith {hint "Приглашенный игрок должен быть одной фракции с вами"};
if (!isNil {(group _unit) GVAR "gang_name"}) exitWith {hint "Этот человек уже в группировке"}; //Added

if ((grpPlayer GVAR ["gang_membersCount",0]) >= (grpPlayer GVAR ["gang_maxMembers",5])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",GVAR_RNAME(_unit)],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[GVAR_RNAME(player),grpPlayer,player] remoteExec ["UnionClient_gangs_Invite",_unit];
	hint format[localize "STR_GNOTF_InviteSent",GVAR_RNAME(_unit)];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};