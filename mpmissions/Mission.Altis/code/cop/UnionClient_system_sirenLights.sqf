/*

	Filename: 	UnionClient_system_sirenLights.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {}; //Bad entry!
if !((typeOf _vehicle) in (LIFE_SETTINGS(getArray,"life_vehiclesWithLights"))) exitWith {};

if (_vehicle GVAR ["lights",false]) then {	
	[_vehicle,"lights"] call UnionClient_system_clearGlobalVar;
} else {
	[_vehicle,"lights",true] call CBA_fnc_setVarNet;
	[_vehicle,0.22] remoteExec ["UnionClient_system_copLights",RCLIENT];
};