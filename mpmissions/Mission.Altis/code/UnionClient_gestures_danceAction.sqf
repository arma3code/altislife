/*
	
	Filename: 	UnionClient_gestures_danceAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _dance = param [0,"",[""]];

if (life_dance) exitWith {};
life_dance = true;

[_dance] call UnionClient_system_animDo;
uiSleep 2;
waitUntil {uiSleep 0.03; !(ISANIMSTATE(_dance)) OR (LSNOTALIVE(player))};
if (LSINCAP(player)) then {
	["unconsciousrevivedefault"] call UnionClient_system_animDo;
} else {[] call UnionClient_system_animDo};
life_dance = false;