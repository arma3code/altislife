/*
	
	Filename: 	UnionClient_admin_Query.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _info = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_info") exitWith {CONTROL(2900,2903) ctrlSetText localize "STR_ANOTF_QueryFail";};
if(isNull _info) exitWith {CONTROL(2900,2903) ctrlSetText localize "STR_ANOTF_QueryFail";};
CONTROL(2900,2903) ctrlSetText localize "STR_ANOTF_Query";
[player] remoteExecCall ["UnionClient_admin_PlayerQuery",_info];