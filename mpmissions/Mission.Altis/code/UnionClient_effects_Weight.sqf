/*

	Filename: 	UnionClient_effects_Weight.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _bp = "";
private["_cfg","_load"];
while {true} do {
	if (EQUAL((backpack player),"")) then {
		life_maxWeight = life_maxWeightT;
		_bp = "";
	} else {
		if !(EQUAL(_bp,backpack player)) then {
			_bp = backpack player;
			_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
			if (_cfg > 300) then {_cfg = 300};
			_load = round(_cfg / 8);
			life_maxWeight = life_maxWeightT + _load;
		};		
	};

	if (life_carryWeight > life_maxWeight && !isForcedWalk player) then {
		player forceWalk true;
		player setFatigue 1;
		hint localize "STR_NOTF_MaxWeight";
	} else {
		if (isForcedWalk player) then {
			player forceWalk false;
		};
	};

	uiSleep 2;
};