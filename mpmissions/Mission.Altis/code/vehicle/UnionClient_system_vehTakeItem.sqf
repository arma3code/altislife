/*

	Filename: 	UnionClient_system_vehTakeItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_ctrl","_num","_index","_data","_old","_value","_diff","_storeall","_vehTotalWeight"];
_storeall = [_this,0,false,[true]] call BIS_fnc_param;
disableSerialization;
if (isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint localize "STR_MISC_VehDoesntExist"};
if (LSNOTALIVE(player)) exitwith {closeDialog 0;};

if (EQUAL((lbCurSel 3502),-1)) exitWith {hint localize "STR_Global_NoSelection";};
_ctrl = CONTROL_DATA(3502);
_num = ctrlText 3505;
if (!([_num] call UnionClient_system_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint localize "STR_MISC_Under1";};

_index = [_ctrl,((life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0)] call UnionClient_system_index;
_data = (life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0;
_old = life_trunk_vehicle GVAR ["Trunk",[[],0]];
if (EQUAL(_index,-1)) exitWith {};
_value = _data select _index select 1;
if (_num > _value) exitWith {hint localize "STR_MISC_NotEnough"};
if (_storeall) then {_num = _value};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call UnionClient_system_calWeightDiff;
if (EQUAL(_num,0)) exitWith {hint localize "STR_NOTF_InvFull"};
if (EQUAL(_ctrl,"money") OR EQUAL(_ctrl,"dmoney")) then {
	if (EQUAL(_num,_value)) then {
		_data set[_index,-1];
		_data = _data - [-1];
	} else {
		_data set[_index,[_ctrl,(_value - _num)]];
	};

	if (EQUAL(_ctrl,"money")) then {
		["cash","add",_num,"vehTakeItem"] call UnionClient_system_myCash;
	} else {
		if (playerSide in [west,east]) then {
			["cash","add",_num,"vehTakeItem"] call UnionClient_system_myCash;
		} else {
			["dcash","add",_num,"vehTakeItem"] call UnionClient_system_myCash;
		};
	};
	
	_vehTotalWeight = 0;
	{
		_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
		_vehTotalWeight = _vehTotalWeight + _itemWeight;	  
	} forEach _data;
	
	[life_trunk_vehicle,"Trunk",[_data,_vehTotalWeight]] call CBA_fnc_setVarNet;
	[life_trunk_vehicle] call UnionClient_system_vehInventory;
} else {
	if ([true,_ctrl,_num] call UnionClient_system_handleInv) then {
		if(EQUAL(_num,_value)) then {
			_data set[_index,-1];
			_data = _data - [-1];
		} else {
			_data set[_index,[_ctrl,(_value - _num)]];
		};

		_vehTotalWeight = 0;
		{
			_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
			_vehTotalWeight = _vehTotalWeight + _itemWeight;
		} forEach _data;

		[life_trunk_vehicle,"Trunk",[_data,_vehTotalWeight]] call CBA_fnc_setVarNet;
		[life_trunk_vehicle] call UnionClient_system_vehInventory;
	} else {
		hint localize "STR_NOTF_InvFull";
	};
};