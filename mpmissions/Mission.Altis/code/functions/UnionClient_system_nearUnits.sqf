/*
	
	Filename: 	UnionClient_system_nearUnits.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_faction",sideUnknown,[sideUnknown]],
	["_position",(getPos player),[[]]],
	["_radius",30,[0]]	
];

if (EQUAL(_faction,sideUnknown)) exitWith {false};

private _ret = false;

_ret = {_x != player && side _x == _faction && alive _x && _position distance _x < _radius} count playableUnits > 0;
_ret;