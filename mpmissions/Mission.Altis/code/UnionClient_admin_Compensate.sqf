/*

	Filename: 	UnionClient_admin_Compensate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_value"];
if(FETCH_CONST(life_adminlevel) == 0) exitWith {};
_value = 500000;

["cash","add",_value] call UnionClient_system_myCash;
["ADMINCASH",format["%1 (%2) compensated $500k",GVAR_RNAME(player),steamid]] remoteExecCall ["TON_fnc_customLog",RSERV];
hint format [localize "STR_ANOTF_Success",[_value] call UnionClient_system_numberText];