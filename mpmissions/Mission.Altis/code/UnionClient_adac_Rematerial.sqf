/*

	Filename: 	UnionClient_adac_Rematerial.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNull adac_vehicleToUpgrade) exitWith {};
if (EQUAL((lbCurSel 3713),-1)) exitWith {hint localize "STR_ADAC_NoColorSelect"};
private _material = CONTROL_DATA(3713);

if !(isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _material)) exitWith {};

if !(EQUAL(_material,"")) then {	
	[adac_vehicleToUpgrade,_material] call UnionClient_system_materialVehicle;
	[adac_vehicleToUpgrade,_material] remoteExecCall ["TON_fnc_vehicleAdacRematerial",RSERV];
	hint localize "STR_ADAC_VehColorDone";
} else {
	hint "Материал пуст";
};