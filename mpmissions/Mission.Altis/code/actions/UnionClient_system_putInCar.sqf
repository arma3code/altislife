/*

	Filename: 	UnionClient_system_putInCar.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR !isPlayer _unit) exitWith {};
if (!isNull life_DraggedBody) exitWith {hint localize "STR_NOTF_DragSmth"};

private _nearestVehicle = nearestObjects[getPosATL player,["LandVehicle","Ship","Submarine","Air"],10] select 0;
if (isNil "_nearestVehicle") exitWith {hint localize "STR_NOTF_VehicleNear"};

detach _unit;
[_nearestVehicle] remoteExecCall ["UnionClient_system_moveIn",_unit];