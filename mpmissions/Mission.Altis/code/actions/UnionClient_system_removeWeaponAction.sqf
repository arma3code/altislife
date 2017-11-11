/*
	
	Filename: 	UnionClient_system_removeWeaponAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
hint format [localize "STR_NOTF_IllegalWeapSearch",GVAR_RNAME(_unit)];
if(player distance _unit > 5 || (call UnionClient_system_isInterrupted) || !alive _unit) exitWith {hint localize "STR_NOTF_ActionCancel"};
[player] remoteExecCall ["UnionClient_system_removeWeapons",_unit];
life_action_inUse = false;