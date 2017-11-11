/*

	Filename: 	UnionClient_system_havePlate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _veh = param [0,"",[""]];
if (EQUAL(_veh,"")) exitWith {false};
(["ext_Jonzie",_veh] call UnionClient_system_xString OR ["ext_ivory",_veh] call UnionClient_system_xString)