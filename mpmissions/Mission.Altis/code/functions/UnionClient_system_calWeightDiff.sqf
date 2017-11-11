/*

	Filename: 	UnionClient_system_calWeightDiff.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_value",-1,[0]],
	["_cWeight",-1,[0]],
	["_mWeight",-1,[0]]
];

if (EQUAL(_item,"") OR EQUAL(_value,-1) OR EQUAL(_cWeight,-1) OR EQUAL(_mWeight,-1)) exitWith {};
private _weight = (ITEM_WEIGHT(_item)) * _value;
private _sum = _value;

if ((_cweight + _weight) > _mWeight) then {
	while {true} do	{
		_sum = _sum - 1;
		if(_sum < 1) exitWith {};
		_weight = (ITEM_WEIGHT(_item)) * _sum;
		if ((_cWeight + _weight) <= _mWeight) exitWith {};
	};
};

_sum;