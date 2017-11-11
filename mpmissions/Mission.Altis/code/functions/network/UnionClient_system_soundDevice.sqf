/*

	Filename: 	UnionClient_system_soundDevice.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\..\script_macros.hpp"
if (isNull _this) exitWith {};
if (player distance _this > 2500) exitWith {}; //Don't run it... They're to far out..

while {true} do {
	if (isNull _this OR !alive _this) exitWith {};
	if (isNil {_this GVAR "mining"}) exitWith {};
	_this say3D "Device_disassembled_loop";
	uiSleep 28.6;
};