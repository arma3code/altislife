/*

	Filename: 	UnionClient_system_checkForSearch.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
([_unit,"police_hq_1"] call CBA_fnc_getDistance < 50) OR ([_unit,"police_hq_2"] call CBA_fnc_getDistance < 50) OR ([_unit,"base_cop_7"] call CBA_fnc_getDistance < 50) OR ([_unit,"cop_spawn_2"] call CBA_fnc_getDistance < 50) OR ([_unit,"cop_spawn_3"] call CBA_fnc_getDistance < 50) OR ([_unit,"cop_spawn_5"] call CBA_fnc_getDistance < 50) OR ([_unit,"jail_marker"] call CBA_fnc_getDistance < 100)