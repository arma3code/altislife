/*
	
	Filename: 	UnionClient_system_animDo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [	
	["_anim","",[""]],
	["_isSwitchMove",true,[true]],
	["_isPlayMove",true,[true]]
];

if (LSNOTALIVE(player) && {!(EQUAL(_anim,"unconsciousrevivedefault"))}) exitWith {};

[player,_anim,_isSwitchMove,_isPlayMove] remoteExecCall ["UnionClient_system_animSync",RCLIENT];