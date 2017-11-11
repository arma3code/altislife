/*

	Filename: 	UnionClient_system_removeLegcuffs.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _target = cursorObject;
if (isNull _target OR (!(_target isKindOf "Man")) OR (!alive _target)) exitWith {};
if !(_target GVAR ["isArrested",false]) exitWith {};
if (_target GVAR ["karma",0] > 0) exitWith {hint "Этот человек был помещен в тюрьму за нарушение правил. Зря проделал такой путь..."};
[_target,"isArrested"] call UnionClient_system_clearGlobalVar;
[2,format[localize "STR_NOTF_JailYouCanRun",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",_target];
hint localize "STR_NOTF_JailNumberRemoved";