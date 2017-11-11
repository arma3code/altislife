/*
	
	Filename: 	UnionClient_system_keyDrop.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "No Data Selected";};
_index = _list lbData _sel;
if (_index == "") exitWith {hint "Невозможно выбросить эти ключи"};

_vehicle = life_vehicles select parseNumber(_index);
if(_vehicle isKindOf "House_F") exitWith {hint "Вы не можете выбросить ключи от дома"};
_owners = _vehicle GVAR "vehicle_info_owners";

_index2 = [steamid,_owners] call UnionClient_system_index;
life_vehicles = life_vehicles - [_vehicle];
_owners set[parseNumber(_index),-1];
_owners = _owners - [-1];
_vehicle SVAR ["vehicle_info_owners",_owners,true];

[] call UnionClient_system_keyMenu;