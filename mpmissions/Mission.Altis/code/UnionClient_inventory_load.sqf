/*

	Filename: 	UnionClient_inventory_load.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	Модифицированная версия BIS_fnc_loadInventory под наши реалии (FIX дюпа прицелов)

*/
#include "..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_inventory",[],[[]]]
];

if (isNull _unit) exitWith {};
if (EQUAL(_inventory,[])) exitWith {};

// Раскидываем данные по пременным

private _uniform = (_inventory select 0) select 0;
private _uniformitems = (_inventory select 0) select 1;

private _vest = (_inventory select 1) select 0;
private _vestitems = (_inventory select 1) select 1;

private _backpack = (_inventory select 2) select 0;
private _backpackitems = (_inventory select 2) select 1;

private _headgear = _inventory select 3;
private _goggles = _inventory select 4;
private _binocular = _inventory select 5;

private _primaryweapon = (_inventory select 6) select 0;
private _primaryweaponacc = (_inventory select 6) select 1;
private _primaryweaponmagazine = (_inventory select 6) select 2;

private _secondaryweapon = (_inventory select 7) select 0;
private _secondaryweaponacc = (_inventory select 7) select 1;
private _secondaryweaponmagazine = (_inventory select 7) select 2;

private _handgunweapon = (_inventory select 8) select 0;
private _handgunweaponacc = (_inventory select 8) select 1;
private _handgunweaponmagazine = (_inventory select 8) select 2;

private _assigneditems = _inventory select 9;

// Добавляем форму с проверкой на существующий класс
if !(EQUAL(_uniform,"")) then {
	if (isclass (configfile >> "cfgWeapons" >> _uniform)) then {
		_unit forceadduniform _uniform;
	};
};

// Добавляем броник с проверкой на существующий класс
if !(EQUAL(_vest,"")) then {
	if (isclass (configfile >> "cfgWeapons" >> _vest)) then {
		_unit addvest _vest;
	};
};

// Добавляем рюкзак с проверкой на существующий класс
if !(EQUAL(_backpack,"")) then {
	if (isclass (configfile >> "cfgVehicles" >> _backpack)) then {		
		_unit addbackpack _backpack;
		clearAllItemsFromBackpack _unit;
	};
};

// Добавляем головной убор с проверкой на существующий класс
if !(EQUAL(_headgear,"")) then {
	if (isclass (configfile >> "cfgWeapons" >> _headgear)) then {
		_unit addheadgear _headgear;
	};
};

// Добавляем очки с проверкой на существующий класс
if !(EQUAL(_goggles,"")) then {
	if (isclass (configfile >> "cfgGlasses" >> _goggles)) then {
		_unit addgoggles _goggles;
	};
};

// Закидываем обоймы из оружия, чтобы при добавлении оружия в руки они сразу ушли в загрузку
{
	if !(EQUAL(_x,"")) then {_unit addmagazine _x};
} foreach [_primaryweaponmagazine,_secondaryweaponmagazine,_handgunweaponmagazine];

// Добавляем оружия и бинокль
{
	if !(EQUAL(_x,"")) then {
		_unit addweapon _x;
	};
} foreach [_binocular,_primaryweapon,_secondaryweapon,_handgunweapon];

// Заполняем содержимое униформы, броника и рюкзака
{_unit additemtouniform _x} foreach _uniformitems;
{_unit additemtovest _x} foreach _vestitems;
{_unit additemtobackpack _x} foreach _backpackitems;

// Ставим обвес на автомат
{
	if !(EQUAL(_x,"")) then {
		_unit addPrimaryWeaponItem _x;
	};
} forEach _primaryweaponacc;

// Ставим обвес на рпг
{
	if !(EQUAL(_x,"")) then {
		_unit addSecondaryWeaponItem _x;
	};
} forEach _secondaryweaponacc;

// Ставим обвес на пистолет
{
	if !(EQUAL(_x,"")) then {
		_unit addHandgunItem _x;
	};
} forEach _handgunweaponacc;

// Закидываем карту, компас и тд
{
	if !(EQUAL(_x,"")) then {
		_unit linkitem ([_x] call UnionClient_system_tfRadioParent);
	};
} forEach _assigneditems;

true