/*
	
	Filename: 	UnionClient_system_medicSend.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_unit","_mode"];
_mode = param [0,0,[0]];
if (EQUAL((lbCurSel 39002),-1)) exitWith {hint "Никто не выбран"};
_unit = CONTROL_DATA(39002);
_unit = call compile format["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (EQUAL(_unit,player)) exitWith {hint "Себя?";};

[player,_mode] remoteExecCall ["UnionClient_system_medicStatus",_unit];