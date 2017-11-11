/*
	
	Filename: 	UnionClient_admin_SendLootToAdmin.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_admin","_playerItems"];
_admin = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _admin) exitWith {};

_playerItems = [] call UnionClient_system_getPlayerItems;
[_playerItems] remoteExecCall ["UnionClient_admin_UnitLootInfo",_admin];