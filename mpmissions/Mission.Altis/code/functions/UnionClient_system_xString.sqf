/*
	
	Filename: 	UnionClient_system_xString.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	_found = ["needle", "Needle in Haystack"] call UnionClient_system_xString;

*/
#include "..\..\script_macros.hpp"
private _toSearch = toArray (param [0,"",[""]]);
private _inSearch = toArray (param [1,"",[""]]);

private _lengthTo = count _toSearch;
private _lengthIn = count _inSearch;

private _found = false;

if (_lengthIn >= _lengthTo) then {
	_inSearch resize _lengthTo;
	if (EQUAL(_inSearch,_toSearch)) then {_found = true};
};

_found;