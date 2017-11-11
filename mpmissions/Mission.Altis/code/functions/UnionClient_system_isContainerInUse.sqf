/*

	Filename: 	UnionClient_system_isContainerInUse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _container = param [0,objNull,[objNull]];
if (isNull _container) exitWith {diag_log "isnull _container";false};
if (isNil {_container GVAR "openedByUnit"}) exitWith {diag_log "isNil openedByUnit";false};

private _ret = false;
private _usedByPID = _container GVAR ["openedByUnit",""];

if !(EQUAL(_usedByPID,"")) then {
	if (!(EQUAL(_usedByPID,steamid)) && {[_usedByPID] call UnionClient_system_isUIDActive}) then {_ret = true};
};

_ret;