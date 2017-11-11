/*

	Filename: 	UnionClient_system_medicSiren.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};
if !(_vehicle GVAR ["siren",false]) exitWith {};

while {true} do {
	if (isNull _vehicle) exitWith {};
	if (EQUAL((crew _vehicle),[]) OR !alive _vehicle) then {[_vehicle,"siren"] call UnionClient_system_clearGlobalVar};
	if !(_vehicle GVAR ["siren",false]) exitWith {};
	_vehicle say3D ["medic_siren", 200, 1];
	uiSleep 14.9;
};