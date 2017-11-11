/*

	Filename: 	UnionClient_gangs_NewLeaderClient.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_unit","_group"];
_unit = _this select 0;
_group = _this select 1;
if(isNil "_unit" OR isNil "_group") exitWith {};
if(player == _unit && (group player) == _group) then
{
	player setRank "COLONEL";
	_group selectLeader _unit;
	hint "Вы стали лидером группировки.";
};