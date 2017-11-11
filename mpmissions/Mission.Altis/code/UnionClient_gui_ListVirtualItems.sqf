/*

	Filename: 	UnionClient_gui_ListVirtualItems.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _list = param [0,controlNull,[controlNull]];
if (isNull _list) exitWith {};

private ["_value","_icon"];
{
	_value = ITEM_VALUE(configName _x);
	if (_value > 0) then {
		_list lbAdd format ["%1 x %2",_value,localize (getText(_x >> "displayName"))];
		_list lbSetData [(lbSize _list)-1,configName _x];
		_icon = getText (_x >> "icon");
		if !(EQUAL(_icon,"")) then {
			_list lbSetPicture [(lbSize _list)-1,_icon];
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));