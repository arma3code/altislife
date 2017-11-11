/*

	Filename: 	UnionClient_archeology_addItems.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _container = param [0,objNull,[objNull]];
if (isNull _container) exitWith {"Archeology - AddItem - Container is null" call UnionClient_system_log};
if (!isClass (missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyItems" >> typeOf _container)) exitWith {"Archeology - AddItem - No Class for Container in CFG" call UnionClient_system_log};

private _items = getArray(missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyItems" >> typeOf _container >> "items");
private _virtualItems = getArray(missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyItems" >> typeOf _container >> "virtualItems");
private _recipes = getArray(missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyItems" >> typeOf _container >> "recipes");

private _chance = round(random(100));
format["Archeology - AddItem - Item Chance: %1",_chance] call UnionClient_system_log;

private "_item";
private _added = false;
{
	if (_added) exitWith {"Archeology - AddItem - Item already added. Exit from ForEach" call UnionClient_system_log};
	if (_chance <= (_x select 1)) then {		
		_item = selectRandom (_x select 0);
		[_item,_container,false] call UnionClient_system_addItemToBox;
		_added = true;
		format["Archeology - AddItem - Added to Container: %1",_item] call UnionClient_system_log;
	};
} forEach _items;

_chance = round(random(100));
format["Archeology - AddItem - vItem Chance: %1",_chance] call UnionClient_system_log;

private _added = false;
{
	if (_added) exitWith {"Archeology - AddItem - vItem already added. Exit from ForEach" call UnionClient_system_log};
	if (_chance <= (_x select 1)) then {
		_item = selectRandom (_x select 0);		
		_container SVAR ["Trunk",[[[_item select 0,_item select 1]],_item select 1]];
		_added = true;
		format["Archeology - AddItem - Added vItem to Container: %1",_item] call UnionClient_system_log;
	};
} forEach _virtualItems;

_chance = round(random(100));
format["Archeology - AddItem - Recipe Chance: %1",_chance] call UnionClient_system_log;

private _added = false;
{
	if (_added) exitWith {"Archeology - AddItem - Recipe already added. Exit from ForEach" call UnionClient_system_log};
	if (_chance <= (_x select 1)) then {		
		_item = selectRandom (_x select 0);
		[_item] call UnionClient_crafting_Learn;
		_added = true;
		format["Archeology - AddItem - Added Recipe: %1",_item] call UnionClient_system_log;
	};
} forEach _recipes;