/*
	
	Filename: 	UnionClient_system_receiveItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if (_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call UnionClient_system_calWeightDiff;

if (_diff != (parseNumber _val)) then {
	if ([true,_item,_diff] call UnionClient_system_handleInv) then {
		hint format[localize "STR_MISC_TooMuch_3",GVAR_RNAME(_from),_val,_diff,((parseNumber _val) - _diff)];		
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["UnionClient_system_giveDiff",_from];
	} else {		
		[_from,_item,_val,_unit,false] remoteExecCall ["UnionClient_system_giveDiff",_from];
	};
} else {
	if ([true,_item,(parseNumber _val)] call UnionClient_system_handleInv) then {
		hint format[localize "STR_NOTF_GivenItem",GVAR_RNAME(_from),_val,ITEM_NAME(_item)];
	} else {		
		[_from,_item,_val,_unit,false] remoteExecCall ["UnionClient_system_giveDiff",_from];
	};
};