/*

	Filename: 	UnionClient_system_lcm_up.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _lcm = param [0,objNull,[objNull]];
player attachto [_lcm,[-3.3,-12,-3.5]];
PLAYER switchmove "GetInHemttBack";
uiSleep 2;
player attachto [_lcm,[-3.3,-11,-2.5]];
uiSleep 1;
player attachto [_lcm,[-3.3,-10.5,-2]];
detach player;