/*
	
	Filename: 	UnionClient_admin_getID.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _unit = CONTROL_DATA(2902);
_unit = call compile format["%1", _unit];
if(isNil "_unit" OR isNull _unit) exitwith {};

[_unit,player] remoteExecCall ["TON_fnc_getID",RSERV];