/*

	Filename: 	UnionClient_evh_onPlayerRespawn.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
life_corpse = param [1,ObjNull,[ObjNull]];

[life_corpse] spawn UnionClient_system_dropItems;

[_unit] call UnionClient_system_clearAllLifeVars;
["all"] call UnionClient_system_removeBuff;

[] call UnionClient_system_setTag;
[] call UnionClient_system_setTitle;

["cash","drop",0] call UnionClient_system_myCash;

_unit addRating 9999999999999999;

[_unit,"lifeState","RESPAWN"] call CBA_fnc_setVarNet;
[_unit,"karma",life_karma] call CBA_fnc_setVarNet;
switch (playerSide) do {
	case civilian: {
		[_unit,"lvl",life_civlevel] call CBA_fnc_setVarNet;
		[] call UnionClient_loadout_civ;
	};
	case independent: {
		[_unit,"lvl",life_reblevel] call CBA_fnc_setVarNet;
		[] call UnionClient_loadout_reb;
	};
	case west: {
		[_unit,"copLevel",life_coplevel] call CBA_fnc_setVarNet;
		[] call UnionClient_loadout_cop;
	};
	case east: {
		[_unit,"medrank",life_medicLevel] call CBA_fnc_setVarNet;
		[] call UnionClient_loadout_medic;
	};
};

life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_prisonkey = false;
life_respawned = false;
life_slave = false;
life_pvp = false;
life_inwarzone = false;
life_surrended = false;
life_newLife = true;
life_ids = [];
life_tempHouses = [];

_unit playMoveNow "AinjPpneMstpSnonWnonDnon";
removeBackpack _unit;
removeAllWeapons _unit;

if !(EQUAL((goggles _unit),"")) then {removeGoggles _unit};
if !(EQUAL((goggles life_corpse),"")) then {removeGoggles life_corpse};

[] call UnionClient_surgery_Init;
[] call UnionClient_init_actions;
if (LIFE_SETTINGS(getNumber,"life_enableFatigue") isEqualTo 0) then {_unit enableFatigue false};

[] call UnionClient_system_saveGear;