/*

	Filename: 	UnionClient_adac_InitUpgrades.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_config",[],[[]]]
];

if (EQUAL(_config,[])) exitWith {};

{
	switch (_x select 0) do {
		case "boxes" : {[_vehicle,"adacBoxes",_x select 1] call CBA_fnc_setVarNet};
		case "nitro" : {[_vehicle,"adacNitroUsed",0] call CBA_fnc_setVarNet}; 
	};
} forEach _config;