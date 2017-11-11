/*

	Filename: 	UnionClient_inventory_save.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	Модифицированная версия BIS_fnc_saveInventory под наши реалии

*/
#include "..\script_macros.hpp"
private _unit = param [0,objnull,[objnull]];
if (isNull _unit) exitWith {[]};

private _primaryWeaponMagazine = "";
private _secondaryWeaponMagazine = "";
private _handgunMagazine = "";
{
	if (count _x > 4 && {(_x select 4) isEqualType []}) then {
		private _weapon = _x select 0;
		private _magazine = (_x select 4) select 0;
		if !(isnil "_magazine") then {
			switch _weapon do {
				case (primaryweapon _unit): {_primaryWeaponMagazine = _magazine};
				case (secondaryweapon _unit): {_secondaryWeaponMagazine = _magazine};
				case (handgunweapon _unit): {_handgunMagazine = _magazine};
			};
		};
	};
} foreach (weaponsitems _unit);

private _assigned = [];
{
	_assigned pushBack ([_x] call UnionClient_system_tfRadioParent);
} forEach (assigneditems _unit);

private _return = [
	/* 00 */	[uniform _unit,uniformitems _unit],
	/* 01 */	[vest _unit,vestitems _unit],
	/* 02 */	[backpack _unit,backpackitems _unit],
	/* 03 */	headgear _unit,
	/* 04 */	goggles _unit,
	/* 05 */	binocular _unit,
	/* 06 */	[primaryweapon _unit,primaryWeaponItems _unit,_primaryWeaponMagazine],
	/* 07 */	[secondaryweapon _unit,secondaryWeaponItems _unit,_secondaryWeaponMagazine],
	/* 08 */	[handgunweapon _unit,handgunItems _unit,_handgunMagazine],
	/* 09 */	_assigned - [binocular _unit]
];

_return