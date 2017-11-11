/*

	Filename: 	UnionClient_system_setDeadState.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[objNull]];

private _deathAnim = [_unit] call UnionClient_system_getDeathAnimation;

if (EQUAL(_deathAnim,"Unconscious") && !(NOTINVEH(_unit))) exitWith {
	[_unit] remoteExec ["UnionClient_system_pulloutVeh",_unit];
};

[_unit,_deathAnim] remoteExecCall ["UnionClient_system_animSync",RCLIENT];