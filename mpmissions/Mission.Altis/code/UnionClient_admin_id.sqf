/*
	
	Filename: 	UnionClient_admin_id.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_ret","_text"];
disableSerialization;
_ret = param [0,objNull,[objNull]];
_text = CONTROL(2900,2903);

_text ctrlSetStructuredText parseText format["ID: %1",_ret];