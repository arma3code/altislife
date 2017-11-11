/*
	
	Filename: 	UnionClient_system_clothingFilter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	"_control",
	["_selection",0,[0]]
];

private _list = CONTROL(3100,3101);
lbClear _list;

private _configArray = switch (_selection) do {
    case 0: {M_CONFIG(getArray,"LifeCfgClothShops",life_clothing_store,"uniforms")};
    case 1: {M_CONFIG(getArray,"LifeCfgClothShops",life_clothing_store,"headgear")};
    case 2: {M_CONFIG(getArray,"LifeCfgClothShops",life_clothing_store,"goggles")};
    case 3: {M_CONFIG(getArray,"LifeCfgClothShops",life_clothing_store,"vests")};
    case 4: {M_CONFIG(getArray,"LifeCfgClothShops",life_clothing_store,"backpacks")};
    default {[]};
};

if (EQUAL(_configArray,[])) exitWith {};

private "_details";
{
	_x params [
		["_className","",[""]],
		["_displayName","",[""]],
		["_price",0,[0]],
		["_condiitons","",[""]]
	];

	if ([_condiitons] call UnionClient_system_conditionsCheck) then {
		_details = [_className] call UnionClient_system_itemDetails;
		
		if (EQUAL(_displayName,"")) then {
			_list lbAdd format["%1",_details select 1];
		} else {
			_list lbAdd format["%1", _displayName];
		};		

		_list lbSetData [(lbSize _list)-1,_className];

		if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};

		_list lbSetValue [(lbSize _list)-1,_price];
		_list lbSetPicture [(lbSize _list)-1,_details select 2];
	
		_list lbSetTextRight [(lbSize _list)-1, format["  $%1", [_price] call UnionClient_system_numberText]];
	};
} foreach _configArray;

life_clothing_filter = _selection;