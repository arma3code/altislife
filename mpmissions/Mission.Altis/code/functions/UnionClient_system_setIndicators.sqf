/*
	
	Filename: 	UnionClient_system_setIndicators.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _indicators = param [0,[],[[]]];
if (EQUAL(_indicators,[])) exitWith {};

private["_var","_val"];
{
	_var = _x select 0;
	_val = _x select 1;
	
	switch (_var) do {
		case "life_hunger": {
			if (_val < 30) then {_val = 30};
		};
		case "life_thirst": {
			if (_val < 30) then {_val = 30};
		};
		case "life_myIdentity": {
			if (EQUAL(FETCH_CONST(life_donator),0)) then {_val = ""};
		};
		case "life_myPassportID": {
			if !(_val isEqualType "") then {_val = ""};
		};
		case "life_death_endtime": {
			if (EQUAL(_val,0)) then {
				life_death_markers = [];
			};
		};
	};
	
	SVAR_MNS [_var,_val];
} foreach _indicators;