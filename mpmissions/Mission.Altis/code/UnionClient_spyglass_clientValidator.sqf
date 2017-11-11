/*

	Filename: 	UnionClient_spyglass_clientValidator.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/

#include "..\script_macros.hpp"
{
	if (!isNil {GVAR_MNS _x}) exitWith {
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
} foreach ["sell_array","buy_array","life_action_gathering","life_drink"];
