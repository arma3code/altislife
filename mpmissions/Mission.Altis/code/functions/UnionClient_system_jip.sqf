/*

	Filename: 	UnionClient_system_jip.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
"JIP - Search for Land Vehicle..." call UnionClient_system_log;
private ["_index","_material"];
{
	_index = _x GVAR ["life_VEH_color",""];
	if !(EQUAL(_index,"")) then {
		[_x,_index] call UnionClient_system_colorVehicle;
	};
	_material = _x GVAR ["Life_VEH_material",""];
	if !(EQUAL(_material,"")) then {
		[_x,_material] call UnionClient_system_materialVehicle;
	};
	//if ([typeof _x] call UnionClient_system_havePlate) then {[_x] call UnionClient_system_setPlate};
} foreach (allMissionObjects "LandVehicle");

"JIP - Search for Air Vehicle..." call UnionClient_system_log;
{
	_index = _x GVAR ["life_VEH_color",""];
	if !(EQUAL(_index,"")) then {
		[_x,_index] call UnionClient_system_colorVehicle;
	};
	//if ([typeof _x] call UnionClient_system_havePlate) then {[_x] call UnionClient_system_setPlate};
} foreach (allMissionObjects "Air");
"JIP - Colors, materials and plates updated" call UnionClient_system_log;