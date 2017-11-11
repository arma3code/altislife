/*
	
	Filename: 	UnionClient_system_robAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _target = param [0,ObjNull,[ObjNull]];
if (isNull _target) exitWith {};
if (!isPlayer _target OR (player distance _target > 5)) exitWith {};

if ([player] call UnionClient_system_isSafeZone) exitWith {hint localize "STR_NOTF_GreenZone"};
if ([player] call UnionClient_system_isShopNear) exitWith {hint localize "STR_NOTF_ShopNear"};

if(_target GVAR ["robbed",false]) exitWith {};
[player,steamid] remoteExecCall ["UnionClient_system_robPerson",_target];
[_target,"robbed",true] call CBA_fnc_setVarNet;