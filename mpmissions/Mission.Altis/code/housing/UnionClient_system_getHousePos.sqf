/*

	Filename: 	UnionClient_system_getHousePos.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,objNull,[objNull,[]]];
private _return = [];

private _pos = switch (true) do { 
	case (_house isEqualType objNull) : {
		getPosATL _house;
	}; 
	case (_house isEqualType []) : {
		_house;
	}; 
	default {[]}; 
};

if (EQUAL(_pos,[])) exitWith {[]};

[round(_pos select 0),round(_pos select 1),0]