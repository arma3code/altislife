/*
	
	Filename: 	UnionClient_system_pulloutAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _veh = param [0,objNull,[objNull]];
if (player distance _veh > ((boundingBox _veh select 1) select 0) + 2) exitWith {hint localize "STR_NOTF_TooFarFromTarget"};
private _crew = crew _veh;

{
	[player] remoteExec ["UnionClient_system_pulloutVeh",_x];
} foreach _crew;