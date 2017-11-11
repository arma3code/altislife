/*

	Filename: 	UnionClient_system_containerMenuFilter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _index = param [1,-1,[0]];
if (EQUAL(_index,-1)) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

SVAR_UINS ["House_Container_Filter",_index];

private _houseGear = CONTROL(4100,4102);
private _playerGear = CONTROL(4100,4103);
private _houseWeight = CONTROL(4100,4104);

lbClear _houseGear;
lbClear _playerGear;

private _house_box_slots = life_house_box GVAR ["house_box_slots",0];
private _house_box_inventory = life_house_box GVAR ["house_box_inventory",[[],0]];

private _playerItems = [] call UnionClient_system_getPlayerItems;

private _containerItems = _house_box_inventory select 0;
private _currentWeight = _house_box_inventory select 1;
private _maxWeight = (LIFE_SETTINGS(getNumber,"life_inventoryMax")) * _house_box_slots; 

_houseWeight ctrlSetText format[(localize "STR_MISC_Weight") + " %1/%2",_currentWeight,_maxWeight];

private ["_itemInfo","_good"];
{
	_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
	if (EQUAL(_itemInfo,[])) exitWith {};
	_good = false;

	switch (_index) do {
		case 0: {_good = true};
		case 1: {
			_good = if (EQUAL((_itemInfo select 4),"Equipment")) then {true} else {false};
		};
		case 2: {
			_good = if (EQUAL((_itemInfo select 4),"Weapon")) then {true} else {false};
		};
		case 3: {
			_good = if (EQUAL((_itemInfo select 4),"Magazine") && !(EQUAL((_itemInfo select 5),"UnknownMagazine"))) then {true} else {false};
		};
		case 4: {
			_good = if (EQUAL((_itemInfo select 4),"Item") && ((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
		};
		case 5: {
			_good = if (EQUAL((_itemInfo select 4),"Item") && !((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
		};
	};

	if (_good) then {
		if (_x select 1 > 1) then {
			_playerGear lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_playerGear lbAdd format["%1",_itemInfo select 1];
		};
		_playerGear lbSetData[(lbSize _playerGear)-1,_itemInfo select 0];
		_playerGear lbSetPicture[(lbSize _playerGear)-1,_itemInfo select 2];
	};
} foreach _playerItems;

{
	_good = false;
	_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
	if !(EQUAL(_itemInfo,[])) then {
		switch (_index) do {
			case 0: {_good = true};
			case 1: {
				_good = if (EQUAL((_itemInfo select 4),"Equipment")) then {true} else {false};
			};
			case 2: {
				_good = if (EQUAL((_itemInfo select 4),"Weapon")) then {true} else {false};
			};
			case 3: {
				_good = if (EQUAL((_itemInfo select 4),"Magazine") && !(EQUAL((_itemInfo select 5),"UnknownMagazine"))) then {true} else {false};
			};
			case 4: {
				_good = if (EQUAL((_itemInfo select 4),"Item") && ((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
			};
			case 5: {
				_good = if (EQUAL((_itemInfo select 4),"Item") && !((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
			};
		};
	};

	if (_good) then	{
		if(_x select 1 > 1) then {
			_houseGear lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_houseGear lbAdd format["%1",_itemInfo select 1];
		};
		_houseGear lbSetData[(lbSize _houseGear)-1,_itemInfo select 0];
		_houseGear lbSetPicture[(lbSize _houseGear)-1,_itemInfo select 2];
	};
} foreach _containerItems;

lbSort [_playerGear,"ASC"];
lbSort [_houseGear,"ASC"];

_playerGear lbSetCurSel 0;
_houseGear lbSetCurSel 0;