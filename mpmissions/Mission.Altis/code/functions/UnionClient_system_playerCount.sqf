/*
	
	Filename: 	UnionClient_system_playerCount.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _faction = param [0,civilian,[east]];

{EQUAL(side _x,_faction)} count playableUnits;