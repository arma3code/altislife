/*

	Filename: 	UnionClient_system_vehStoreItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 3503),-1)) exitWith {hint localize "STR_Global_NoSelection";};
private _storeall = param [0,false,[true]];
private _ctrl = CONTROL_DATA(3503);

if ((typeOf life_trunk_vehicle) in (LIFE_SETTINGS(getArray,"life_cantStoreItems"))) exitWith {hint "В этот тип хранилища ничего нельзя положить"};
private _conditions = M_CONFIG(getText,"LifeCfgVirtualItems",_ctrl,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {hint "Данный предмет нельзя положить в это хранилище"};

private _exit = "";
if (LIFE_SETTINGS(getNumber,"life_useFuelTrucks") isEqualTo 1) then {
	private _truck = typeOf life_trunk_vehicle;
	if (EQUAL(_truck,"Land_LuggageHeap_03_F")) exitWith {};

	private _fuelStuff = LIFE_SETTINGS(getArray,"life_fuelStuff");
	private _fuelTrucks = LIFE_SETTINGS(getArray,"life_fuelTrucks");
	
	switch (true) do {
		case (!(_ctrl in _fuelStuff) && (_truck in _fuelTrucks)): {_exit = "Топливозаправщики могут перевозить только нефть и уран"}; //NonFuel in FuelTruck -> Nope
		case ((_ctrl in _fuelStuff) && !(_truck in _fuelTrucks)): {_exit = "Уран и нефть можно перевозить только в топливозаправщиках"}; //Fuel in NonFuelTruck -> Nope!
	};
};
if !(EQUAL(_exit,"")) exitWith {hint _exit};

private _num = ctrlText 3506;
if !([_num] call UnionClient_system_isnumber) exitWith {hint "Укажите количество в цифровом формате, а не символьном";};

_num = parseNumber(_num);
if (_num < 1) exitWith {hint "Серьезно?"};

if (_storeall) then {_num = ITEM_VALUE(_ctrl)}; 

private "_totalWeight";
switch (typeOf life_trunk_vehicle) do { 
	case "Land_LuggageHeap_03_F" : {
		private _house_box_slots = life_trunk_vehicle GVAR ["house_box_slots",0];
		private _mWeight = (LIFE_SETTINGS(getNumber,"life_virtualMax")) * _house_box_slots;
		_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];
	}; 
	case (LIFE_SETTINGS(getText,"life_trunkClass")): {
		private _trunk_slots = life_trunk_vehicle GVAR ["slots",1];
		private _mWeight = (LIFE_SETTINGS(getNumber,"life_trunkVirtualWeight")) * _trunk_slots;
		_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];		
	};
	case (LIFE_SETTINGS(getText,"life_vaultBoxClass")): {
		private _mWeight = LIFE_SETTINGS(getNumber,"life_vaultBoxVirtualWeight");
		_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];		
	};
	default {
		_totalWeight = [life_trunk_vehicle] call UnionClient_system_vehicleWeight;
	}; 
};

private _inv = (life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0;

private _itemWeight = (ITEM_WEIGHT(_ctrl)) * _num;
if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Техника переполнена или нет места для такого количества."};
if !([false,_ctrl,_num] call UnionClient_system_handleInv) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};

private _index = [_ctrl,_inv] call UnionClient_system_index;
if (EQUAL(_index,-1)) then {
	_inv pushBack [_ctrl,_num];
} else {
	_val = _inv select _index select 1;
	_inv set[_index,[_ctrl,_val + _num]];
};

private _vehTotalWeight = 0;
{
	_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
	_vehTotalWeight = _vehTotalWeight + _itemWeight;	  
} forEach _inv;

[life_trunk_vehicle,"Trunk",[_inv,_vehTotalWeight]] call CBA_fnc_setVarNet;
[life_trunk_vehicle] call UnionClient_system_vehInventory;
