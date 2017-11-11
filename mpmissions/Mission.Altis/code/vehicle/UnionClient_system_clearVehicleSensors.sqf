/*

	Filename: 	UnionClient_system_clearVehicleSensors.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = [_this, 0, Objnull, [Objnull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {};
private _toOff = ["VisualSensorComponent", "ActiveRadarSensorComponent", "PassiveRadarSensorComponent"];
private _vehSensors = listVehicleSensors _vehicle; {
    if ((_x select 0) in _toOff) then {
        _vehicle enableVehicleSensor[_x select 0, false];
    };
}
forEach _vehSensors;