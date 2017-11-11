/*
	
	Filename: 	UnionClient_system_materialVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_material","",[""]],
	["_global",true,[true]]
];

format["VehicleMaterial - This: %1",_this] call UnionClient_system_log;

if (isNull _vehicle OR (EQUAL(_material,""))) exitWith {};
if (!alive _vehicle) exitWith {};
if !(isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _material)) exitWith {};

if (_global) then {
	_vehicle setObjectMaterialGlobal [0,M_CONFIG(getText,"LifeCfgVehMaterials",_material,"material")];
} else {
	_vehicle setObjectMaterial [0,M_CONFIG(getText,"LifeCfgVehMaterials",_material,"material")];
};