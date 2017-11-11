/*
	
	Filename: 	UnionClient_system_nearPlayers.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_position",getPos player,[[]]],
	["_radius",30,[0]]
];

private _ret = false;
_ret = {_x != player && alive _x && !(GVAR_RESTRAINED(_x)) && _position distance _x < _radius} count playableUnits > 0;
_ret;