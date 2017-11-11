/*

	Filename: 	UnionClient_system_WeaponAssembled.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_unit","_object"];
if (EQUAL((typeof _object),"sab_CUAV_UAV_Orange")) exitWith {};

_object disableTIEquipment true;