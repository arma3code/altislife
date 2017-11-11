/*

	Filename: 	UnionClient_gather_Spawn.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_item","",[""]],
	["_itemModel","",[""]],
	["_val",1,[0]]
];

private _count = switch (FETCH_CONST(life_donator)) do {
	case 0: {2};
	case 1: {3};
	case 2: {3};
	case 3: {4};
	case 4: {5};
};

if (life_turbo_used) then {ADD(_count,1)};

private _itemName = ITEM_NAME(_item);
private _resource = _itemModel createVehicleLocal (getPosATL player);
private _time = if (FETCH_CONST(life_donator) > 0) then {1 * _val} else {3 * _val};
waitUntil {!isNull _resource};
player reveal _resource;
[
	_resource,
	format["Подобрать %1",_itemName],
	"",
	"",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{},
	{},
	{[_this select 0,(_this select 3) select 0] spawn UnionClient_gather_Take},
	{},
	[_item],
	_time,
	nil,
	false,
	false
] spawn BIS_fnc_holdActionAdd;
_resource SVAR ["resourceValue",_count * _val];
_resource SVAR ["resourceTime",time];

uiSleep 0.3;

[format["Вы добыли %1",_itemName]] spawn UnionClient_gui_Notification;