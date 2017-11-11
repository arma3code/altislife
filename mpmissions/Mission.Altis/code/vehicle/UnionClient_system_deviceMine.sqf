/*

	Filename: 	UnionClient_system_deviceMine.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {}; //Null was passed?
if (_vehicle GVAR ["mining",false]) exitWith {hint localize "STR_NOTF_DeviceIsMining";}; //Mining is already in process..

closeDialog 0;
call UnionClient_actions_inUse;

private _weight = [_vehicle] call UnionClient_system_vehicleWeight;
if ((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; life_action_inUse = false;};

private _gather = [] call UnionClient_gather_checkZone;
if (EQUAL(_gather,"")) exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_inUse = false;
};

private _side = M_CONFIG(getArray,"LifeCfgGather",_gather,"sides");
private _exit = false;
if !(EQUAL(_side,[])) then {
	private _playerSide = [playerSide] call UnionClient_system_convertSide;
	if !(_playerSide in _side) then {
		_exit = true;
	};
};
if (_exit) exitWith {
	hint "Для вашей фракции недоступна добыча этого ресурса";
	life_action_inUse = false;
};

private _device = M_CONFIG(getNumber,"LifeCfgGather",_gather,"device");
if (EQUAL(_device,0)) exitWith {
	hint "Данный ресурс нельзя добывать с помощью устройства";
	life_action_inUse = false;
};

private _conditions = M_CONFIG(getText,"LifeCfgGather",_gather,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgGather",_gather,"conditionsMessage")];
	life_action_inUse = false;
};

_vehicle SVAR ["mining",true,true]; //Lock the device
_vehicle remoteExec ["UnionClient_system_soundDevice",RCLIENT];
life_action_inUse = false; //Unlock it since it's going to do it's own thing...

private ["_vInv","_items","_space","_itemIndex","_sum","_itemWeight","_val"];
while {true} do {
	if (!alive _vehicle OR isNull _vehicle) exitWith {};
	if (isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	if (fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	
	titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
	_time = time + 27;

	waitUntil {
		uiSleep 0.2;
		if (isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
		if (round(_time - time) < 1) exitWith {true};
		false
	};
	
	if (isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	
	_vInv = _vehicle GVAR ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	if (_space < 0) exitWith {
		titleText["В багажнике дыра от ржавчины. Мы ее залатали, но придется начать заново","PLAIN"];
		[_vehicle,"Trunk"] call UnionClient_system_clearGlobalVar;
	};
	_itemIndex = [_gather,_items] call UnionClient_system_index;
	_weight = [_vehicle] call UnionClient_system_vehicleWeight;
	_sum = [_gather,20,_weight select 1,_weight select 0] call UnionClient_system_calWeightDiff; //Get a sum base of the remaining weight.. 
	
	if (_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	_itemWeight = (ITEM_WEIGHT(_gather)) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_gather,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_gather,_val + _sum]];
	};
		
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {		
		[_vehicle,(fuel _vehicle)-0.04] remoteExecCall ["UnionClient_system_setFuel",_vehicle];
	};
	
	if (fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	
	titleText[format[localize "STR_NOTF_DeviceMined",_sum],"PLAIN"];
	[_vehicle,"Trunk",[_items,_space + _itemWeight]] call CBA_fnc_setVarNet;
	_weight = [_vehicle] call UnionClient_system_vehicleWeight;
	_sum = [_gather,20,_weight select 1,_weight select 0] call UnionClient_system_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	uiSleep 2;
};

[_vehicle,"mining"] call UnionClient_system_clearGlobalVar;