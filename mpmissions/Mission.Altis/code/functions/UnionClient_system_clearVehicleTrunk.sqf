/*

	Filename: 	UnionClient_system_clearVehicleTrunk.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};

private _vehInv = _vehicle GVAR ["Trunk",[[],0]];
if (EQUAL((_vehInv select 0),[])) exitWith {};

_vehInv params ["_vehInvData","_vehInvVal"];

private ["_var","_val","_index"];
{
	_var = _x select 0;
	_val = _x select 1;

	_index = [_var,life_illegal_items] call UnionClient_system_index;
	if !(EQUAL(_index,-1)) then {
		_vehInvData set [_forEachIndex,-1];
		_vehInvVal = _vehInvVal - ((ITEM_WEIGHT(_var)) * _val);
	};
} foreach _vehInvData;

_vehInvData = _vehInvData - [-1];

if (EQUAL(_vehInvData,[])) then {
	[_vehicle,"Trunk"] call UnionClient_system_clearGlobalVar;
} else {	
	[_vehicle,"Trunk",[_vehInvData,_vehInvVal]] call CBA_fnc_setVarNet;
};