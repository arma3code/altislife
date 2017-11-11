/*
	
	Filename: 	UnionClient_system_searchAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
uiSleep 2;
if(player distance _unit > 5 || (call UnionClient_system_isInterrupted) || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[player] remoteExecCall ["UnionClient_system_searchClient",_unit];
call UnionClient_actions_inUse;