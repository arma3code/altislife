/*

	Filename: 	UnionClient_system_clearAllLifeVars.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};

_unit SVAR ["tf_sendingDistanceMultiplicator",3.0];

[_unit,"steam64id",steamid] call CBA_fnc_setVarNet;
[_unit,"clientID",clientOwner] call CBA_fnc_setVarNet;
[_unit,"unitSide",playerSide] call CBA_fnc_setVarNet;

{
	[_unit,_x] call UnionClient_system_clearGlobalVar;
} forEach ["draggedBy","robbed","surrender","knoked","reviving","medicStatus","realtitle","realname","slave","pvp","lvl","copLevel","medrank","inPBfight","restrained","inDrink","houseRaid","karma"];

[] call UnionClient_system_saveGear;