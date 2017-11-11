/*

	Filename: 	UnionClient_system_onGetOutMan.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_position","",[""]],
	["_vehicle",objNull,[objNull]],
	["_turret",[],[[]]]
];

_vehicle removeAction AID_VEHOUT;
_vehicle removeAction AID_VEHNITRO;
_vehicle removeAction AID_VEHPARA;
if (EQUAL(life_dhl_car,_vehicle)) then {
	_vehicle removeAction AID_VEHDHM;
};

[] call UnionClient_system_updateViewDistance;