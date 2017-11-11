/*

	Filename: 	UnionClient_spawn_SafeMarker.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _side = param [0,civilian,[civilian]];
private _ret = getMarkerPos "emergency_spawn";

switch (worldName) do {
	case "Altis": {
		switch (_side) do {
			case civilian : {_ret = getMarkerPos "civ_spawn_3"}; //атира
			case independent : {_ret = getMarkerPos "reb_spawn_3"}; //юго-восток
			case west : {_ret = getMarkerPos "cop_spawn_1"}; //кавала
			case east : {_ret = getMarkerPos "medic_spawn_1"}; //кавала
			default {};
		};

	};
	case "Tanoa": {
		switch (_side) do {
			case civilian : {_ret = getMarkerPos "civ_spawn_3"}; //Ла-Рошель
			case independent : {_ret = getMarkerPos "reb_spawn_3"}; //каткоула
			case west : {_ret = getMarkerPos "cop_spawn_1"}; //джордж-таун
			case east : {_ret = getMarkerPos "medic_spawn_1"}; //джордж-таун
			default {};
		};
	};
	default {};
};

_ret