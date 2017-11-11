/*

	Filename: 	UnionClient_system_houseContainerCheck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	проверка предметов в коробке на удаленные из мода и пересчет веса на всякий.
	кривые убираются и делаем пересчет веса

*/
#include "..\..\script_macros.hpp"
params [
	["_box",objNull,[objNull]],
	["_box_inventory",[],[[]]]
];

if (EQUAL(_box_inventory select 0,[]) OR isNull _box) exitWith {};

private _box_data = _box_inventory select 0;
private _box_weight = 0;

private["_itemData"];
{
	_itemData = [_x select 0] call UnionClient_system_itemDetails;
	if (EQUAL(_itemData,[])) then {
		format ["House Check - Item %1 was removed from mod or bad className. Removed from array",_x select 0] call UnionClient_system_log; 
		_box_data set[_forEachIndex,[-1]];		
	} else {
		_box_weight = _box_weight + ((_itemData select 6) * (_x select 1));
	};
} forEach _box_data;
_box_data = _box_data - [[-1]];

switch (typeOf _box) do {
	case "Land_LuggageHeap_03_F": {
		_box SVAR ["house_box_inventory",[_box_data,_box_weight],true];
	};
	case (LIFE_SETTINGS(getText,"life_trunkClass")) : {
		_box SVAR ["inventory",[_box_data,_box_weight],true];
	}; 
	default {};
};