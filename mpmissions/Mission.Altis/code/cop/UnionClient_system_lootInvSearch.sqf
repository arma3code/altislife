/*
	
	Filename: 	UnionClient_system_lootInvSearch.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_obj","_value","_data"];
_obj = cursorObject;
if(isNull _obj) exitWith {};
if(typeOf _obj != "Box_Wps_F") exitWith {};

_data = _obj GVAR ["Trunk",[[],0]];
if(count _data == 0) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;

{
	_var = _x select 0;
	_val = _x select 1;

	_index = [_var,life_illegal_items] call UnionClient_system_index;
	if(_index != -1) then {
		_value = _value + (_val * ((life_illegal_items select _index) select 1));
	};
} foreach (_data select 0);

if(_value > 0) then {
	hint format ["При обыске было изъято нелегальных вещей на сумму $%1",[_value] call UnionClient_system_numberText];
	["atm","add",_value,"CopLootInvSearch"] call UnionClient_system_myCash;
	[_obj] call UnionClient_system_clearVehicleTrunk;
} else {
	hint localize "STR_Cop_NoIllegalVeh";
};