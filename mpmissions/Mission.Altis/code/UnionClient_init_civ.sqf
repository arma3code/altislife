/*

	Filename: 	UnionClient_init_civ.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};

if (life_civlevel < 1) exitWith {
	["NotWhitelistedCiv",FALSE,FALSE] call BIS_fnc_endMission;
};

player addRating 9999999;

[player,"lvl",life_civlevel] call CBA_fnc_setVarNet;
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
[player,"karma",life_karma] call CBA_fnc_setVarNet;
if (count life_mycrimes > 0) then {
	[[steamid,GVAR_RNAME(player),life_mycrimes],"wantedLoadCrimes"] call UnionClient_system_hcExec;
};

if (life_is_arrested) then {
	life_is_arrested = false;
	[player,true,life_jail_time] call UnionClient_system_jail;
} else {
	if (life_slave) then {
		[player,"slave"] call UnionClient_system_clearGlobalVar;
		[] call UnionClient_system_sellSlaveAction;
	} else {
		[] call UnionClient_spawn_Menu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};