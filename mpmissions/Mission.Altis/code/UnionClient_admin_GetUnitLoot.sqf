/*

	Filename: 	UnionClient_admin_GetUnitLoot.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_unit"];
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};
_unit = CONTROL_DATA(2902);
_unit = call compile format["%1", _unit];
if(isNil "_unit" OR isNull _unit) exitwith {};

[player] remoteExecCall ["UnionClient_admin_sendLootToAdmin",_unit];