/*

	Filename: 	UnionClient_system_getBuildingPositions.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,objNull,[objNull]];
if (isNull _house) exitWith {[]};

private _restricted = M_CONFIG2(getArray,"LifeCfgHousing",worldName,typeOf _house,"restrictedPos");
private _return = [_house] call BIS_fnc_buildingPositions;

{
	_return set [_x,[-1]];
} forEach _restricted;

_return = _return - [[-1]];
_return;