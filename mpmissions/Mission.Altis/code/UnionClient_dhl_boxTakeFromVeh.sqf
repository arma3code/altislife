/*

	Filename: 	UnionClient_dhl_boxTakeFromVeh.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(call UnionClient_dhl_check) exitWith {hint localize "STR_DHL_CheckError"};
if !(isNull life_dhl_box) exitWith {};

life_dhl_car removeAction AID_TFW;

[player] call UnionClient_dhl_boxSpawn;
[] spawn UnionClient_dhl_boxPickUp;