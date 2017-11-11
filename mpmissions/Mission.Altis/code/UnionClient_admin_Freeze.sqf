/*
	
	Filename: 	UnionClient_admin_Freeze.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit" OR isNull _unit OR _unit == player) exitWith {};

[player] remoteExecCall ["UnionClient_system_freezePlayer",_unit];