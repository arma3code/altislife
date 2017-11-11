/*

	Filename: 	UnionClient_init_cop.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};

if(life_coplevel < 1) exitWith {
	["Notwhitelisted",FALSE,FALSE] call BIS_fnc_endMission;	
};

player addRating 9999999;

[player,"copLevel",life_coplevel] call CBA_fnc_setVarNet;
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

[] call UnionClient_spawn_Menu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.