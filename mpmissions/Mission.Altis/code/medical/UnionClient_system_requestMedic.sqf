/*
	
	Filename: 	UnionClient_system_requestMedic.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (life_medicstatus >= 0) exitWith {titleText["Вы уже отправили запрос","PLAIN"]};

private _medicsOnline = {_x != player && {side _x == east} && {alive _x}} count playableUnits > 0;
if (_medicsOnline) then {	
	[player,GVAR_RNAME(player)] remoteExecCall ["UnionClient_system_medicRequest",east];
} else {
	[player,GVAR_RNAME(player)] remoteExecCall ["UnionClient_system_copMedicRequest",west];
};

life_medicstatus = 0;
[player,"medicStatus",life_medicstatus] call CBA_fnc_setVarNet;