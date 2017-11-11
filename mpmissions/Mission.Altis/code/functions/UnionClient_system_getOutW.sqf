/*
	
	Filename: 	UnionClient_system_getOutW.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (NOTINVEH(player)) exitWith {};
player action ["getOut", objectParent player];
waitUntil {NOTINVEH(player)};
life_curWep_h = CURWEAPON;
player action ["SwitchWeapon",player,player,100];