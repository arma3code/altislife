/*
	
	Filename: 	UnionClient_system_pullOutVeh.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _source = param [0,objNull,[objNull]];
if (NOTINVEH(player)) exitWith {};

if (LSINCAP(player)) then {
	player setUnconscious false;	
	moveOut player;	
	waitUntil {[player] call CBA_fnc_isTurnedOut};
	player setUnconscious true;
} else {
	moveOut player;	
	titleText [localize "STR_NOTF_PulledOut","PLAIN"];
	systemChat format["Вас высадил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _source];
	titleFadeOut 4;
	waitUntil {[player] call CBA_fnc_isTurnedOut};
	life_curWep_h = CURWEAPON;
	player action ["SwitchWeapon",player,player,100];
};