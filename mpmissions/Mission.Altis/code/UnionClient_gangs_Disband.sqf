/*

	Filename: 	UnionClient_gangs_Disband.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _gangID = grpPlayer GVAR ["gang_id",-1];
if (EQUAL(_gangID,life_westGangId) OR EQUAL(_gangID,life_eastGangId)) exitWith {};

private _action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";
	[grpPlayer,playerSide,steamid,GVAR_RNAME(player),GANG_NAME] remoteExec ["TON_fnc_removeGang",RSERV];
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};