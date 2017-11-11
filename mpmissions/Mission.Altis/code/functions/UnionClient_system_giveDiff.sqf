/*
	
	Filename: 	UnionClient_system_giveDiff.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_unit","_item","_val","_from"];
if !(EQUAL(_unit,player)) exitWith {};
private _bool = if (count _this > 4) then {true} else {false};
private _name = ITEM_NAME(_item);

if (_bool) then {
	if ([true,_item,(parseNumber _val)] call UnionClient_system_handleInv) then {
		hint format[localize "STR_MISC_TooMuch",GVAR_RNAME(_from),_val,_name];
	};
} else {
	if ([true,_item,(parseNumber _val)] call UnionClient_system_handleInv) then {
		hint format[localize "STR_MISC_TooMuch_2",GVAR_RNAME(_from),_val,_name];
	};
};