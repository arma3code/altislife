/*

	Filename: 	UnionClient_system_removeBuff.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _type = param [0,"",[""]];
if (EQUAL(_type,"")) exitWith {};

switch (_type) do {
	case "debuffs": {
		life_bleeding = false;
		life_pain_shock = false;
		life_critHit = false;
	}; 
	case "buffs": {
		life_speed_buff = false;
		life_radx_used = false;
		life_turbo_used = false;
	};
	case "all": {
		life_bleeding = false;
		life_pain_shock = false;
		life_critHit = false;
		life_speed_buff = false;
		life_radx_used = false;
		life_turbo_used = false;
	};
	default {
		SVAR_MNS [_type,false];
	};
};