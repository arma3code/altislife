/*

	Filename: 	UnionClient_adac_Recolor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNull adac_vehicleToUpgrade) exitWith {};
if (EQUAL((lbCurSel 3709),-1)) exitWith {hint localize "STR_ADAC_NoColorSelect"};
private _color = CONTROL_DATA(3709);

if !(isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) exitWith {};

if !(EQUAL(_color,"")) then {
	[adac_vehicleToUpgrade,_color] call UnionClient_system_colorVehicle;	
	[adac_vehicleToUpgrade,_color] remoteExecCall ["TON_fnc_vehicleAdacRecolor",RSERV];
	hint localize "STR_ADAC_VehColorDone";
} else {
	hint "Цвет пуст";
};