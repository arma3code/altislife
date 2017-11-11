/*

	Filename: 	UnionClient_system_removeItemFromWeapon.sqf
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
	case (_item in (primaryWeaponItems player + primaryWeaponMagazine player)): {
		player removePrimaryWeaponItem _item;
		_return = true;
	};
	case (_item in (secondaryWeaponMagazine player + secondaryWeaponItems player)): {
		player removeSecondaryWeaponItem _item;
		_return = true;
	};
	case (_item in (handgunMagazine player + handgunItems player)): {
	 	player removeHandgunItem _item;
		_return = true;
	};
	default {};
};

_return