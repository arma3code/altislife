/*

	Filename: 	UnionClient_system_removeItemFromInventory.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {false};

private _return = false;

switch (true) do {
	case (_item in PUNIFORM_ITEMS): {
		private _oldCount = count PUNIFORM_ITEMS;
		player removeItemFromUniform _item;
		_return = if (count PUNIFORM_ITEMS < _oldCount) then {true};		 
	};
	case (_item in PVEST_ITEMS): {
		private _oldCount = count PVEST_ITEMS;
		player removeItemFromVest _item;
		_return = if (count PVEST_ITEMS < _oldCount) then {true};
	};
	case (_item in PBACKPACK_ITEMS) : {
		private _oldCount = count PBACKPACK_ITEMS;
		player removeItemFromBackpack _item;
		_return = if (count PBACKPACK_ITEMS < _oldCount) then {true};
	};
	case (_item in P_ASSIGNED): {
		private _oldCount = count P_ASSIGNED;
		player unlinkItem _item;
		_return = if (count P_ASSIGNED < _oldCount) then {true};
	};
	default {};
};

_return