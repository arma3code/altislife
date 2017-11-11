/*

	Filename: 	UnionClient_system_isTrunkInUse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _trunk = param [0,objNull,[objNull]];
if (isNull _trunk) exitWith {false};
if (isNil {_trunk GVAR "trunk_inUseBy"}) exitWith {false};
private _ret = false;
private _usedByPID = _trunk GVAR ["trunk_inUseBy",""];

if !(EQUAL(_usedByPID,"")) then {
	if (!(EQUAL(_usedByPID,steamid)) && {[_usedByPID] call UnionClient_system_isUIDActive}) then {_ret = true};
};

_ret;