/*

	Filename: 	UnionClient_system_loadInHB.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_bed","_units","_unit"];
_bed = param [0,ObjNull,[ObjNull]];
if (isNull _bed) exitWith {};
if (!isNull life_DraggedBody) exitWith {hint "Вы кого-то несете. Положите его сперва на землю"};

_units = nearestObjects[_bed,["Man"],5] - [player];
if (EQUAL(_units,[])) exitWith {};

{
	if (!isNil "_unit") exitWith {};
	if (LSINCAP(_x) && isPlayer _x) exitWith {_unit = _x};
} foreach _units;

if (isNil "_unit") exitWith {};

[_bed] remoteExecCall ["UnionClient_system_moveIn",_unit];