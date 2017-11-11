/*

	Filename: 	UnionClient_system_surrender.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
[player,"surrender",true] call CBA_fnc_setVarNet;

while {player GVAR ["surrender",false]}  do {	
	player playAction "Surrender";
	if (LSNOTALIVE(player) or GVAR_RESTRAINED(player)) then {
		[player,"surrender"] call UnionClient_system_clearGlobalVar;
	};
	uiSleep 0.3;
};

["AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;